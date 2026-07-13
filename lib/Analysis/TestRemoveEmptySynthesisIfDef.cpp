//===- TestRemoveEmptySynthesisIfDef.cpp - Remove Empty Synthesis IfDefs ===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements basic test passes to:
// 1. Remove sv.ifdef @SYNTHESIS blocks if their true-block is empty.
// 2. Strip out specific sv.macro.decl macros (e.g., SYNTHESIS, PRINTF_COND,
//    PRINTF_COND_) and strip references to emit.fragments attributes containing them.
// 3. Strip out sv.always constructs if they only contain ifs/asserts.
//
//===----------------------------------------------------------------------===//

#include "circt/Dialect/SV/SVOps.h"
#include "mlir/Pass/Pass.h"

using namespace mlir;
using namespace circt;

namespace {
struct TestRemoveEmptySynthesisIfDefPass
    : public PassWrapper<TestRemoveEmptySynthesisIfDefPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(TestRemoveEmptySynthesisIfDefPass)

  void runOnOperation() override {
    auto module = getOperation();
    module.walk([&](sv::IfDefOp op) {
      if (op.getCondAttr().getName() == "SYNTHESIS") {
        bool thenIsEmpty = true;
        if (!op.getThenRegion().empty()) {
          auto &block = op.getThenRegion().front();
          for (auto &innerOp : block.getOperations()) {
            if (!innerOp.hasTrait<OpTrait::IsTerminator>()) {
              thenIsEmpty = false;
              break;
            }
          }
        }

        if (thenIsEmpty) {
          op.erase();
        }
      }
    });
  }

  StringRef getArgument() const override { return "test-remove-empty-synthesis-ifdef"; }
  StringRef getDescription() const override {
    return "Remove sv.ifdef @SYNTHESIS blocks if their true-block is empty";
  }
};

struct TestStripMacrosAndFragmentsPass
    : public PassWrapper<TestStripMacrosAndFragmentsPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(TestStripMacrosAndFragmentsPass)

  void runOnOperation() override {
    auto module = getOperation();
    SmallVector<Operation *, 4> opsToErase;

    // Helper to check if a macro name matches the ones we want to strip
    auto isTargetMacro = [](StringRef name) {
      return name == "SYNTHESIS" || name == "PRINTF_COND" || name == "PRINTF_COND_";
    };

    // Helper to check if a fragment references target macros or is PRINTF_COND_FRAGMENT
    auto isTargetFragment = [&](Operation *op) {
      if (auto fragOp = dyn_cast<sv::MacroDeclOp>(op)) {
        return isTargetMacro(fragOp.getSymName());
      }
      if (op->getName().getStringRef() == "emit.fragment") {
        if (auto symNameAttr = op->getAttrOfType<StringAttr>("sym_name")) {
          return symNameAttr.getValue() == "PRINTF_COND_FRAGMENT";
        }
      }
      return false;
    };

    // Collect sv.macro.decl and emit.fragment ops to delete
    for (auto &op : llvm::make_early_inc_range(module.getBody()->getOperations())) {
      if (isTargetFragment(&op)) {
        opsToErase.push_back(&op);
      }
    }

    for (auto *op : opsToErase) {
      op->erase();
    }

    // Strip "emit.fragments" attributes on all ops (e.g. hw.module) if they refer to deleted fragments
    module.walk([&](Operation *op) {
      if (auto fragmentsAttr = op->getAttrOfType<ArrayAttr>("emit.fragments")) {
        SmallVector<Attribute, 4> newFragments;
        for (auto attr : fragmentsAttr) {
          if (auto symbolRef = dyn_cast_or_null<SymbolRefAttr>(attr)) {
            if (symbolRef.getRootReference() == "PRINTF_COND_FRAGMENT") {
              continue;
            }
          }
          newFragments.push_back(attr);
        }
        if (newFragments.empty()) {
          op->removeAttr("emit.fragments");
        } else {
          op->setAttr("emit.fragments", ArrayAttr::get(op->getContext(), newFragments));
        }
      }
    });
  }

  StringRef getArgument() const override { return "test-strip-macros-and-fragments"; }
  StringRef getDescription() const override {
    return "Strip out sv.macro.decl for SYNTHESIS and PRINTF_COND, including emit.fragments attributes";
  }
};

struct TestRemoveAssertAlwaysBlocksPass
    : public PassWrapper<TestRemoveAssertAlwaysBlocksPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(TestRemoveAssertAlwaysBlocksPass)

  // Helper to recursively check if an operation and its sub-regions only contain allowed constructs.
  // Allowed constructs are: sv.if, sv.assert, block terminators.
  bool onlyContainsIfsAndAsserts(Operation *op) {
    if (op->hasTrait<OpTrait::IsTerminator>())
      return true;

    if (isa<sv::IfOp, sv::AssertOp>(op)) {
      for (auto &region : op->getRegions()) {
        for (auto &block : region.getBlocks()) {
          for (auto &innerOp : block.getOperations()) {
            if (!onlyContainsIfsAndAsserts(&innerOp))
              return false;
          }
        }
      }
      return true;
    }

    return false;
  }

  void runOnOperation() override {
    auto module = getOperation();
    module.walk([&](sv::AlwaysOp op) {
      bool allAllowed = true;
      for (auto &region : op->getRegions()) {
        for (auto &block : region.getBlocks()) {
          for (auto &innerOp : block.getOperations()) {
            if (!onlyContainsIfsAndAsserts(&innerOp)) {
              allAllowed = false;
              break;
            }
          }
          if (!allAllowed)
            break;
        }
        if (!allAllowed)
          break;
      }

      if (allAllowed) {
        op.erase();
      }
    });
  }

  StringRef getArgument() const override { return "test-remove-assert-always-blocks"; }
  StringRef getDescription() const override {
    return "Remove sv.always constructs if they only contain ifs/asserts";
  }
};
} // namespace

namespace circt {
namespace test {
void registerTestRemoveEmptySynthesisIfDefPass() {
  PassRegistration<TestRemoveEmptySynthesisIfDefPass>();
  PassRegistration<TestStripMacrosAndFragmentsPass>();
  PassRegistration<TestRemoveAssertAlwaysBlocksPass>();
}
} // namespace test
} // namespace circt
