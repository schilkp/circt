module {
  hw.module @SimpleChiselTop(in %io_clock : !seq.clock, in %io_reset : i1, out io_count : i8, out io_atMax : i1) {
    %c1_i8 = hw.constant 1 : i8
    %c0_i8 = hw.constant 0 : i8
    %c-56_i8 = hw.constant -56 : i8
    %count = seq.firreg %0 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 0 : ui64, sv.namehint = "count"} : i8
    %0 = comb.add bin %count, %c1_i8 {sv.namehint = "_count_T"} : i8
    %1 = comb.icmp bin eq %count, %c-56_i8 {sv.namehint = "io_atMax"} : i8
    hw.output %count, %1 : i8, i1
  }
  om.class @SimpleChiselTop_Class(%basepath: !om.basepath) {
    om.class.fields 
  }
}

