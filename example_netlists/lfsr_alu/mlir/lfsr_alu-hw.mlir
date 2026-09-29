module {
  hw.module private @Lfsr(in %clock : !seq.clock, in %reset : i1, in %io_enable : i1, out io_a : i8, out io_b : i8, out io_op : i3, out io_latch : i1, in %io_feedback_valid : i1, in %io_feedback_bits : i8) {
    %c-1_i32 = hw.constant -1 : i32
    %c0_i24 = hw.constant 0 : i24
    %state = seq.firreg %11 clock %clock reset sync %reset, %c-1_i32 {firrtl.random_init_start = 0 : ui64} : i32
    %0 = comb.extract %state from 31 {sv.namehint = "_tap_T"} : (i32) -> i1
    %1 = comb.extract %state from 21 {sv.namehint = "_tap_T_1"} : (i32) -> i1
    %2 = comb.extract %state from 1 {sv.namehint = "_tap_T_3"} : (i32) -> i1
    %3 = comb.extract %state from 0 {sv.namehint = "_tap_T_5"} : (i32) -> i1
    %4 = comb.xor bin %0, %1, %2, %3 {sv.namehint = "tap"} : i1
    %5 = comb.extract %state from 0 {sv.namehint = "_shifted_T"} : (i32) -> i31
    %6 = comb.concat %5, %4 {sv.namehint = "shifted"} : i31, i1
    %7 = comb.concat %io_feedback_bits, %c0_i24 {sv.namehint = "_nextState_T"} : i8, i24
    %8 = comb.replicate %io_feedback_valid : (i1) -> i32
    %9 = comb.and %8, %7 : i32
    %10 = comb.xor %9, %6 {sv.namehint = "nextState"} : i32
    %11 = comb.mux bin %io_enable, %10, %state : i32
    %12 = comb.extract %state from 24 {sv.namehint = "io_a"} : (i32) -> i8
    %13 = comb.extract %state from 16 {sv.namehint = "io_b"} : (i32) -> i8
    %14 = comb.extract %state from 13 {sv.namehint = "io_op"} : (i32) -> i3
    %15 = comb.extract %state from 12 {sv.namehint = "io_latch"} : (i32) -> i1
    hw.output %12, %13, %14, %15 : i8, i8, i3, i1
  }
  hw.module private @PipelinedAlu(in %clock : !seq.clock, in %io_a : i8, in %io_b : i8, in %io_op : i3, in %io_latch : i1, out io_result : i8, out io_valid : i1) {
    %c0_i19 = hw.constant 0 : i19
    %c0_i15 = hw.constant 0 : i15
    %c1_i3 = hw.constant 1 : i3
    %c2_i3 = hw.constant 2 : i3
    %c3_i3 = hw.constant 3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %a1 = seq.firreg %io_a clock %clock {firrtl.random_init_start = 0 : ui64} : i8
    %b1 = seq.firreg %io_b clock %clock {firrtl.random_init_start = 8 : ui64} : i8
    %op1 = seq.firreg %io_op clock %clock {firrtl.random_init_start = 16 : ui64} : i3
    %lat1 = seq.firreg %io_latch clock %clock {firrtl.random_init_start = 19 : ui64} : i1
    %a2 = seq.firreg %a1 clock %clock {firrtl.random_init_start = 20 : ui64} : i8
    %b2 = seq.firreg %b1 clock %clock {firrtl.random_init_start = 28 : ui64} : i8
    %op2 = seq.firreg %op1 clock %clock {firrtl.random_init_start = 36 : ui64} : i3
    %lat2 = seq.firreg %lat1 clock %clock {firrtl.random_init_start = 39 : ui64} : i1
    %arith2 = seq.firreg %3 clock %clock {firrtl.random_init_start = 40 : ui64} : i8
    %logic2 = seq.firreg %10 clock %clock {firrtl.random_init_start = 48 : ui64} : i8
    %0 = comb.icmp bin eq %op1, %c1_i3 {sv.namehint = "_arith1_T"} : i3
    %1 = comb.sub bin %a1, %b1 {sv.namehint = "_arith1_T_1"} : i8
    %2 = comb.add bin %a1, %b1 {sv.namehint = "_arith1_T_3"} : i8
    %3 = comb.mux bin %0, %1, %2 {sv.namehint = "arith1"} : i8
    %4 = comb.and bin %a1, %b1 {sv.namehint = "_logic1_T_5"} : i8
    %5 = comb.or bin %a1, %b1 {sv.namehint = "_logic1_T_2"} : i8
    %6 = comb.xor bin %a1, %b1 {sv.namehint = "_logic1_T_3"} : i8
    %7 = comb.icmp bin eq %op1, %c3_i3 {sv.namehint = "_logic1_T_6"} : i3
    %8 = comb.mux bin %7, %5, %4 {sv.namehint = "_logic1_T_7"} : i8
    %9 = comb.icmp bin eq %op1, %c-4_i3 {sv.namehint = "_logic1_T_8"} : i3
    %10 = comb.mux bin %9, %6, %8 {sv.namehint = "logic1"} : i8
    %result_r3 = seq.firreg %22 clock %clock {firrtl.random_init_start = 56 : ui64, sv.namehint = "io_result"} : i8
    %lat_r3 = seq.firreg %lat2 clock %clock {firrtl.random_init_start = 64 : ui64, sv.namehint = "lat_r3"} : i1
    %11 = comb.extract %b2 from 0 {sv.namehint = "_shift3_T"} : (i8) -> i4
    %12 = comb.concat %c0_i15, %a2 : i15, i8
    %13 = comb.concat %c0_i19, %11 : i19, i4
    %14 = comb.shl bin %12, %13 {sv.namehint = "shift3"} : i23
    %15 = comb.icmp bin eq %op2, %c2_i3 {sv.namehint = "_muxed_T"} : i3
    %16 = comb.icmp bin eq %op2, %c3_i3 {sv.namehint = "_muxed_T_1"} : i3
    %17 = comb.icmp bin eq %op2, %c-4_i3 {sv.namehint = "_muxed_T_3"} : i3
    %18 = comb.or bin %15, %16, %17 {sv.namehint = "_muxed_T_4"} : i1
    %19 = comb.icmp bin eq %op2, %c-3_i3 {sv.namehint = "_muxed_T_5"} : i3
    %20 = comb.extract %14 from 0 : (i23) -> i8
    %21 = comb.mux bin %19, %20, %arith2 {sv.namehint = "_muxed_T_6"} : i8
    %22 = comb.mux bin %18, %logic2, %21 {sv.namehint = "muxed"} : i8
    hw.output %result_r3, %lat_r3 : i8, i1
  }
  hw.module @SimpleChiselTop(in %io_clock : !seq.clock, in %io_reset : i1, in %io_enable : i1, in %io_opOverrideEn : i1, in %io_opOverride : i3, out io_aluResult : i8, out io_aluValid : i1) {
    %lfsr.io_a, %lfsr.io_b, %lfsr.io_op, %lfsr.io_latch = hw.instance "lfsr" @Lfsr(clock: %io_clock: !seq.clock, reset: %io_reset: i1, io_enable: %io_enable: i1, io_feedback_valid: %alu.io_valid: i1, io_feedback_bits: %alu.io_result: i8) -> (io_a: i8, io_b: i8, io_op: i3, io_latch: i1) {sv.namehint = "alu.io_b"}
    %alu.io_result, %alu.io_valid = hw.instance "alu" @PipelinedAlu(clock: %io_clock: !seq.clock, io_a: %lfsr.io_a: i8, io_b: %lfsr.io_b: i8, io_op: %0: i3, io_latch: %lfsr.io_latch: i1) -> (io_result: i8, io_valid: i1) {sv.namehint = "io_aluValid"}
    %0 = comb.mux bin %io_opOverrideEn, %io_opOverride, %lfsr.io_op {sv.namehint = "alu.io_op"} : i3
    hw.output %alu.io_result, %alu.io_valid : i8, i1
  }
  om.class @SimpleChiselTop_Class(%basepath: !om.basepath) {
    om.class.fields 
  }
}
