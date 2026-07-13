// RUN: circt-opt %s --hw-isolate-module="module=KeepMe" | FileCheck %s --check-prefix=ISOLATED
// RUN: circt-opt %s --hw-isolate-module="module=DoesNotExist" -verify-diagnostics

// ISOLATED-NOT: hw.module @EraseMe
// ISOLATED-NOT: hw.generator.schema
// ISOLATED: hw.module @KeepMe(in %x : i4, out y : i4) {
// ISOLATED-NEXT:   hw.output %x : i4
// ISOLATED-NEXT: }
// ISOLATED-NOT: hw.module @EraseMe

// expected-error @below {{Module 'DoesNotExist' not found.}}
module {
  hw.generator.schema @EraseMeSchema, "EraseMeSchema", ["EraseMeSchema"]

  hw.module @EraseMe(in %x : i4, out y : i4) {
    hw.output %x : i4
  }

  hw.module @KeepMe(in %x : i4, out y : i4) {
    hw.output %x : i4
  }
}
