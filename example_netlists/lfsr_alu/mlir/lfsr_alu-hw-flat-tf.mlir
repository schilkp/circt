module {
  hw.module @SimpleChiselTop_transfer(in %in_io_enable : i1, in %in_io_opOverrideEn : i1, in %in_io_opOverride : i3, in %reg_lfsr_state : i32, in %reg_alu_a1 : i8, in %reg_alu_b1 : i8, in %reg_alu_op1 : i3, in %reg_alu_lat1 : i1, in %reg_alu_a2 : i8, in %reg_alu_b2 : i8, in %reg_alu_op2 : i3, in %reg_alu_lat2 : i1, in %reg_alu_arith2 : i8, in %reg_alu_logic2 : i8, in %reg_alu_result_r3 : i8, in %reg_alu_lat_r3 : i1, out out_io_aluResult : i8, out out_io_aluValid : i1, out reg_lfsr_state_next : i32, out reg_alu_a1_next : i8, out reg_alu_b1_next : i8, out reg_alu_op1_next : i3, out reg_alu_lat1_next : i1, out reg_alu_a2_next : i8, out reg_alu_b2_next : i8, out reg_alu_op2_next : i3, out reg_alu_lat2_next : i1, out reg_alu_arith2_next : i8, out reg_alu_logic2_next : i8, out reg_alu_result_r3_next : i8, out reg_alu_lat_r3_next : i1) {
    %c-3_i3 = hw.constant -3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c3_i3 = hw.constant 3 : i3
    %c2_i3 = hw.constant 2 : i3
    %c1_i3 = hw.constant 1 : i3
    %c0_i15 = hw.constant 0 : i15
    %c0_i19 = hw.constant 0 : i19
    %c0_i24 = hw.constant 0 : i24
    %0 = comb.extract %reg_lfsr_state from 31 {sv.namehint = "_tap_T"} : (i32) -> i1
    %1 = comb.extract %reg_lfsr_state from 21 {sv.namehint = "_tap_T_1"} : (i32) -> i1
    %2 = comb.extract %reg_lfsr_state from 1 {sv.namehint = "_tap_T_3"} : (i32) -> i1
    %3 = comb.extract %reg_lfsr_state from 0 {sv.namehint = "_tap_T_5"} : (i32) -> i1
    %4 = comb.xor bin %0, %1, %2, %3 {sv.namehint = "tap"} : i1
    %5 = comb.extract %reg_lfsr_state from 0 {sv.namehint = "_shifted_T"} : (i32) -> i31
    %6 = comb.concat %5, %4 {sv.namehint = "shifted"} : i31, i1
    %7 = comb.concat %reg_alu_result_r3, %c0_i24 {sv.namehint = "_nextState_T"} : i8, i24
    %8 = comb.replicate %reg_alu_lat_r3 : (i1) -> i32
    %9 = comb.and %8, %7 : i32
    %10 = comb.xor %9, %6 {sv.namehint = "nextState"} : i32
    %11 = comb.mux bin %in_io_enable, %10, %reg_lfsr_state : i32
    %12 = comb.extract %reg_lfsr_state from 24 {sv.namehint = "io_a"} : (i32) -> i8
    %13 = comb.extract %reg_lfsr_state from 16 {sv.namehint = "io_b"} : (i32) -> i8
    %14 = comb.extract %reg_lfsr_state from 13 {sv.namehint = "io_op"} : (i32) -> i3
    %15 = comb.extract %reg_lfsr_state from 12 {sv.namehint = "io_latch"} : (i32) -> i1
    %16 = comb.icmp bin eq %reg_alu_op1, %c1_i3 {sv.namehint = "_arith1_T"} : i3
    %17 = comb.sub bin %reg_alu_a1, %reg_alu_b1 {sv.namehint = "_arith1_T_1"} : i8
    %18 = comb.add bin %reg_alu_a1, %reg_alu_b1 {sv.namehint = "_arith1_T_3"} : i8
    %19 = comb.mux bin %16, %17, %18 {sv.namehint = "arith1"} : i8
    %20 = comb.and bin %reg_alu_a1, %reg_alu_b1 {sv.namehint = "_logic1_T_5"} : i8
    %21 = comb.or bin %reg_alu_a1, %reg_alu_b1 {sv.namehint = "_logic1_T_2"} : i8
    %22 = comb.xor bin %reg_alu_a1, %reg_alu_b1 {sv.namehint = "_logic1_T_3"} : i8
    %23 = comb.icmp bin eq %reg_alu_op1, %c3_i3 {sv.namehint = "_logic1_T_6"} : i3
    %24 = comb.mux bin %23, %21, %20 {sv.namehint = "_logic1_T_7"} : i8
    %25 = comb.icmp bin eq %reg_alu_op1, %c-4_i3 {sv.namehint = "_logic1_T_8"} : i3
    %26 = comb.mux bin %25, %22, %24 {sv.namehint = "logic1"} : i8
    %27 = comb.extract %reg_alu_b2 from 0 {sv.namehint = "_shift3_T"} : (i8) -> i4
    %28 = comb.concat %c0_i15, %reg_alu_a2 : i15, i8
    %29 = comb.concat %c0_i19, %27 : i19, i4
    %30 = comb.shl bin %28, %29 {sv.namehint = "shift3"} : i23
    %31 = comb.icmp bin eq %reg_alu_op2, %c2_i3 {sv.namehint = "_muxed_T"} : i3
    %32 = comb.icmp bin eq %reg_alu_op2, %c3_i3 {sv.namehint = "_muxed_T_1"} : i3
    %33 = comb.icmp bin eq %reg_alu_op2, %c-4_i3 {sv.namehint = "_muxed_T_3"} : i3
    %34 = comb.or bin %31, %32, %33 {sv.namehint = "_muxed_T_4"} : i1
    %35 = comb.icmp bin eq %reg_alu_op2, %c-3_i3 {sv.namehint = "_muxed_T_5"} : i3
    %36 = comb.extract %30 from 0 : (i23) -> i8
    %37 = comb.mux bin %35, %36, %reg_alu_arith2 {sv.namehint = "_muxed_T_6"} : i8
    %38 = comb.mux bin %34, %reg_alu_logic2, %37 {sv.namehint = "muxed"} : i8
    %39 = comb.mux bin %in_io_opOverrideEn, %in_io_opOverride, %14 {sv.namehint = "alu.io_op"} : i3
    %40 = hw.tfoutput %reg_alu_result_r3 as "out_io_aluResult" : i8
    %41 = hw.tfoutput %reg_alu_lat_r3 as "out_io_aluValid" : i1
    %42 = hw.tfoutput %11 as "reg_lfsr_state_next" : i32
    %43 = hw.tfoutput %12 as "reg_alu_a1_next" : i8
    %44 = hw.tfoutput %13 as "reg_alu_b1_next" : i8
    %45 = hw.tfoutput %39 as "reg_alu_op1_next" : i3
    %46 = hw.tfoutput %15 as "reg_alu_lat1_next" : i1
    %47 = hw.tfoutput %reg_alu_a1 as "reg_alu_a2_next" : i8
    %48 = hw.tfoutput %reg_alu_b1 as "reg_alu_b2_next" : i8
    %49 = hw.tfoutput %reg_alu_op1 as "reg_alu_op2_next" : i3
    %50 = hw.tfoutput %reg_alu_lat1 as "reg_alu_lat2_next" : i1
    %51 = hw.tfoutput %19 as "reg_alu_arith2_next" : i8
    %52 = hw.tfoutput %26 as "reg_alu_logic2_next" : i8
    %53 = hw.tfoutput %38 as "reg_alu_result_r3_next" : i8
    %54 = hw.tfoutput %reg_alu_lat2 as "reg_alu_lat_r3_next" : i1
    hw.output {output_names = ["out_io_aluResult", "out_io_aluValid", "reg_lfsr_state_next", "reg_alu_a1_next", "reg_alu_b1_next", "reg_alu_op1_next", "reg_alu_lat1_next", "reg_alu_a2_next", "reg_alu_b2_next", "reg_alu_op2_next", "reg_alu_lat2_next", "reg_alu_arith2_next", "reg_alu_logic2_next", "reg_alu_result_r3_next", "reg_alu_lat_r3_next"]} %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54 : i8, i1, i32, i8, i8, i3, i1, i8, i8, i3, i1, i8, i8, i8, i1
  }
}

