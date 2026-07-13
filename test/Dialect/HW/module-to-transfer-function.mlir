// RUN: circt-opt --hw-module-to-transfer-function %s | FileCheck %s

// CHECK: hw.module @top_transfer(in %in_en : i1, in %in_load : i1, in %in_data_in : i8, in %in_seed : i16, in %reg_u_basic_count : i8, in %reg_up_q : i8, in %reg_dn_q : i8, in %reg_data_q : i8, in %reg_lfsr_q : i16, in %reg_tick_q : i8, out out_count_up : i8, out out_count_dn : i8, out out_count_basic : i8, out out_lfsr_out : i16, out out_data_reg : i8, out out_parity : i1, out out_tick : i1, out reg_u_basic_count_next : i8, out reg_up_q_next : i8, out reg_dn_q_next : i8, out reg_data_q_next : i8, out reg_lfsr_q_next : i16, out reg_tick_q_next : i8) {
// CHECK-DAG:   [[OUT_COUNT_UP:%.+]] = hw.tfoutput %reg_up_q as "out_count_up" : i8
// CHECK-DAG:   [[OUT_COUNT_DN:%.+]] = hw.tfoutput %reg_dn_q as "out_count_dn" : i8
// CHECK-DAG:   [[OUT_COUNT_BASIC:%.+]] = hw.tfoutput %reg_u_basic_count as "out_count_basic" : i8
// CHECK:       hw.output {{.*}} [[OUT_COUNT_UP]], [[OUT_COUNT_DN]], [[OUT_COUNT_BASIC]]

// CHECK: hw.module @top(in %clk : i1, in %rst_n : i1, in %en : i1, in %load : i1, in %data_in : i8, in %seed : i16, out count_up : i8, out count_dn : i8, out count_basic : i8, out lfsr_out : i16, out data_reg : i8, out parity : i1, out tick : i1) {
// CHECK-NOT: comb.add
// CHECK-NOT: comb.mux
// CHECK: seq.firreg
// CHECK: hw.instance "top_inst" @top_transfer(in_en: %en: i1, in_load: %load: i1, in_data_in: %data_in: i8, in_seed: %seed: i16, reg_u_basic_count: %u_basic2Fcount: i8, reg_up_q: %up_q: i8, reg_dn_q: %dn_q: i8, reg_data_q: %data_q: i8, reg_lfsr_q: %lfsr_q: i16, reg_tick_q: %tick_q: i8) -> (out_count_up: i8, out_count_dn: i8, out_count_basic: i8, out_lfsr_out: i16, out_data_reg: i8, out_parity: i1, out_tick: i1, reg_u_basic_count_next: i8, reg_up_q_next: i8, reg_dn_q_next: i8, reg_data_q_next: i8, reg_lfsr_q_next: i16, reg_tick_q_next: i8)
// CHECK: hw.output

// CHECK: hw.module @FirMem_transfer(in %in_addr : i4, in %in_data : i42, in %mem_mymem1_r_0_data : i42, out out_out : i42, out mem_mymem1_r_0_addr : i4, out mem_mymem1_r_0_en : i1, out mem_mymem1_w_0_addr : i4, out mem_mymem1_w_0_en : i1, out mem_mymem1_w_0_data : i42) {
// CHECK-DAG:   [[OUT_OUT:%.+]] = hw.tfoutput %mem_mymem1_r_0_data as "out_out" : i42
// CHECK-DAG:   [[ADDR:%.+]] = hw.tfoutput %in_addr as "mem_mymem1_r_0_addr" : i4
// CHECK:       hw.output {{.*}} [[OUT_OUT]], [[ADDR]]
// CHECK:       }

// CHECK: hw.module @FirMem
// CHECK: seq.firmem
// CHECK: seq.firmem.read_port
// CHECK: seq.firmem.write_port
// CHECK: hw.instance "FirMem_inst" @FirMem_transfer

