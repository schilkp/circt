#!/usr/bin/env bash
# Fail on error code, unknown var, and propagate errors from pipes:
set -euov pipefail

# Move to location of this script
SCRIPT_DIR="$(realpath "$(dirname "$0")")"
cd "$SCRIPT_DIR"

OUT="../out"
BIN="../build/bin"

mkdir -p "$OUT"

pushd ./simple_chisel
make all
popd

"$BIN"/firtool   ./simple_chisel/build/SimpleChiselTop.fir --disable-annotation-unknown -o "$OUT"/simple-chisel-hw.mlir --ir-hw
"$BIN"/circt-opt "$OUT"/simple-chisel-hw.mlir --hw-flatten-modules > "$OUT"/simple-chisel-hw-flat.mlir
"$BIN"/circt-opt "$OUT"/simple-chisel-hw-flat.mlir --hw-module-to-transfer-function > "$OUT"/simple-chisel-hw-flat-split.mlir
"$BIN"/circt-opt "$OUT"/simple-chisel-hw-flat-split.mlir --hw-isolate-module="module=SimpleChiselTop_transfer" > "$OUT"/simple-chisel-hw-flat-tf.mlir

"$BIN"/circt-opt --view-op-graph="print-as-records=false max-label-len=10000" "$OUT"/simple-chisel-hw-flat-tf.mlir -o /dev/null 2> "$OUT"/simple-chisel-hw-flat-tf.dot
