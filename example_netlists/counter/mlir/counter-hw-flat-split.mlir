module {
  hw.module @SimpleChiselTop_transfer(in %reg_count : i8, out out_io_count : i8, out out_io_atMax : i1, out reg_count_next : i8) {
    %c1_i8 = hw.constant 1 : i8
    %c-56_i8 = hw.constant -56 : i8
    %0 = comb.add bin %reg_count, %c1_i8 {sv.namehint = "_count_T"} : i8
    %1 = comb.icmp bin eq %reg_count, %c-56_i8 {sv.namehint = "io_atMax"} : i8
    %2 = hw.tfoutput %reg_count as "out_io_count" : i8
    %3 = hw.tfoutput %1 as "out_io_atMax" : i1
    %4 = hw.tfoutput %0 as "reg_count_next" : i8
    hw.output {output_names = ["out_io_count", "out_io_atMax", "reg_count_next"]} %2, %3, %4 : i8, i1, i8
  }
  hw.module @SimpleChiselTop(in %io_clock : !seq.clock, in %io_reset : i1, out io_count : i8, out io_atMax : i1) {
    %c0_i8 = hw.constant 0 : i8
    %count = seq.firreg %SimpleChiselTop_inst.reg_count_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 0 : ui64, sv.namehint = "count"} : i8
    %SimpleChiselTop_inst.out_io_count, %SimpleChiselTop_inst.out_io_atMax, %SimpleChiselTop_inst.reg_count_next = hw.instance "SimpleChiselTop_inst" @SimpleChiselTop_transfer(reg_count: %count: i8) -> (out_io_count: i8, out_io_atMax: i1, reg_count_next: i8)
    hw.output %SimpleChiselTop_inst.out_io_count, %SimpleChiselTop_inst.out_io_atMax : i8, i1
  }
  om.class @SimpleChiselTop_Class(%basepath: !om.basepath) {
    om.class.fields 
  }
}

