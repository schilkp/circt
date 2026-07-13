//===- ModuleToTransferFunction.cpp - Convert to Transfer Function -*- C++ -==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/Seq/SeqOps.h"
#include "circt/Support/LLVM.h"
#include "mlir/IR/IRMapping.h"
#include "mlir/Pass/Pass.h"
#include "llvm/ADT/DenseSet.h"
#include "llvm/Support/ErrorHandling.h"
#include <functional>

namespace circt {
namespace hw {
#define GEN_PASS_DEF_MODULETOTRANSFERFUNCTION
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace mlir;
using namespace circt;

namespace {

struct ModuleToTransferFunctionPass
    : public circt::hw::impl::ModuleToTransferFunctionBase<
          ModuleToTransferFunctionPass> {
  void runOnOperation() override;
};

} // namespace

static std::string sanitizeName(std::string name) {
  for (char &c : name) {
    if (!std::isalnum(c) && c != '_')
      c = '_';
  }
  return name;
}

static std::string getSanitizedRegName(seq::FirRegOp reg, size_t index) {
  std::string name = reg.getName().str();
  if (name.empty())
    return "reg_" + std::to_string(index);
  return sanitizeName(name);
}

static StringRef getMemoryName(OpBuilder &builder, seq::FirMemOp &mem,
                               size_t &index) {
  StringAttr nameAttr = mem.getNameAttr();
  StringAttr name;
  if (nameAttr && nameAttr.size() != 0) {
    name = nameAttr;
  } else {
    name = builder.getStringAttr(std::to_string(index));
    mem.setNameAttr(name);
    index++;
  }
  return name.getValue();
}

void ModuleToTransferFunctionPass::runOnOperation() {
  auto topModule = getOperation();
  OpBuilder builder(topModule.getOperation()->getContext());

  // Gather all seq.firreg ops in the module
  llvm::SmallVector<seq::FirRegOp> firregs;
  for (auto &op : *topModule.getBodyBlock()) {
    if (auto reg = dyn_cast<seq::FirRegOp>(&op)) {
      firregs.push_back(reg);
    }
  }

  // Gather all seq.firmem.read_port, seq.firmem.write_port, and
  // seq.firmem.read_w_port ops in the module
  size_t unknownMemId = 0;
  llvm::SmallVector<seq::FirMemReadOp> memReads;
  llvm::SmallVector<llvm::StringRef> memReadsName;
  llvm::SmallVector<seq::FirMemWriteOp> memWrites;
  llvm::SmallVector<llvm::StringRef> memWritesName;
  llvm::SmallVector<seq::FirMemReadWriteOp> memReadWrites;
  llvm::SmallVector<llvm::StringRef> memReadWritesName;
  for (auto &op : *topModule.getBodyBlock()) {
    if (auto r = dyn_cast<seq::FirMemReadOp>(&op)) {
      memReads.push_back(r);
      auto mem = r.getMemory().getDefiningOp<seq::FirMemOp>();
      memReadsName.push_back(getMemoryName(builder, mem, unknownMemId));
    } else if (auto w = dyn_cast<seq::FirMemWriteOp>(&op)) {
      memWrites.push_back(w);
      auto mem = w.getMemory().getDefiningOp<seq::FirMemOp>();
      memWritesName.push_back(getMemoryName(builder, mem, unknownMemId));
    } else if (auto rw = dyn_cast<seq::FirMemReadWriteOp>(&op)) {
      memReadWrites.push_back(rw);
      auto mem = rw.getMemory().getDefiningOp<seq::FirMemOp>();
      memReadWritesName.push_back(getMemoryName(builder, mem, unknownMemId));
    }
  }

  // Define the set of outputs for the transfer function
  llvm::DenseSet<Value> tfOutputs;

  // Trace from original outputs
  auto outOp = cast<hw::OutputOp>(topModule.getBodyBlock()->getTerminator());
  for (auto operand : outOp->getOperands()) {
    tfOutputs.insert(operand);
  }

  // Trace from register next values
  for (auto reg : firregs) {
    tfOutputs.insert(reg.getNext());
  }

  // Trace from memory read ports
  for (auto port : memReads) {
    tfOutputs.insert(port.getAddress());
    if (port.getEnable()) {
      tfOutputs.insert(port.getEnable());
    }
  }

  // Trace from memory write ports
  for (auto port : memWrites) {
    tfOutputs.insert(port.getAddress());
    if (port.getEnable()) {
      tfOutputs.insert(port.getEnable());
    }
    tfOutputs.insert(port.getData());
    if (port.getMask()) {
      tfOutputs.insert(port.getMask());
    }
  }

  // Trace from memory read-write ports
  for (auto port : memReadWrites) {
    tfOutputs.insert(port.getAddress());
    if (port.getEnable()) {
      tfOutputs.insert(port.getEnable());
    }
    tfOutputs.insert(port.getWriteData());
    tfOutputs.insert(port.getMode());
    if (port.getMask()) {
      tfOutputs.insert(port.getMask());
    }
  }

  // Single transitive backward trace starting from the transfer function
  // outputs
  llvm::DenseSet<Value> visitedDeps;
  llvm::DenseSet<Operation *> neededOps;
  llvm::DenseSet<Value> neededInputs;

  std::function<void(Value)> traceDeps = [&](Value v) {
    if (!v || !visitedDeps.insert(v).second)
      return;
    if (auto arg = llvm::dyn_cast<BlockArgument>(v)) {
      if (arg.getOwner() == topModule.getBodyBlock())
        neededInputs.insert(arg);
      return;
    }
    if (auto *op = v.getDefiningOp()) {
      // If it is a state element or memory port, it acts as a boundary input
      if (isa<seq::FirRegOp>(op) || isa<seq::FirMemReadOp>(op) ||
          isa<seq::FirMemReadWriteOp>(op)) {
        neededInputs.insert(v);
        return;
      }
      if (isa<seq::FirMemOp>(op) || isa<seq::FirMemWriteOp>(op)) {
        return;
      }
      neededOps.insert(op);
      for (auto operand : op->getOperands()) {
        traceDeps(operand);
      }
    }
  };

  for (auto val : tfOutputs) {
    traceDeps(val);
  }

  // Gather inputs that are transitively needed
  llvm::SmallVector<Value> neededModuleInputs;
  for (auto arg : topModule.getBodyBlock()->getArguments()) {
    if (neededInputs.count(arg)) {
      neededModuleInputs.push_back(arg);
    }
  }

  // 1. Create the port list for the new transfer function module
  hw::ModulePortInfo originalPorts(topModule.getPortList());

  SmallVector<hw::PortInfo> inputs;
  SmallVector<hw::PortInfo> outputs;

  // Actual module signal inputs
  for (auto val : neededModuleInputs) {
    auto arg = cast<BlockArgument>(val);
    unsigned argIdx = arg.getArgNumber();
    auto originalPort = originalPorts.atInput(argIdx);

    hw::PortInfo p;
    p.name = builder.getStringAttr("in_" + originalPort.getName().str());
    p.type = originalPort.type;
    p.dir = hw::ModulePort::Direction::Input;
    p.argNum = inputs.size();
    inputs.push_back(p);
  }

  // Firreg output values
  for (size_t i = 0; i < firregs.size(); ++i) {
    auto reg = firregs[i];
    hw::PortInfo p;
    p.name = builder.getStringAttr("reg_" + getSanitizedRegName(reg, i));
    p.type = reg.getType();
    p.dir = hw::ModulePort::Direction::Input;
    p.argNum = inputs.size();
    inputs.push_back(p);
  }

  // Memory read port data outputs
  for (size_t i = 0; i < memReads.size(); ++i) {
    auto port = memReads[i];
    auto name = std::string(memReadsName[i]);
    hw::PortInfo p;
    p.name = builder.getStringAttr("mem_" + sanitizeName(name) + "_r_" +
                                   std::to_string(i) + "_data");
    p.type = port.getData().getType();
    p.dir = hw::ModulePort::Direction::Input;
    p.argNum = inputs.size();
    inputs.push_back(p);
  }

  // Memory read-write port read data outputs
  for (size_t i = 0; i < memReadWrites.size(); ++i) {
    auto port = memReadWrites[i];
    auto name = std::string(memReadWritesName[i]);
    hw::PortInfo p;
    p.name = builder.getStringAttr("mem_" + sanitizeName(name) + "_rw_" +
                                   std::to_string(i) + "_rdata");
    p.type = port.getReadData().getType();
    p.dir = hw::ModulePort::Direction::Input;
    p.argNum = inputs.size();
    inputs.push_back(p);
  }

  // Actual module outputs
  for (size_t i = 0; i < originalPorts.sizeOutputs(); ++i) {
    auto originalPort = originalPorts.atOutput(i);

    hw::PortInfo p;
    p.name = builder.getStringAttr("out_" + originalPort.getName().str());
    p.type = originalPort.type;
    p.dir = hw::ModulePort::Direction::Output;
    p.argNum = outputs.size();
    outputs.push_back(p);
  }

  // Firreg input values
  for (size_t i = 0; i < firregs.size(); ++i) {
    auto reg = firregs[i];
    hw::PortInfo p;
    p.name =
        builder.getStringAttr("reg_" + getSanitizedRegName(reg, i) + "_next");
    p.type = reg.getType();
    p.dir = hw::ModulePort::Direction::Output;
    p.argNum = outputs.size();
    outputs.push_back(p);
  }

  // Memory read ports address and enable
  for (size_t i = 0; i < memReads.size(); ++i) {
    auto port = memReads[i];
    auto name = std::string(memReadsName[i]);
    hw::PortInfo pAddr;
    pAddr.name = builder.getStringAttr("mem_" + sanitizeName(name) + "_r_" +
                                       std::to_string(i) + "_addr");
    pAddr.type = port.getAddress().getType();
    pAddr.dir = hw::ModulePort::Direction::Output;
    pAddr.argNum = outputs.size();
    outputs.push_back(pAddr);

    if (port.getEnable()) {
      hw::PortInfo pEn;
      pEn.name = builder.getStringAttr("mem_" + sanitizeName(name) + "_r_" +
                                       std::to_string(i) + "_en");
      pEn.type = port.getEnable().getType();
      pEn.dir = hw::ModulePort::Direction::Output;
      pEn.argNum = outputs.size();
      outputs.push_back(pEn);
    }
  }

  // Memory write ports address, enable, data, mask
  for (size_t i = 0; i < memWrites.size(); ++i) {
    auto port = memWrites[i];
    auto name = std::string(memWritesName[i]);

    hw::PortInfo pAddr;
    pAddr.name = builder.getStringAttr("mem_" + sanitizeName(name) + "_w_" +
                                       std::to_string(i) + "_addr");
    pAddr.type = port.getAddress().getType();
    pAddr.dir = hw::ModulePort::Direction::Output;
    pAddr.argNum = outputs.size();
    outputs.push_back(pAddr);

    if (port.getEnable()) {
      hw::PortInfo pEn;
      pEn.name = builder.getStringAttr("mem_" + sanitizeName(name) + "_w_" +
                                       std::to_string(i) + "_en");
      pEn.type = port.getEnable().getType();
      pEn.dir = hw::ModulePort::Direction::Output;
      pEn.argNum = outputs.size();
      outputs.push_back(pEn);
    }

    hw::PortInfo pData;
    pData.name = builder.getStringAttr("mem_" + sanitizeName(name) + "_w_" +
                                       std::to_string(i) + "_data");
    pData.type = port.getData().getType();
    pData.dir = hw::ModulePort::Direction::Output;
    pData.argNum = outputs.size();
    outputs.push_back(pData);

    if (port.getMask()) {
      hw::PortInfo pMask;
      pMask.name = builder.getStringAttr("mem_" + sanitizeName(name) + "_w_" +
                                         std::to_string(i) + "_mask");
      pMask.type = port.getMask().getType();
      pMask.dir = hw::ModulePort::Direction::Output;
      pMask.argNum = outputs.size();
      outputs.push_back(pMask);
    }
  }

  // Memory read-write ports address, enable, wdata, wmode, mask
  for (size_t i = 0; i < memReadWrites.size(); ++i) {
    auto port = memReadWrites[i];
    auto name = std::string(memReadWritesName[i]);

    hw::PortInfo pAddr;
    pAddr.name = builder.getStringAttr("mem_" + sanitizeName(name) + "_rw_" +
                                       std::to_string(i) + "_addr");
    pAddr.type = port.getAddress().getType();
    pAddr.dir = hw::ModulePort::Direction::Output;
    pAddr.argNum = outputs.size();
    outputs.push_back(pAddr);

    if (port.getEnable()) {
      hw::PortInfo pEn;
      pEn.name = builder.getStringAttr("mem_" + sanitizeName(name) + "_rw_" +
                                       std::to_string(i) + "_en");
      pEn.type = port.getEnable().getType();
      pEn.dir = hw::ModulePort::Direction::Output;
      pEn.argNum = outputs.size();
      outputs.push_back(pEn);
    }

    hw::PortInfo pData;
    pData.name = builder.getStringAttr("mem_" + sanitizeName(name) + "_rw_" +
                                       std::to_string(i) + "_wdata");
    pData.type = port.getWriteData().getType();
    pData.dir = hw::ModulePort::Direction::Output;
    pData.argNum = outputs.size();
    outputs.push_back(pData);

    hw::PortInfo pMode;
    pMode.name = builder.getStringAttr("mem_" + sanitizeName(name) + "_rw_" +
                                       std::to_string(i) + "_wmode");
    pMode.type = port.getMode().getType();
    pMode.dir = hw::ModulePort::Direction::Output;
    pMode.argNum = outputs.size();
    outputs.push_back(pMode);

    if (port.getMask()) {
      hw::PortInfo pMask;
      pMask.name = builder.getStringAttr("mem_" + sanitizeName(name) + "_rw_" +
                                         std::to_string(i) + "_mask");
      pMask.type = port.getMask().getType();
      pMask.dir = hw::ModulePort::Direction::Output;
      pMask.argNum = outputs.size();
      outputs.push_back(pMask);
    }
  }

  hw::ModulePortInfo tfPorts(inputs, outputs);

  // 2. Create the transfer function module
  builder.setInsertionPoint(topModule);
  std::string newModName = (topModule.getModuleName() + "_transfer").str();
  auto tfModule = hw::HWModuleOp::create(
      builder, topModule.getLoc(), builder.getStringAttr(newModName), tfPorts);

  // 3. Map values from topModule to tfModule
  IRMapping mapping;
  auto *tfBlock = tfModule.getBodyBlock();

  for (size_t i = 0; i < neededModuleInputs.size(); ++i) {
    mapping.map(neededModuleInputs[i], tfBlock->getArgument(i));
  }
  for (size_t i = 0; i < firregs.size(); ++i) {
    mapping.map(firregs[i].getResult(),
                tfBlock->getArgument(neededModuleInputs.size() + i));
  }
  for (size_t i = 0; i < memReads.size(); ++i) {
    mapping.map(
        memReads[i].getData(),
        tfBlock->getArgument(neededModuleInputs.size() + firregs.size() + i));
  }
  for (size_t i = 0; i < memReadWrites.size(); ++i) {
    mapping.map(memReadWrites[i].getReadData(),
                tfBlock->getArgument(neededModuleInputs.size() +
                                     firregs.size() + memReads.size() + i));
  }

  // 4. Clone all needed combinational ops into tfModule (first pass: clone and
  // map results only)
  builder.setInsertionPoint(tfBlock->getTerminator());
  llvm::SmallVector<Operation *> clonedOps;
  for (auto &op : *topModule.getBodyBlock()) {
    if (neededOps.count(&op)) {
      auto *clonedOp = builder.clone(op);
      clonedOps.push_back(clonedOp);
      for (auto [origRes, clonedRes] :
           llvm::zip(op.getResults(), clonedOp->getResults())) {
        mapping.map(origRes, clonedRes);
      }
    }
  }

  // Second pass: remap all operands of the cloned operations using the complete
  // mapping!
  for (auto *clonedOp : clonedOps) {
    for (unsigned i = 0; i < clonedOp->getNumOperands(); ++i) {
      Value origOperand = clonedOp->getOperand(i);
      clonedOp->setOperand(i, mapping.lookup(origOperand));
    }
  }

  // 5. Build outputs of tfModule
  builder.setInsertionPoint(tfBlock->getTerminator());
  auto originalOutputOp =
      cast<hw::OutputOp>(topModule.getBodyBlock()->getTerminator());
  SmallVector<Value> tfOutputsValues;
  for (auto operand : originalOutputOp->getOperands()) {
    tfOutputsValues.push_back(mapping.lookup(operand));
  }
  for (size_t i = 0; i < firregs.size(); ++i) {
    Value nextVal = firregs[i].getNext();
    tfOutputsValues.push_back(mapping.lookup(nextVal));
  }
  for (auto port : memReads) {
    tfOutputsValues.push_back(mapping.lookup(port.getAddress()));
    if (port.getEnable()) {
      tfOutputsValues.push_back(mapping.lookup(port.getEnable()));
    }
  }
  for (auto port : memWrites) {
    tfOutputsValues.push_back(mapping.lookup(port.getAddress()));
    if (port.getEnable()) {
      tfOutputsValues.push_back(mapping.lookup(port.getEnable()));
    }
    tfOutputsValues.push_back(mapping.lookup(port.getData()));
    if (port.getMask()) {
      tfOutputsValues.push_back(mapping.lookup(port.getMask()));
    }
  }
  for (auto port : memReadWrites) {
    tfOutputsValues.push_back(mapping.lookup(port.getAddress()));
    if (port.getEnable()) {
      tfOutputsValues.push_back(mapping.lookup(port.getEnable()));
    }
    tfOutputsValues.push_back(mapping.lookup(port.getWriteData()));
    tfOutputsValues.push_back(mapping.lookup(port.getMode()));
    if (port.getMask()) {
      tfOutputsValues.push_back(mapping.lookup(port.getMask()));
    }
  }
  SmallVector<Value> tfOutputsWithTFOp;
  tfOutputsWithTFOp.reserve(tfOutputsValues.size());
  for (size_t i = 0; i < tfOutputsValues.size(); ++i) {
    auto tfOp = builder.create<hw::TFOutputOp>(
        topModule.getLoc(), tfOutputsValues[i], outputs[i].name);
    tfOutputsWithTFOp.push_back(tfOp.getResult());
  }
  tfBlock->getTerminator()->setOperands(tfOutputsWithTFOp);

  SmallVector<Attribute> outputNames;
  for (const auto &p : outputs)
    outputNames.push_back(p.name);
  tfBlock->getTerminator()->setAttr("output_names",
                                    builder.getArrayAttr(outputNames));

  // 6. Instantiate the transfer function module in topModule
  builder.setInsertionPoint(originalOutputOp);
  SmallVector<Value> instOperands;
  for (auto val : neededModuleInputs) {
    instOperands.push_back(val);
  }
  for (auto reg : firregs) {
    instOperands.push_back(reg.getResult());
  }
  for (auto port : memReads) {
    instOperands.push_back(port.getData());
  }
  for (auto port : memReadWrites) {
    instOperands.push_back(port.getReadData());
  }

  auto instOp = hw::InstanceOp::create(
      builder, topModule.getLoc(), tfModule,
      builder.getStringAttr(topModule.getModuleName().str() + "_inst"),
      instOperands);

  // 7. Update originalOutputOp operands and firreg/memory input operands in
  // topModule
  size_t numOutputs = originalPorts.sizeOutputs();
  originalOutputOp->setOperands(instOp.getResults().take_front(numOutputs));

  size_t resultIdx = numOutputs;
  for (auto &firreg : firregs) {
    firreg->setOperand(0, instOp.getResult(resultIdx++));
  }
  for (auto port : memReads) {
    port.getAddressMutable().assign(instOp.getResult(resultIdx++));
    if (port.getEnable()) {
      port.getEnableMutable().assign(instOp.getResult(resultIdx++));
    }
  }
  for (auto port : memWrites) {
    port.getAddressMutable().assign(instOp.getResult(resultIdx++));
    if (port.getEnable()) {
      port.getEnableMutable().assign(instOp.getResult(resultIdx++));
    }
    port.getDataMutable().assign(instOp.getResult(resultIdx++));
    if (port.getMask()) {
      port.getMaskMutable().assign(instOp.getResult(resultIdx++));
    }
  }
  for (auto port : memReadWrites) {
    port.getAddressMutable().assign(instOp.getResult(resultIdx++));
    if (port.getEnable()) {
      port.getEnableMutable().assign(instOp.getResult(resultIdx++));
    }
    port.getWriteDataMutable().assign(instOp.getResult(resultIdx++));
    port.getModeMutable().assign(instOp.getResult(resultIdx++));
    if (port.getMask()) {
      port.getMaskMutable().assign(instOp.getResult(resultIdx++));
    }
  }

  // 8. Safely erase original combinational ops in topModule
  llvm::SmallVector<Operation *> ops;
  for (auto &op : *topModule.getBodyBlock()) {
    if (isa<hw::OutputOp>(&op) || isa<seq::FirRegOp>(&op) ||
        &op == instOp.getOperation())
      continue;
    if (isa<seq::FirMemOp>(&op) || isa<seq::FirMemReadOp>(&op) ||
        isa<seq::FirMemWriteOp>(&op) || isa<seq::FirMemReadWriteOp>(&op))
      continue;
    ops.push_back(&op);
  }

  bool changed;
  do {
    changed = false;
    for (auto *it = ops.begin(); it != ops.end();) {
      auto *op = *it;
      if (op->use_empty()) {
        op->erase();
        it = ops.erase(it);
        changed = true;
      } else {
        ++it;
      }
    }
  } while (changed);
}
