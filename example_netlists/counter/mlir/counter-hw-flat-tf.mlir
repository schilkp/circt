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
}

