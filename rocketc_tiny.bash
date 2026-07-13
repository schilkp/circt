#!/usr/bin/env bash

# Fail on error code, unknown var, and propagate errors from pipes:
set -euov pipefail

./build/bin/firtool ./rocketc_tiny.fir --disable-annotation-unknown -o rocketc_tiny-hw-raw.mlir --ir-hw
./build/bin/circt-opt rocketc_tiny-hw-raw.mlir \
  --test-remove-empty-synthesis-ifdef \
  --test-strip-macros-and-fragments \
  --test-remove-assert-always-blocks \
  --symbol-dce \
  --canonicalize \
  -o rocketc_tiny-hw.mlir
./build/bin/circt-opt rocketc_tiny-hw-raw.mlir --test-remove-empty-synthesis-ifdef --test-strip-macros-and-fragments --test-remove-assert-always-blocks --symbol-dce --canonicalize -o rocketc_tiny-hw.mlir
./build/bin/circt-opt rocketc_tiny-hw.mlir --hw-flatten-modules > rocketc_tiny-hw-flat.mlir
./build/bin/circt-opt rocketc_tiny-hw-flat.mlir --hw-module-to-transfer-function > rocketc_tiny-hw-flat-tf.mlir

awk -v target="TestHarness_transfer" '
  $0 ~ "hw.module @" target { printing = 1; braces = 0 }
  printing {
    print
    open_b = gsub(/\{/, "{")
    close_b = gsub(/\}/, "}")
    braces += (open_b - close_b)
    if (braces == 0) {
      printing = 0
      exit
    }
  }
' rocketc_tiny-hw-flat-tf.mlir > rocketc_tiny-hw-flat-tf-min.mlir

awk -F'output_names = ' '/hw.output/ { match($2, /^\[[^\]]+\]/); print substr($2, RSTART, RLENGTH) }' rocketc_tiny-hw-flat-tf-min.mlir > rocketc_tiny-hw-flat-tf-outputs.json

./build/bin/circt-opt --view-op-graph='print-attrs=false' rocketc_tiny-hw-flat-tf-min.mlir 2> rocketc_tiny-hw-flat-tf.dot
