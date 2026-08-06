#!/usr/bin/env bash

# class DualCoreConfig extends Config(
#   new WithNBigCores(2) ++
#   new WithCoherentBusTopology ++
#   new WithNoSimulationTimeout  ++
#   new WithoutDebug ++
#   new freechips.rocketchip.subsystem.WithoutTLMonitors ++
#   new BaseConfig
# )

# Fail on error code, unknown var, and propagate errors from pipes:
set -euov pipefail

# Move to location of this script
SCRIPT_DIR="$(realpath "$(dirname "$0")")"
cd "$SCRIPT_DIR"

OUT="../out"
BIN="../build/bin"

mkdir -p "$OUT"

"$BIN"/firtool   ./rocketc_dual.fir --disable-annotation-unknown -o "$OUT"/rocketc_dual-hw-raw.mlir --ir-hw
"$BIN"/circt-opt "$OUT"/rocketc_dual-hw-raw.mlir \
  --test-remove-empty-synthesis-ifdef \
  --test-strip-macros-and-fragments \
  --test-remove-assert-always-blocks \
  --hw-aggregate-to-comb \
  --cse \
  --symbol-dce \
  --canonicalize \
  -o "$OUT"/rocketc_dual-hw.mlir
"$BIN"/circt-opt "$OUT"/rocketc_dual-hw.mlir --hw-flatten-modules > "$OUT"/rocketc_dual-hw-flat.mlir
"$BIN"/circt-opt "$OUT"/rocketc_dual-hw-flat.mlir --hw-module-to-transfer-function > "$OUT"/rocketc_dual-hw-flat-split.mlir
"$BIN"/circt-opt "$OUT"/rocketc_dual-hw-flat-split.mlir --hw-isolate-module="module=TestHarness_transfer" > "$OUT"/rocketc_dual-hw-flat-tf.mlir

"$BIN"/circt-opt --view-op-graph="print-as-records=false max-label-len=10000" "$OUT"/rocketc_dual-hw-flat-tf.mlir -o /dev/null 2> "$OUT"/rocketc_dual-hw-flat-tf.dot
