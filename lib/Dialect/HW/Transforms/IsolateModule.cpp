//===- IsolateModule.cpp - Isolate a single module --------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This pass keeps only the module with the specified name in the top-level
// module, and erases all other operations in the top-level module.
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/HW/HWOps.h"
#include "circt/Dialect/HW/HWPasses.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/Pass/Pass.h"

namespace circt {
namespace hw {
#define GEN_PASS_DEF_ISOLATEMODULE
#include "circt/Dialect/HW/Passes.h.inc"
} // namespace hw
} // namespace circt

using namespace mlir;
using namespace circt;
using namespace hw;

namespace {
struct IsolateModulePass
    : public circt::hw::impl::IsolateModuleBase<IsolateModulePass> {
  using Base::Base;

  void runOnOperation() override {
    auto moduleOp = getOperation();
    Operation *targetModule = nullptr;

    // Search for the module with the specified symbol name
    for (auto &op : llvm::make_early_inc_range(moduleOp.getOps())) {
      auto symOp = dyn_cast<SymbolOpInterface>(op);
      if (symOp && symOp.getName() == moduleName) {
        targetModule = &op;
        break;
      }
    }

    if (!targetModule) {
      moduleOp.emitError() << "Module '" << moduleName << "' not found.";
      signalPassFailure();
      return;
    }

    // Erase all other operations
    for (auto &op : llvm::make_early_inc_range(moduleOp.getOps())) {
      if (&op != targetModule) {
        op.erase();
      }
    }
  }
};
} // end anonymous namespace
