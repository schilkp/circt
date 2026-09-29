module {
  hw.module @SimpleChiselTop(in %io_clock : !seq.clock, in %io_reset : i1, in %io_enable : i1, in %io_opOverrideEn : i1, in %io_opOverride : i3, out io_aluResult : i8, out io_aluValid : i1) {
    %c-3_i3 = hw.constant -3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c3_i3 = hw.constant 3 : i3
    %c2_i3 = hw.constant 2 : i3
    %c1_i3 = hw.constant 1 : i3
    %c0_i15 = hw.constant 0 : i15
    %c0_i19 = hw.constant 0 : i19
    %c-1_i32 = hw.constant -1 : i32
    %c0_i24 = hw.constant 0 : i24
    %lfsr2Fstate = seq.firreg %11 clock %io_clock reset sync %io_reset, %c-1_i32 {firrtl.random_init_start = 0 : ui64, name = "lfsr/state"} : i32
    %0 = comb.extract %lfsr2Fstate from 31 {sv.namehint = "_tap_T"} : (i32) -> i1
    %1 = comb.extract %lfsr2Fstate from 21 {sv.namehint = "_tap_T_1"} : (i32) -> i1
    %2 = comb.extract %lfsr2Fstate from 1 {sv.namehint = "_tap_T_3"} : (i32) -> i1
    %3 = comb.extract %lfsr2Fstate from 0 {sv.namehint = "_tap_T_5"} : (i32) -> i1
    %4 = comb.xor bin %0, %1, %2, %3 {sv.namehint = "tap"} : i1
    %5 = comb.extract %lfsr2Fstate from 0 {sv.namehint = "_shifted_T"} : (i32) -> i31
    %6 = comb.concat %5, %4 {sv.namehint = "shifted"} : i31, i1
    %7 = comb.concat %alu2Fresult_r3, %c0_i24 {sv.namehint = "_nextState_T"} : i8, i24
    %8 = comb.replicate %alu2Flat_r3 : (i1) -> i32
    %9 = comb.and %8, %7 : i32
    %10 = comb.xor %9, %6 {sv.namehint = "nextState"} : i32
    %11 = comb.mux bin %io_enable, %10, %lfsr2Fstate : i32
    %12 = comb.extract %lfsr2Fstate from 24 {sv.namehint = "io_a"} : (i32) -> i8
    %13 = comb.extract %lfsr2Fstate from 16 {sv.namehint = "io_b"} : (i32) -> i8
    %14 = comb.extract %lfsr2Fstate from 13 {sv.namehint = "io_op"} : (i32) -> i3
    %15 = comb.extract %lfsr2Fstate from 12 {sv.namehint = "io_latch"} : (i32) -> i1
    %alu2Fa1 = seq.firreg %12 clock %io_clock {firrtl.random_init_start = 0 : ui64, name = "alu/a1"} : i8
    %alu2Fb1 = seq.firreg %13 clock %io_clock {firrtl.random_init_start = 8 : ui64, name = "alu/b1"} : i8
    %alu2Fop1 = seq.firreg %39 clock %io_clock {firrtl.random_init_start = 16 : ui64, name = "alu/op1"} : i3
    %alu2Flat1 = seq.firreg %15 clock %io_clock {firrtl.random_init_start = 19 : ui64, name = "alu/lat1"} : i1
    %alu2Fa2 = seq.firreg %alu2Fa1 clock %io_clock {firrtl.random_init_start = 20 : ui64, name = "alu/a2"} : i8
    %alu2Fb2 = seq.firreg %alu2Fb1 clock %io_clock {firrtl.random_init_start = 28 : ui64, name = "alu/b2"} : i8
    %alu2Fop2 = seq.firreg %alu2Fop1 clock %io_clock {firrtl.random_init_start = 36 : ui64, name = "alu/op2"} : i3
    %alu2Flat2 = seq.firreg %alu2Flat1 clock %io_clock {firrtl.random_init_start = 39 : ui64, name = "alu/lat2"} : i1
    %alu2Farith2 = seq.firreg %19 clock %io_clock {firrtl.random_init_start = 40 : ui64, name = "alu/arith2"} : i8
    %alu2Flogic2 = seq.firreg %26 clock %io_clock {firrtl.random_init_start = 48 : ui64, name = "alu/logic2"} : i8
    %16 = comb.icmp bin eq %alu2Fop1, %c1_i3 {sv.namehint = "_arith1_T"} : i3
    %17 = comb.sub bin %alu2Fa1, %alu2Fb1 {sv.namehint = "_arith1_T_1"} : i8
    %18 = comb.add bin %alu2Fa1, %alu2Fb1 {sv.namehint = "_arith1_T_3"} : i8
    %19 = comb.mux bin %16, %17, %18 {sv.namehint = "arith1"} : i8
    %20 = comb.and bin %alu2Fa1, %alu2Fb1 {sv.namehint = "_logic1_T_5"} : i8
    %21 = comb.or bin %alu2Fa1, %alu2Fb1 {sv.namehint = "_logic1_T_2"} : i8
    %22 = comb.xor bin %alu2Fa1, %alu2Fb1 {sv.namehint = "_logic1_T_3"} : i8
    %23 = comb.icmp bin eq %alu2Fop1, %c3_i3 {sv.namehint = "_logic1_T_6"} : i3
    %24 = comb.mux bin %23, %21, %20 {sv.namehint = "_logic1_T_7"} : i8
    %25 = comb.icmp bin eq %alu2Fop1, %c-4_i3 {sv.namehint = "_logic1_T_8"} : i3
    %26 = comb.mux bin %25, %22, %24 {sv.namehint = "logic1"} : i8
    %alu2Fresult_r3 = seq.firreg %38 clock %io_clock {firrtl.random_init_start = 56 : ui64, name = "alu/result_r3", sv.namehint = "io_result"} : i8
    %alu2Flat_r3 = seq.firreg %alu2Flat2 clock %io_clock {firrtl.random_init_start = 64 : ui64, name = "alu/lat_r3", sv.namehint = "lat_r3"} : i1
    %27 = comb.extract %alu2Fb2 from 0 {sv.namehint = "_shift3_T"} : (i8) -> i4
    %28 = comb.concat %c0_i15, %alu2Fa2 : i15, i8
    %29 = comb.concat %c0_i19, %27 : i19, i4
    %30 = comb.shl bin %28, %29 {sv.namehint = "shift3"} : i23
    %31 = comb.icmp bin eq %alu2Fop2, %c2_i3 {sv.namehint = "_muxed_T"} : i3
    %32 = comb.icmp bin eq %alu2Fop2, %c3_i3 {sv.namehint = "_muxed_T_1"} : i3
    %33 = comb.icmp bin eq %alu2Fop2, %c-4_i3 {sv.namehint = "_muxed_T_3"} : i3
    %34 = comb.or bin %31, %32, %33 {sv.namehint = "_muxed_T_4"} : i1
    %35 = comb.icmp bin eq %alu2Fop2, %c-3_i3 {sv.namehint = "_muxed_T_5"} : i3
    %36 = comb.extract %30 from 0 : (i23) -> i8
    %37 = comb.mux bin %35, %36, %alu2Farith2 {sv.namehint = "_muxed_T_6"} : i8
    %38 = comb.mux bin %34, %alu2Flogic2, %37 {sv.namehint = "muxed"} : i8
    %39 = comb.mux bin %io_opOverrideEn, %io_opOverride, %14 {sv.namehint = "alu.io_op"} : i3
    hw.output %alu2Fresult_r3, %alu2Flat_r3 : i8, i1
  }
  om.class @SimpleChiselTop_Class(%basepath: !om.basepath) {
    om.class.fields 
  }
}

