module {
  hw.module @SimpleChiselTop_transfer(in %in_io_loadEn : i1, in %in_io_loadAddr : i8, in %in_io_loadData : i16, in %reg_cpu_pc : i8, in %reg_cpu_halted : i1, in %reg_cpu_regs_0 : i8, in %reg_cpu_regs_1 : i8, in %reg_cpu_regs_2 : i8, in %reg_cpu_regs_3 : i8, in %reg_cpu_regs_4 : i8, in %reg_cpu_regs_5 : i8, in %reg_cpu_regs_6 : i8, in %reg_cpu_regs_7 : i8, in %mem_cpu_rom_r_0_data : i16, out out_io_result : i8, out out_io_halted : i1, out reg_cpu_pc_next : i8, out reg_cpu_halted_next : i1, out reg_cpu_regs_0_next : i8, out reg_cpu_regs_1_next : i8, out reg_cpu_regs_2_next : i8, out reg_cpu_regs_3_next : i8, out reg_cpu_regs_4_next : i8, out reg_cpu_regs_5_next : i8, out reg_cpu_regs_6_next : i8, out reg_cpu_regs_7_next : i8, out mem_cpu_rom_r_0_addr : i8, out mem_cpu_rom_w_0_addr : i8, out mem_cpu_rom_w_0_en : i1, out mem_cpu_rom_w_0_data : i16) {
    %c1_i8 = hw.constant 1 : i8
    %c-1_i3 = hw.constant -1 : i3
    %c0_i3 = hw.constant 0 : i3
    %c0_i12 = hw.constant 0 : i12
    %c0_i7 = hw.constant 0 : i7
    %c0_i2 = hw.constant 0 : i2
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
    %0 = comb.extract %mem_cpu_rom_r_0_data from 12 {sv.namehint = "opcode"} : (i16) -> i4
    %1 = comb.extract %mem_cpu_rom_r_0_data from 9 {sv.namehint = "rd"} : (i16) -> i3
    %2 = comb.extract %mem_cpu_rom_r_0_data from 0 {sv.namehint = "imm6"} : (i16) -> i6
    %3 = comb.icmp bin eq %0, %c1_i4 {sv.namehint = "_aluResult_T_11"} : i4
    %4 = comb.icmp bin eq %0, %c2_i4 {sv.namehint = "_aluResult_T_13"} : i4
    %5 = comb.icmp bin eq %0, %c3_i4 {sv.namehint = "_aluResult_T_15"} : i4
    %6 = comb.icmp bin eq %0, %c4_i4 {sv.namehint = "_aluResult_T_17"} : i4
    %7 = comb.icmp bin eq %0, %c5_i4 {sv.namehint = "_aluResult_T_19"} : i4
    %8 = comb.or bin %3, %4, %5, %6, %7 {sv.namehint = "isRType"} : i1
    %9 = comb.icmp bin eq %0, %c6_i4 {sv.namehint = "_aluResult_T_21"} : i4
    %10 = comb.icmp bin eq %0, %c7_i4 {sv.namehint = "_aluResult_T_23"} : i4
    %11 = comb.extract %mem_cpu_rom_r_0_data from 3 : (i16) -> i1
    %12 = comb.extract %mem_cpu_rom_r_0_data from 4 : (i16) -> i1
    %13 = comb.extract %mem_cpu_rom_r_0_data from 5 : (i16) -> i1
    %14 = comb.mux %11, %reg_cpu_regs_7, %reg_cpu_regs_6 : i8
    %15 = comb.mux %11, %reg_cpu_regs_5, %reg_cpu_regs_4 : i8
    %16 = comb.mux %12, %14, %15 : i8
    %17 = comb.mux %11, %reg_cpu_regs_3, %reg_cpu_regs_2 : i8
    %18 = comb.mux %11, %reg_cpu_regs_1, %reg_cpu_regs_0 : i8
    %19 = comb.mux %12, %17, %18 : i8
    %20 = comb.mux %13, %16, %19 : i8
    %21 = comb.concat %c0_i2, %2 : i2, i6
    %22 = comb.mux bin %8, %20, %21 {sv.namehint = "aluB"} : i8
    %23 = comb.extract %mem_cpu_rom_r_0_data from 6 : (i16) -> i1
    %24 = comb.extract %mem_cpu_rom_r_0_data from 7 : (i16) -> i1
    %25 = comb.extract %mem_cpu_rom_r_0_data from 8 : (i16) -> i1
    %26 = comb.mux %23, %reg_cpu_regs_7, %reg_cpu_regs_6 : i8
    %27 = comb.mux %23, %reg_cpu_regs_5, %reg_cpu_regs_4 : i8
    %28 = comb.mux %24, %26, %27 : i8
    %29 = comb.mux %23, %reg_cpu_regs_3, %reg_cpu_regs_2 : i8
    %30 = comb.mux %23, %reg_cpu_regs_1, %reg_cpu_regs_0 : i8
    %31 = comb.mux %24, %29, %30 : i8
    %32 = comb.mux %25, %28, %31 : i8
    %33 = comb.add bin %32, %22 {sv.namehint = "_aluResult_T_7"} : i8
    %34 = comb.sub bin %32, %22 {sv.namehint = "_aluResult_T_2"} : i8
    %35 = comb.and bin %32, %22 {sv.namehint = "_aluResult_T_4"} : i8
    %36 = comb.or bin %32, %22 {sv.namehint = "_aluResult_T_5"} : i8
    %37 = comb.xor bin %32, %22 {sv.namehint = "_aluResult_T_6"} : i8
    %38 = comb.extract %mem_cpu_rom_r_0_data from 0 {sv.namehint = "_aluResult_T_9"} : (i16) -> i3
    %39 = comb.concat %c0_i7, %32 : i7, i8
    %40 = comb.concat %c0_i12, %38 : i12, i3
    %41 = comb.shl bin %39, %40 {sv.namehint = "_aluResult_T_10"} : i15
    %42 = comb.mux bin %3, %33, %c0_i8 {sv.namehint = "_aluResult_T_12"} : i8
    %43 = comb.mux bin %4, %34, %42 {sv.namehint = "_aluResult_T_14"} : i8
    %44 = comb.mux bin %5, %35, %43 {sv.namehint = "_aluResult_T_16"} : i8
    %45 = comb.mux bin %6, %36, %44 {sv.namehint = "_aluResult_T_18"} : i8
    %46 = comb.mux bin %7, %37, %45 {sv.namehint = "_aluResult_T_20"} : i8
    %47 = comb.mux bin %9, %33, %46 {sv.namehint = "_aluResult_T_22"} : i8
    %48 = comb.extract %41 from 0 : (i15) -> i8
    %49 = comb.mux bin %10, %48, %47 {sv.namehint = "aluResult"} : i8
    %50 = comb.or bin %8, %9, %10 : i1
    %51 = comb.icmp bin ne %1, %c0_i3 : i3
    %52 = comb.and bin %50, %51 : i1
    %53 = comb.xor bin %51, %true : i1
    %54 = comb.and bin %52, %53 : i1
    %55 = comb.mux bin %54, %49, %reg_cpu_regs_0 : i8
    %56 = comb.icmp bin eq %1, %c1_i3 : i3
    %57 = comb.and bin %52, %56 : i1
    %58 = comb.mux bin %57, %49, %reg_cpu_regs_1 : i8
    %59 = comb.icmp bin eq %1, %c2_i3 : i3
    %60 = comb.and bin %52, %59 : i1
    %61 = comb.mux bin %60, %49, %reg_cpu_regs_2 : i8
    %62 = comb.icmp bin eq %1, %c3_i3 : i3
    %63 = comb.and bin %52, %62 : i1
    %64 = comb.mux bin %63, %49, %reg_cpu_regs_3 : i8
    %65 = comb.icmp bin eq %1, %c-4_i3 : i3
    %66 = comb.and bin %52, %65 : i1
    %67 = comb.mux bin %66, %49, %reg_cpu_regs_4 : i8
    %68 = comb.icmp bin eq %1, %c-3_i3 : i3
    %69 = comb.and bin %52, %68 : i1
    %70 = comb.mux bin %69, %49, %reg_cpu_regs_5 : i8
    %71 = comb.icmp bin eq %1, %c-2_i3 : i3
    %72 = comb.and bin %52, %71 : i1
    %73 = comb.mux bin %72, %49, %reg_cpu_regs_6 : i8
    %74 = comb.icmp bin eq %1, %c-1_i3 : i3
    %75 = comb.and bin %52, %74 : i1
    %76 = comb.mux bin %75, %49, %reg_cpu_regs_7 : i8
    %77 = comb.icmp bin eq %0, %c-8_i4 {sv.namehint = "_branchTaken_T"} : i4
    %78 = comb.extract %mem_cpu_rom_r_0_data from 9 : (i16) -> i1
    %79 = comb.extract %mem_cpu_rom_r_0_data from 10 : (i16) -> i1
    %80 = comb.extract %mem_cpu_rom_r_0_data from 11 : (i16) -> i1
    %81 = comb.mux %78, %reg_cpu_regs_7, %reg_cpu_regs_6 : i8
    %82 = comb.mux %78, %reg_cpu_regs_5, %reg_cpu_regs_4 : i8
    %83 = comb.mux %79, %81, %82 : i8
    %84 = comb.mux %78, %reg_cpu_regs_3, %reg_cpu_regs_2 : i8
    %85 = comb.mux %78, %reg_cpu_regs_1, %reg_cpu_regs_0 : i8
    %86 = comb.mux %79, %84, %85 : i8
    %87 = comb.mux %80, %83, %86 : i8
    %88 = comb.icmp bin eq %87, %32 {sv.namehint = "_branchTaken_T_1"} : i8
    %89 = comb.and bin %77, %88 {sv.namehint = "branchTaken"} : i1
    %90 = comb.add bin %reg_cpu_pc, %c1_i8 {sv.namehint = "_pcPlus1_T"} : i8
    %91 = comb.icmp bin eq %0, %c-6_i4 {sv.namehint = "_nextPc_T"} : i4
    %92 = comb.icmp bin eq %0, %c-7_i4 {sv.namehint = "_nextPc_T_1"} : i4
    %93 = comb.or %92, %89 : i1
    %94 = comb.mux bin %93, %21, %90 {sv.namehint = "_nextPc_T_3"} : i8
    %95 = comb.xor bin %reg_cpu_halted, %true : i1
    %96 = comb.or %reg_cpu_halted, %91 : i1
    %97 = comb.mux bin %96, %reg_cpu_pc, %94 : i8
    %98 = comb.and bin %95, %91 : i1
    %99 = comb.or %98, %reg_cpu_halted : i1
    %100 = hw.tfoutput %reg_cpu_regs_1 as "out_io_result" : i8
    %101 = hw.tfoutput %reg_cpu_halted as "out_io_halted" : i1
    %102 = hw.tfoutput %97 as "reg_cpu_pc_next" : i8
    %103 = hw.tfoutput %99 as "reg_cpu_halted_next" : i1
    %104 = hw.tfoutput %55 as "reg_cpu_regs_0_next" : i8
    %105 = hw.tfoutput %58 as "reg_cpu_regs_1_next" : i8
    %106 = hw.tfoutput %61 as "reg_cpu_regs_2_next" : i8
    %107 = hw.tfoutput %64 as "reg_cpu_regs_3_next" : i8
    %108 = hw.tfoutput %67 as "reg_cpu_regs_4_next" : i8
    %109 = hw.tfoutput %70 as "reg_cpu_regs_5_next" : i8
    %110 = hw.tfoutput %73 as "reg_cpu_regs_6_next" : i8
    %111 = hw.tfoutput %76 as "reg_cpu_regs_7_next" : i8
    %112 = hw.tfoutput %reg_cpu_pc as "mem_cpu_rom_r_0_addr" : i8
    %113 = hw.tfoutput %in_io_loadAddr as "mem_cpu_rom_w_0_addr" : i8
    %114 = hw.tfoutput %in_io_loadEn as "mem_cpu_rom_w_0_en" : i1
    %115 = hw.tfoutput %in_io_loadData as "mem_cpu_rom_w_0_data" : i16
    hw.output {output_names = ["out_io_result", "out_io_halted", "reg_cpu_pc_next", "reg_cpu_halted_next", "reg_cpu_regs_0_next", "reg_cpu_regs_1_next", "reg_cpu_regs_2_next", "reg_cpu_regs_3_next", "reg_cpu_regs_4_next", "reg_cpu_regs_5_next", "reg_cpu_regs_6_next", "reg_cpu_regs_7_next", "mem_cpu_rom_r_0_addr", "mem_cpu_rom_w_0_addr", "mem_cpu_rom_w_0_en", "mem_cpu_rom_w_0_data"]} %100, %101, %102, %103, %104, %105, %106, %107, %108, %109, %110, %111, %112, %113, %114, %115 : i8, i1, i8, i1, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i1, i16
  }
}

