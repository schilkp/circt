module {
  hw.module @SimpleChiselTop(in %io_clock : !seq.clock, in %io_reset : i1, in %io_loadEn : i1, in %io_loadAddr : i8, in %io_loadData : i16, out io_result : i8, out io_halted : i1) {
    %c1_i8 = hw.constant 1 : i8
    %c-1_i3 = hw.constant -1 : i3
    %c0_i3 = hw.constant 0 : i3
    %c0_i12 = hw.constant 0 : i12
    %c0_i7 = hw.constant 0 : i7
    %c0_i2 = hw.constant 0 : i2
    %false = hw.constant false
    %true = hw.constant true
    %c1_i4 = hw.constant 1 : i4
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c4_i4 = hw.constant 4 : i4
    %c5_i4 = hw.constant 5 : i4
    %c6_i4 = hw.constant 6 : i4
    %c7_i4 = hw.constant 7 : i4
    %c1_i3 = hw.constant 1 : i3
    %c2_i3 = hw.constant 2 : i3
    %c3_i3 = hw.constant 3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c-2_i3 = hw.constant -2 : i3
    %c-8_i4 = hw.constant -8 : i4
    %c-6_i4 = hw.constant -6 : i4
    %c-7_i4 = hw.constant -7 : i4
    %c0_i8 = hw.constant 0 : i8
    %cpu2From = seq.firmem name "cpu/rom" 0, 1, undefined, port_order : <256 x 16>
    seq.firmem.write_port %cpu2From[%io_loadAddr] = %io_loadData, clock %io_clock enable %io_loadEn : <256 x 16>
    %0 = seq.firmem.read_port %cpu2From[%cpu2Fpc], clock %io_clock : <256 x 16>
    %cpu2Fpc = seq.firreg %98 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 0 : ui64, name = "cpu/pc"} : i8
    %cpu2Fhalted = seq.firreg %100 clock %io_clock reset sync %io_reset, %false {firrtl.random_init_start = 8 : ui64, name = "cpu/halted", sv.namehint = "halted"} : i1
    %cpu2Fregs_0 = seq.firreg %56 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 9 : ui64, name = "cpu/regs_0"} : i8
    %cpu2Fregs_1 = seq.firreg %59 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 17 : ui64, name = "cpu/regs_1", sv.namehint = "regs_1"} : i8
    %cpu2Fregs_2 = seq.firreg %62 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 25 : ui64, name = "cpu/regs_2"} : i8
    %cpu2Fregs_3 = seq.firreg %65 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 33 : ui64, name = "cpu/regs_3"} : i8
    %cpu2Fregs_4 = seq.firreg %68 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 41 : ui64, name = "cpu/regs_4"} : i8
    %cpu2Fregs_5 = seq.firreg %71 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 49 : ui64, name = "cpu/regs_5"} : i8
    %cpu2Fregs_6 = seq.firreg %74 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 57 : ui64, name = "cpu/regs_6"} : i8
    %cpu2Fregs_7 = seq.firreg %77 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 65 : ui64, name = "cpu/regs_7"} : i8
    %1 = comb.extract %0 from 12 {sv.namehint = "opcode"} : (i16) -> i4
    %2 = comb.extract %0 from 9 {sv.namehint = "rd"} : (i16) -> i3
    %3 = comb.extract %0 from 0 {sv.namehint = "imm6"} : (i16) -> i6
    %4 = comb.icmp bin eq %1, %c1_i4 {sv.namehint = "_aluResult_T_11"} : i4
    %5 = comb.icmp bin eq %1, %c2_i4 {sv.namehint = "_aluResult_T_13"} : i4
    %6 = comb.icmp bin eq %1, %c3_i4 {sv.namehint = "_aluResult_T_15"} : i4
    %7 = comb.icmp bin eq %1, %c4_i4 {sv.namehint = "_aluResult_T_17"} : i4
    %8 = comb.icmp bin eq %1, %c5_i4 {sv.namehint = "_aluResult_T_19"} : i4
    %9 = comb.or bin %4, %5, %6, %7, %8 {sv.namehint = "isRType"} : i1
    %10 = comb.icmp bin eq %1, %c6_i4 {sv.namehint = "_aluResult_T_21"} : i4
    %11 = comb.icmp bin eq %1, %c7_i4 {sv.namehint = "_aluResult_T_23"} : i4
    %12 = comb.extract %0 from 3 : (i16) -> i1
    %13 = comb.extract %0 from 4 : (i16) -> i1
    %14 = comb.extract %0 from 5 : (i16) -> i1
    %15 = comb.mux %12, %cpu2Fregs_7, %cpu2Fregs_6 : i8
    %16 = comb.mux %12, %cpu2Fregs_5, %cpu2Fregs_4 : i8
    %17 = comb.mux %13, %15, %16 : i8
    %18 = comb.mux %12, %cpu2Fregs_3, %cpu2Fregs_2 : i8
    %19 = comb.mux %12, %cpu2Fregs_1, %cpu2Fregs_0 : i8
    %20 = comb.mux %13, %18, %19 : i8
    %21 = comb.mux %14, %17, %20 : i8
    %22 = comb.concat %c0_i2, %3 : i2, i6
    %23 = comb.mux bin %9, %21, %22 {sv.namehint = "aluB"} : i8
    %24 = comb.extract %0 from 6 : (i16) -> i1
    %25 = comb.extract %0 from 7 : (i16) -> i1
    %26 = comb.extract %0 from 8 : (i16) -> i1
    %27 = comb.mux %24, %cpu2Fregs_7, %cpu2Fregs_6 : i8
    %28 = comb.mux %24, %cpu2Fregs_5, %cpu2Fregs_4 : i8
    %29 = comb.mux %25, %27, %28 : i8
    %30 = comb.mux %24, %cpu2Fregs_3, %cpu2Fregs_2 : i8
    %31 = comb.mux %24, %cpu2Fregs_1, %cpu2Fregs_0 : i8
    %32 = comb.mux %25, %30, %31 : i8
    %33 = comb.mux %26, %29, %32 : i8
    %34 = comb.add bin %33, %23 {sv.namehint = "_aluResult_T_7"} : i8
    %35 = comb.sub bin %33, %23 {sv.namehint = "_aluResult_T_2"} : i8
    %36 = comb.and bin %33, %23 {sv.namehint = "_aluResult_T_4"} : i8
    %37 = comb.or bin %33, %23 {sv.namehint = "_aluResult_T_5"} : i8
    %38 = comb.xor bin %33, %23 {sv.namehint = "_aluResult_T_6"} : i8
    %39 = comb.extract %0 from 0 {sv.namehint = "_aluResult_T_9"} : (i16) -> i3
    %40 = comb.concat %c0_i7, %33 : i7, i8
    %41 = comb.concat %c0_i12, %39 : i12, i3
    %42 = comb.shl bin %40, %41 {sv.namehint = "_aluResult_T_10"} : i15
    %43 = comb.mux bin %4, %34, %c0_i8 {sv.namehint = "_aluResult_T_12"} : i8
    %44 = comb.mux bin %5, %35, %43 {sv.namehint = "_aluResult_T_14"} : i8
    %45 = comb.mux bin %6, %36, %44 {sv.namehint = "_aluResult_T_16"} : i8
    %46 = comb.mux bin %7, %37, %45 {sv.namehint = "_aluResult_T_18"} : i8
    %47 = comb.mux bin %8, %38, %46 {sv.namehint = "_aluResult_T_20"} : i8
    %48 = comb.mux bin %10, %34, %47 {sv.namehint = "_aluResult_T_22"} : i8
    %49 = comb.extract %42 from 0 : (i15) -> i8
    %50 = comb.mux bin %11, %49, %48 {sv.namehint = "aluResult"} : i8
    %51 = comb.or bin %9, %10, %11 : i1
    %52 = comb.icmp bin ne %2, %c0_i3 : i3
    %53 = comb.and bin %51, %52 : i1
    %54 = comb.xor bin %52, %true : i1
    %55 = comb.and bin %53, %54 : i1
    %56 = comb.mux bin %55, %50, %cpu2Fregs_0 : i8
    %57 = comb.icmp bin eq %2, %c1_i3 : i3
    %58 = comb.and bin %53, %57 : i1
    %59 = comb.mux bin %58, %50, %cpu2Fregs_1 : i8
    %60 = comb.icmp bin eq %2, %c2_i3 : i3
    %61 = comb.and bin %53, %60 : i1
    %62 = comb.mux bin %61, %50, %cpu2Fregs_2 : i8
    %63 = comb.icmp bin eq %2, %c3_i3 : i3
    %64 = comb.and bin %53, %63 : i1
    %65 = comb.mux bin %64, %50, %cpu2Fregs_3 : i8
    %66 = comb.icmp bin eq %2, %c-4_i3 : i3
    %67 = comb.and bin %53, %66 : i1
    %68 = comb.mux bin %67, %50, %cpu2Fregs_4 : i8
    %69 = comb.icmp bin eq %2, %c-3_i3 : i3
    %70 = comb.and bin %53, %69 : i1
    %71 = comb.mux bin %70, %50, %cpu2Fregs_5 : i8
    %72 = comb.icmp bin eq %2, %c-2_i3 : i3
    %73 = comb.and bin %53, %72 : i1
    %74 = comb.mux bin %73, %50, %cpu2Fregs_6 : i8
    %75 = comb.icmp bin eq %2, %c-1_i3 : i3
    %76 = comb.and bin %53, %75 : i1
    %77 = comb.mux bin %76, %50, %cpu2Fregs_7 : i8
    %78 = comb.icmp bin eq %1, %c-8_i4 {sv.namehint = "_branchTaken_T"} : i4
    %79 = comb.extract %0 from 9 : (i16) -> i1
    %80 = comb.extract %0 from 10 : (i16) -> i1
    %81 = comb.extract %0 from 11 : (i16) -> i1
    %82 = comb.mux %79, %cpu2Fregs_7, %cpu2Fregs_6 : i8
    %83 = comb.mux %79, %cpu2Fregs_5, %cpu2Fregs_4 : i8
    %84 = comb.mux %80, %82, %83 : i8
    %85 = comb.mux %79, %cpu2Fregs_3, %cpu2Fregs_2 : i8
    %86 = comb.mux %79, %cpu2Fregs_1, %cpu2Fregs_0 : i8
    %87 = comb.mux %80, %85, %86 : i8
    %88 = comb.mux %81, %84, %87 : i8
    %89 = comb.icmp bin eq %88, %33 {sv.namehint = "_branchTaken_T_1"} : i8
    %90 = comb.and bin %78, %89 {sv.namehint = "branchTaken"} : i1
    %91 = comb.add bin %cpu2Fpc, %c1_i8 {sv.namehint = "_pcPlus1_T"} : i8
    %92 = comb.icmp bin eq %1, %c-6_i4 {sv.namehint = "_nextPc_T"} : i4
    %93 = comb.icmp bin eq %1, %c-7_i4 {sv.namehint = "_nextPc_T_1"} : i4
    %94 = comb.or %93, %90 : i1
    %95 = comb.mux bin %94, %22, %91 {sv.namehint = "_nextPc_T_3"} : i8
    %96 = comb.xor bin %cpu2Fhalted, %true : i1
    %97 = comb.or %cpu2Fhalted, %92 : i1
    %98 = comb.mux bin %97, %cpu2Fpc, %95 : i8
    %99 = comb.and bin %96, %92 : i1
    %100 = comb.or %99, %cpu2Fhalted : i1
    hw.output %cpu2Fregs_1, %cpu2Fhalted : i8, i1
  }
  om.class @SimpleChiselTop_Class(%basepath: !om.basepath) {
    om.class.fields 
  }
}

