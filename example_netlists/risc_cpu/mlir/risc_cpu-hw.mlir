module {
  hw.module private @RiscCpu(in %clock : !seq.clock, in %reset : i1, in %io_loadEn : i1, in %io_loadAddr : i8, in %io_loadData : i16, out io_result : i8, out io_halted : i1) {
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
    %rom = seq.firmem 0, 1, undefined, port_order : <256 x 16>
    seq.firmem.write_port %rom[%io_loadAddr] = %io_loadData, clock %clock enable %io_loadEn : <256 x 16>
    %0 = seq.firmem.read_port %rom[%pc], clock %clock : <256 x 16>
    %pc = seq.firreg %74 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 0 : ui64} : i8
    %halted = seq.firreg %76 clock %clock reset sync %reset, %false {firrtl.random_init_start = 8 : ui64, sv.namehint = "halted"} : i1
    %regs_0 = seq.firreg %41 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 9 : ui64} : i8
    %regs_1 = seq.firreg %44 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 17 : ui64, sv.namehint = "regs_1"} : i8
    %regs_2 = seq.firreg %47 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 25 : ui64} : i8
    %regs_3 = seq.firreg %50 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 33 : ui64} : i8
    %regs_4 = seq.firreg %53 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 41 : ui64} : i8
    %regs_5 = seq.firreg %56 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 49 : ui64} : i8
    %regs_6 = seq.firreg %59 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 57 : ui64} : i8
    %regs_7 = seq.firreg %62 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 65 : ui64} : i8
    %1 = comb.extract %0 from 12 {sv.namehint = "opcode"} : (i16) -> i4
    %2 = comb.extract %0 from 9 {sv.namehint = "rd"} : (i16) -> i3
    %3 = comb.extract %0 from 6 {sv.namehint = "rs1"} : (i16) -> i3
    %4 = comb.extract %0 from 3 {sv.namehint = "rs2"} : (i16) -> i3
    %5 = comb.extract %0 from 0 {sv.namehint = "imm6"} : (i16) -> i6
    %6 = comb.icmp bin eq %1, %c1_i4 {sv.namehint = "_aluResult_T_11"} : i4
    %7 = comb.icmp bin eq %1, %c2_i4 {sv.namehint = "_aluResult_T_13"} : i4
    %8 = comb.icmp bin eq %1, %c3_i4 {sv.namehint = "_aluResult_T_15"} : i4
    %9 = comb.icmp bin eq %1, %c4_i4 {sv.namehint = "_aluResult_T_17"} : i4
    %10 = comb.icmp bin eq %1, %c5_i4 {sv.namehint = "_aluResult_T_19"} : i4
    %11 = comb.or bin %6, %7, %8, %9, %10 {sv.namehint = "isRType"} : i1
    %12 = comb.icmp bin eq %1, %c6_i4 {sv.namehint = "_aluResult_T_21"} : i4
    %13 = comb.icmp bin eq %1, %c7_i4 {sv.namehint = "_aluResult_T_23"} : i4
    %14 = hw.array_create %regs_7, %regs_6, %regs_5, %regs_4, %regs_3, %regs_2, %regs_1, %regs_0 : i8
    %15 = hw.array_get %14[%4] : !hw.array<8xi8>, i3
    %16 = comb.concat %c0_i2, %5 : i2, i6
    %17 = comb.mux bin %11, %15, %16 {sv.namehint = "aluB"} : i8
    %18 = hw.array_get %14[%3] : !hw.array<8xi8>, i3
    %19 = comb.add bin %18, %17 {sv.namehint = "_aluResult_T_7"} : i8
    %20 = comb.sub bin %18, %17 {sv.namehint = "_aluResult_T_2"} : i8
    %21 = comb.and bin %18, %17 {sv.namehint = "_aluResult_T_4"} : i8
    %22 = comb.or bin %18, %17 {sv.namehint = "_aluResult_T_5"} : i8
    %23 = comb.xor bin %18, %17 {sv.namehint = "_aluResult_T_6"} : i8
    %24 = comb.extract %0 from 0 {sv.namehint = "_aluResult_T_9"} : (i16) -> i3
    %25 = comb.concat %c0_i7, %18 : i7, i8
    %26 = comb.concat %c0_i12, %24 : i12, i3
    %27 = comb.shl bin %25, %26 {sv.namehint = "_aluResult_T_10"} : i15
    %28 = comb.mux bin %6, %19, %c0_i8 {sv.namehint = "_aluResult_T_12"} : i8
    %29 = comb.mux bin %7, %20, %28 {sv.namehint = "_aluResult_T_14"} : i8
    %30 = comb.mux bin %8, %21, %29 {sv.namehint = "_aluResult_T_16"} : i8
    %31 = comb.mux bin %9, %22, %30 {sv.namehint = "_aluResult_T_18"} : i8
    %32 = comb.mux bin %10, %23, %31 {sv.namehint = "_aluResult_T_20"} : i8
    %33 = comb.mux bin %12, %19, %32 {sv.namehint = "_aluResult_T_22"} : i8
    %34 = comb.extract %27 from 0 : (i15) -> i8
    %35 = comb.mux bin %13, %34, %33 {sv.namehint = "aluResult"} : i8
    %36 = comb.or bin %11, %12, %13 : i1
    %37 = comb.icmp bin ne %2, %c0_i3 : i3
    %38 = comb.and bin %36, %37 : i1
    %39 = comb.xor bin %37, %true : i1
    %40 = comb.and bin %38, %39 : i1
    %41 = comb.mux bin %40, %35, %regs_0 : i8
    %42 = comb.icmp bin eq %2, %c1_i3 : i3
    %43 = comb.and bin %38, %42 : i1
    %44 = comb.mux bin %43, %35, %regs_1 : i8
    %45 = comb.icmp bin eq %2, %c2_i3 : i3
    %46 = comb.and bin %38, %45 : i1
    %47 = comb.mux bin %46, %35, %regs_2 : i8
    %48 = comb.icmp bin eq %2, %c3_i3 : i3
    %49 = comb.and bin %38, %48 : i1
    %50 = comb.mux bin %49, %35, %regs_3 : i8
    %51 = comb.icmp bin eq %2, %c-4_i3 : i3
    %52 = comb.and bin %38, %51 : i1
    %53 = comb.mux bin %52, %35, %regs_4 : i8
    %54 = comb.icmp bin eq %2, %c-3_i3 : i3
    %55 = comb.and bin %38, %54 : i1
    %56 = comb.mux bin %55, %35, %regs_5 : i8
    %57 = comb.icmp bin eq %2, %c-2_i3 : i3
    %58 = comb.and bin %38, %57 : i1
    %59 = comb.mux bin %58, %35, %regs_6 : i8
    %60 = comb.icmp bin eq %2, %c-1_i3 : i3
    %61 = comb.and bin %38, %60 : i1
    %62 = comb.mux bin %61, %35, %regs_7 : i8
    %63 = comb.icmp bin eq %1, %c-8_i4 {sv.namehint = "_branchTaken_T"} : i4
    %64 = hw.array_get %14[%2] : !hw.array<8xi8>, i3
    %65 = comb.icmp bin eq %64, %18 {sv.namehint = "_branchTaken_T_1"} : i8
    %66 = comb.and bin %63, %65 {sv.namehint = "branchTaken"} : i1
    %67 = comb.add bin %pc, %c1_i8 {sv.namehint = "_pcPlus1_T"} : i8
    %68 = comb.icmp bin eq %1, %c-6_i4 {sv.namehint = "_nextPc_T"} : i4
    %69 = comb.icmp bin eq %1, %c-7_i4 {sv.namehint = "_nextPc_T_1"} : i4
    %70 = comb.or %69, %66 : i1
    %71 = comb.mux bin %70, %16, %67 {sv.namehint = "_nextPc_T_3"} : i8
    %72 = comb.xor bin %halted, %true : i1
    %73 = comb.or %halted, %68 : i1
    %74 = comb.mux bin %73, %pc, %71 : i8
    %75 = comb.and bin %72, %68 : i1
    %76 = comb.or %75, %halted : i1
    hw.output %regs_1, %halted : i8, i1
  }
  hw.module @SimpleChiselTop(in %io_clock : !seq.clock, in %io_reset : i1, in %io_loadEn : i1, in %io_loadAddr : i8, in %io_loadData : i16, out io_result : i8, out io_halted : i1) {
    %cpu.io_result, %cpu.io_halted = hw.instance "cpu" @RiscCpu(clock: %io_clock: !seq.clock, reset: %io_reset: i1, io_loadEn: %io_loadEn: i1, io_loadAddr: %io_loadAddr: i8, io_loadData: %io_loadData: i16) -> (io_result: i8, io_halted: i1) {sv.namehint = "io_halted"}
    hw.output %cpu.io_result, %cpu.io_halted : i8, i1
  }
  om.class @SimpleChiselTop_Class(%basepath: !om.basepath) {
    om.class.fields 
  }
}
