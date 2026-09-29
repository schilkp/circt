#!/usr/bin/env bash
# Fail on error code, unknown var, and propagate errors from pipes:
set -euov pipefail

NAME="lfsr_alu"

# Move to location of this script
SCRIPT_DIR="$(realpath "$(dirname "$0")")"
cd "$SCRIPT_DIR"

OUT="../example_netlists/$NAME"
BIN="../build/bin"

rm -rf "$OUT"
mkdir -p "$OUT"

pushd ./simple_chisel
make all
popd

mkdir -p "$OUT/mlir"
"$BIN"/firtool   ./simple_chisel/build/SimpleChiselTop.fir --disable-annotation-unknown -o "$OUT"/mlir/"$NAME"-hw.mlir --ir-hw
"$BIN"/circt-opt "$OUT"/mlir/"$NAME"-hw.mlir --hw-flatten-modules --hw-aggregate-to-comb --cse --canonicalize > "$OUT"/mlir/"$NAME"-hw-flat.mlir
"$BIN"/circt-opt "$OUT"/mlir/"$NAME"-hw-flat.mlir --hw-module-to-transfer-function > "$OUT"/mlir/"$NAME"-hw-flat-split.mlir
"$BIN"/circt-opt "$OUT"/mlir/"$NAME"-hw-flat-split.mlir --hw-isolate-module="module=SimpleChiselTop_transfer" > "$OUT"/mlir/"$NAME"-hw-flat-tf.mlir

"$BIN"/circt-opt --view-op-graph="print-as-records=false max-label-len=10000" "$OUT"/mlir/"$NAME"-hw-flat-tf.mlir -o /dev/null 2> "$OUT"/mlir/"$NAME"-hw-flat-tf.dot
"$BIN"/circt-opt --view-op-graph="print-as-records=false max-label-len=10000" "$OUT"/mlir/"$NAME"-hw-flat.mlir -o /dev/null 2> "$OUT"/mlir/"$NAME"-hw-flat.dot

python ../viz/flatten_dot_tf.py "$OUT"/mlir/"$NAME"-hw-flat-tf.dot "$OUT"/tf-grouped.dot
python ../viz/flatten_dot_tf.py "$OUT"/mlir/"$NAME"-hw-flat-tf.dot "$OUT"/tf.dot --no-group

python ../viz/flatten_dot.py "$OUT"/mlir/"$NAME"-hw-flat.dot "$OUT"/netlist.dot

cp -r ./simple_chisel/ "$OUT"/chisel
