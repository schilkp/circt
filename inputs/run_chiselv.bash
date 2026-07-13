#!/usr/bin/env bash
# Fail on error code, unknown var, and propagate errors from pipes:
set -euov pipefail

# Move to location of this script
SCRIPT_DIR="$(realpath "$(dirname "$0")")"
cd "$SCRIPT_DIR"

OUT="../out"
BIN="../build/bin"

mkdir -p "$OUT"

"$BIN"/firtool   ./chiselv.fir --disable-annotation-unknown -o "$OUT"/chiselv-hw.mlir --ir-hw
"$BIN"/circt-opt "$OUT"/chiselv-hw.mlir --hw-flatten-modules > "$OUT"/chiselv-hw-flat.mlir
"$BIN"/circt-opt "$OUT"/chiselv-hw-flat.mlir --hw-module-to-transfer-function > "$OUT"/chiselv-hw-flat-split.mlir
"$BIN"/circt-opt "$OUT"/chiselv-hw-flat-split.mlir --hw-isolate-module="module=SimToplevel_transfer" > "$OUT"/chiselv-hw-flat-tf.mlir

"$BIN"/circt-opt --view-op-graph="print-as-records=false max-label-len=10000" "$OUT"/chiselv-hw-flat-tf.mlir -o /dev/null 2> "$OUT"/chiselv-hw-flat-tf.dot
