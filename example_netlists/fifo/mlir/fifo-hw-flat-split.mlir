module {
  hw.module @SimpleChiselTop_transfer(in %in_io_enqValid : i1, in %in_io_enqData : i8, in %in_io_deqReady : i1, in %reg_mem_0 : i8, in %reg_mem_1 : i8, in %reg_mem_2 : i8, in %reg_mem_3 : i8, in %reg_mem_4 : i8, in %reg_mem_5 : i8, in %reg_mem_6 : i8, in %reg_mem_7 : i8, in %reg_head : i3, in %reg_tail : i3, in %reg_count : i4, out out_io_enqReady : i1, out out_io_deqValid : i1, out out_io_deqData : i8, out reg_mem_0_next : i8, out reg_mem_1_next : i8, out reg_mem_2_next : i8, out reg_mem_3_next : i8, out reg_mem_4_next : i8, out reg_mem_5_next : i8, out reg_mem_6_next : i8, out reg_mem_7_next : i8, out reg_head_next : i3, out reg_tail_next : i3, out reg_count_next : i4) {
    %c-1_i3 = hw.constant -1 : i3
    %c0_i3 = hw.constant 0 : i3
    %c0_i4 = hw.constant 0 : i4
    %c-8_i4 = hw.constant -8 : i4
    %c1_i3 = hw.constant 1 : i3
    %c2_i3 = hw.constant 2 : i3
    %c3_i3 = hw.constant 3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c-2_i3 = hw.constant -2 : i3
    %0 = comb.icmp bin ne %reg_count, %c0_i4 {sv.namehint = "io_deqValid"} : i4
    %1 = comb.icmp bin ne %reg_count, %c-8_i4 {sv.namehint = "io_enqReady"} : i4
    %2 = comb.and bin %in_io_enqValid, %1 {sv.namehint = "enqFire"} : i1
    %3 = comb.and bin %in_io_deqReady, %0 {sv.namehint = "deqFire"} : i1
    %4 = comb.icmp bin eq %reg_head, %c0_i3 : i3
    %5 = comb.and bin %2, %4 : i1
    %6 = comb.mux bin %5, %in_io_enqData, %reg_mem_0 : i8
    %7 = comb.icmp bin eq %reg_head, %c1_i3 : i3
    %8 = comb.and bin %2, %7 : i1
    %9 = comb.mux bin %8, %in_io_enqData, %reg_mem_1 : i8
    %10 = comb.icmp bin eq %reg_head, %c2_i3 : i3
    %11 = comb.and bin %2, %10 : i1
    %12 = comb.mux bin %11, %in_io_enqData, %reg_mem_2 : i8
    %13 = comb.icmp bin eq %reg_head, %c3_i3 : i3
    %14 = comb.and bin %2, %13 : i1
    %15 = comb.mux bin %14, %in_io_enqData, %reg_mem_3 : i8
    %16 = comb.icmp bin eq %reg_head, %c-4_i3 : i3
    %17 = comb.and bin %2, %16 : i1
    %18 = comb.mux bin %17, %in_io_enqData, %reg_mem_4 : i8
    %19 = comb.icmp bin eq %reg_head, %c-3_i3 : i3
    %20 = comb.and bin %2, %19 : i1
    %21 = comb.mux bin %20, %in_io_enqData, %reg_mem_5 : i8
    %22 = comb.icmp bin eq %reg_head, %c-2_i3 : i3
    %23 = comb.and bin %2, %22 : i1
    %24 = comb.mux bin %23, %in_io_enqData, %reg_mem_6 : i8
    %25 = comb.icmp bin eq %reg_head, %c-1_i3 : i3
    %26 = comb.and bin %2, %25 : i1
    %27 = comb.mux bin %26, %in_io_enqData, %reg_mem_7 : i8
    %28 = comb.add bin %reg_head, %c1_i3 {sv.namehint = "_head_T"} : i3
    %29 = comb.mux bin %2, %28, %reg_head : i3
    %30 = comb.add bin %reg_tail, %c1_i3 {sv.namehint = "_tail_T"} : i3
    %31 = comb.mux bin %3, %30, %reg_tail : i3
    %32 = comb.concat %c0_i3, %2 : i3, i1
    %33 = comb.add bin %reg_count, %32 {sv.namehint = "_count_T"} : i4
    %34 = comb.concat %c0_i3, %3 : i3, i1
    %35 = comb.sub bin %33, %34 {sv.namehint = "_count_T_2"} : i4
    %36 = comb.extract %reg_tail from 0 : (i3) -> i1
    %37 = comb.extract %reg_tail from 1 : (i3) -> i1
    %38 = comb.extract %reg_tail from 2 : (i3) -> i1
    %39 = comb.mux %36, %reg_mem_7, %reg_mem_6 : i8
    %40 = comb.mux %36, %reg_mem_5, %reg_mem_4 : i8
    %41 = comb.mux %37, %39, %40 : i8
    %42 = comb.mux %36, %reg_mem_3, %reg_mem_2 : i8
    %43 = comb.mux %36, %reg_mem_1, %reg_mem_0 : i8
    %44 = comb.mux %37, %42, %43 : i8
    %45 = comb.mux %38, %41, %44 : i8
    %46 = hw.tfoutput %1 as "out_io_enqReady" : i1
    %47 = hw.tfoutput %0 as "out_io_deqValid" : i1
    %48 = hw.tfoutput %45 as "out_io_deqData" : i8
    %49 = hw.tfoutput %6 as "reg_mem_0_next" : i8
    %50 = hw.tfoutput %9 as "reg_mem_1_next" : i8
    %51 = hw.tfoutput %12 as "reg_mem_2_next" : i8
    %52 = hw.tfoutput %15 as "reg_mem_3_next" : i8
    %53 = hw.tfoutput %18 as "reg_mem_4_next" : i8
    %54 = hw.tfoutput %21 as "reg_mem_5_next" : i8
    %55 = hw.tfoutput %24 as "reg_mem_6_next" : i8
    %56 = hw.tfoutput %27 as "reg_mem_7_next" : i8
    %57 = hw.tfoutput %29 as "reg_head_next" : i3
    %58 = hw.tfoutput %31 as "reg_tail_next" : i3
    %59 = hw.tfoutput %35 as "reg_count_next" : i4
    hw.output {output_names = ["out_io_enqReady", "out_io_deqValid", "out_io_deqData", "reg_mem_0_next", "reg_mem_1_next", "reg_mem_2_next", "reg_mem_3_next", "reg_mem_4_next", "reg_mem_5_next", "reg_mem_6_next", "reg_mem_7_next", "reg_head_next", "reg_tail_next", "reg_count_next"]} %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59 : i1, i1, i8, i8, i8, i8, i8, i8, i8, i8, i8, i3, i3, i4
  }
  hw.module @SimpleChiselTop(in %io_clock : !seq.clock, in %io_reset : i1, in %io_enqValid : i1, in %io_enqData : i8, out io_enqReady : i1, out io_deqValid : i1, out io_deqData : i8, in %io_deqReady : i1) {
    %c0_i3 = hw.constant 0 : i3
    %c0_i4 = hw.constant 0 : i4
    %mem_0 = seq.firreg %SimpleChiselTop_inst.reg_mem_0_next clock %io_clock {firrtl.random_init_start = 0 : ui64} : i8
    %mem_1 = seq.firreg %SimpleChiselTop_inst.reg_mem_1_next clock %io_clock {firrtl.random_init_start = 8 : ui64} : i8
    %mem_2 = seq.firreg %SimpleChiselTop_inst.reg_mem_2_next clock %io_clock {firrtl.random_init_start = 16 : ui64} : i8
    %mem_3 = seq.firreg %SimpleChiselTop_inst.reg_mem_3_next clock %io_clock {firrtl.random_init_start = 24 : ui64} : i8
    %mem_4 = seq.firreg %SimpleChiselTop_inst.reg_mem_4_next clock %io_clock {firrtl.random_init_start = 32 : ui64} : i8
    %mem_5 = seq.firreg %SimpleChiselTop_inst.reg_mem_5_next clock %io_clock {firrtl.random_init_start = 40 : ui64} : i8
    %mem_6 = seq.firreg %SimpleChiselTop_inst.reg_mem_6_next clock %io_clock {firrtl.random_init_start = 48 : ui64} : i8
    %mem_7 = seq.firreg %SimpleChiselTop_inst.reg_mem_7_next clock %io_clock {firrtl.random_init_start = 56 : ui64} : i8
    %head = seq.firreg %SimpleChiselTop_inst.reg_head_next clock %io_clock reset sync %io_reset, %c0_i3 {firrtl.random_init_start = 64 : ui64} : i3
    %tail = seq.firreg %SimpleChiselTop_inst.reg_tail_next clock %io_clock reset sync %io_reset, %c0_i3 {firrtl.random_init_start = 67 : ui64} : i3
    %count = seq.firreg %SimpleChiselTop_inst.reg_count_next clock %io_clock reset sync %io_reset, %c0_i4 {firrtl.random_init_start = 70 : ui64} : i4
    %SimpleChiselTop_inst.out_io_enqReady, %SimpleChiselTop_inst.out_io_deqValid, %SimpleChiselTop_inst.out_io_deqData, %SimpleChiselTop_inst.reg_mem_0_next, %SimpleChiselTop_inst.reg_mem_1_next, %SimpleChiselTop_inst.reg_mem_2_next, %SimpleChiselTop_inst.reg_mem_3_next, %SimpleChiselTop_inst.reg_mem_4_next, %SimpleChiselTop_inst.reg_mem_5_next, %SimpleChiselTop_inst.reg_mem_6_next, %SimpleChiselTop_inst.reg_mem_7_next, %SimpleChiselTop_inst.reg_head_next, %SimpleChiselTop_inst.reg_tail_next, %SimpleChiselTop_inst.reg_count_next = hw.instance "SimpleChiselTop_inst" @SimpleChiselTop_transfer(in_io_enqValid: %io_enqValid: i1, in_io_enqData: %io_enqData: i8, in_io_deqReady: %io_deqReady: i1, reg_mem_0: %mem_0: i8, reg_mem_1: %mem_1: i8, reg_mem_2: %mem_2: i8, reg_mem_3: %mem_3: i8, reg_mem_4: %mem_4: i8, reg_mem_5: %mem_5: i8, reg_mem_6: %mem_6: i8, reg_mem_7: %mem_7: i8, reg_head: %head: i3, reg_tail: %tail: i3, reg_count: %count: i4) -> (out_io_enqReady: i1, out_io_deqValid: i1, out_io_deqData: i8, reg_mem_0_next: i8, reg_mem_1_next: i8, reg_mem_2_next: i8, reg_mem_3_next: i8, reg_mem_4_next: i8, reg_mem_5_next: i8, reg_mem_6_next: i8, reg_mem_7_next: i8, reg_head_next: i3, reg_tail_next: i3, reg_count_next: i4)
    hw.output %SimpleChiselTop_inst.out_io_enqReady, %SimpleChiselTop_inst.out_io_deqValid, %SimpleChiselTop_inst.out_io_deqData : i1, i1, i8
  }
  om.class @SimpleChiselTop_Class(%basepath: !om.basepath) {
    om.class.fields 
  }
}