module {
  hw.module @top(in %clk : i1, in %rst_n : i1, in %en : i1, in %load : i1, in %data_in : i8, in %seed : i16, out count_up : i8, out count_dn : i8, out count_basic : i8, out lfsr_out : i16, out data_reg : i8, out parity : i1, out tick : i1) {
    %true = hw.constant true
    %c-1_i16 = hw.constant -1 : i16
    %c0_i16 = hw.constant 0 : i16
    %c-1_i8 = hw.constant -1 : i8
    %c0_i8 = hw.constant 0 : i8
    %c1_i8 = hw.constant 1 : i8
    %true_0 = hw.constant true
    %c1_i8_1 = hw.constant 1 : i8
    %c0_i8_2 = hw.constant 0 : i8
    %0 = comb.add %u_basic2Fcount, %c1_i8_1 : i8
    %1 = seq.to_clock %clk
    %2 = comb.xor %rst_n, %true_0 : i1
    %3 = comb.mux bin %en, %0, %u_basic2Fcount : i8
    %u_basic2Fcount = seq.firreg %3 clock %1 reset async %2, %c0_i8_2 {name = "u_basic/count"} : i8
    %4 = comb.add %up_q, %c1_i8 : i8
    %5 = comb.add %dn_q, %c-1_i8 : i8
    %6 = comb.mux %en, %4, %up_q : i8
    %7 = comb.mux %en, %5, %dn_q : i8
    %8 = seq.to_clock %clk
    %9 = comb.xor %rst_n, %true : i1
    %up_q = seq.firreg %6 clock %8 reset async %9, %c0_i8 : i8
    %dn_q = seq.firreg %7 clock %8 reset async %9, %c-1_i8 : i8
    %10 = comb.xor %data_q, %up_q : i8
    %11 = comb.xor %load, %true : i1
    %12 = comb.and %en, %11 : i1
    %13 = comb.mux %12, %10, %data_in : i8
    %14 = comb.or %load, %en : i1
    %15 = comb.mux bin %14, %13, %data_q : i8
    %data_q = seq.firreg %15 clock %8 reset async %9, %c0_i8 : i8
    %16 = comb.extract %lfsr_q from 15 : (i16) -> i1
    %17 = comb.extract %lfsr_q from 13 : (i16) -> i1
    %18 = comb.extract %lfsr_q from 12 : (i16) -> i1
    %19 = comb.extract %lfsr_q from 10 : (i16) -> i1
    %20 = comb.xor %16, %17, %18, %19 : i1
    %21 = comb.icmp eq %seed, %c0_i16 : i16
    %22 = comb.mux %21, %c-1_i16, %seed : i16
    %23 = comb.extract %lfsr_q from 0 : (i16) -> i15
    %24 = comb.concat %23, %20 : i15, i1
    %25 = comb.mux %12, %24, %22 : i16
    %26 = comb.mux bin %14, %25, %lfsr_q : i16
    %lfsr_q = seq.firreg %26 clock %8 reset async %9, %c-1_i16 : i16
    %27 = comb.add %tick_q, %c1_i8 : i8
    %28 = comb.mux bin %en, %27, %tick_q : i8
    %tick_q = seq.firreg %28 clock %8 reset async %9, %c0_i8 : i8
    %29 = comb.icmp eq %tick_q, %c-1_i8 : i8
    %30 = comb.parity %data_q : i8
    hw.output %up_q, %dn_q, %u_basic2Fcount, %lfsr_q, %data_q, %30, %29 : i8, i8, i8, i16, i8, i1, i1
  }

  hw.module @FirMem(in %addr : i4, in %clock : !seq.clock, in %data : i42, out out: i42) {
    %true = hw.constant true
    %0 = seq.firmem name "mymem1" 0, 1, undefined, undefined : <12 x 42, mask 3>
    %1 = seq.firmem.read_port %0[%addr], clock %clock enable %true : <12 x 42, mask 3>
    seq.firmem.write_port %0[%addr] = %data, clock %clock enable %true {w0} : <12 x 42, mask 3>
    hw.output %1 : i42
  }
}
