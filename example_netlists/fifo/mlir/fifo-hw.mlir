module {
  hw.module @SimpleChiselTop(in %io_clock : !seq.clock, in %io_reset : i1, in %io_enqValid : i1, in %io_enqData : i8, out io_enqReady : i1, out io_deqValid : i1, out io_deqData : i8, in %io_deqReady : i1) {
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
    %mem_0 = seq.firreg %6 clock %io_clock {firrtl.random_init_start = 0 : ui64} : i8
    %mem_1 = seq.firreg %9 clock %io_clock {firrtl.random_init_start = 8 : ui64} : i8
    %mem_2 = seq.firreg %12 clock %io_clock {firrtl.random_init_start = 16 : ui64} : i8
    %mem_3 = seq.firreg %15 clock %io_clock {firrtl.random_init_start = 24 : ui64} : i8
    %mem_4 = seq.firreg %18 clock %io_clock {firrtl.random_init_start = 32 : ui64} : i8
    %mem_5 = seq.firreg %21 clock %io_clock {firrtl.random_init_start = 40 : ui64} : i8
    %mem_6 = seq.firreg %24 clock %io_clock {firrtl.random_init_start = 48 : ui64} : i8
    %mem_7 = seq.firreg %27 clock %io_clock {firrtl.random_init_start = 56 : ui64} : i8
    %head = seq.firreg %29 clock %io_clock reset sync %io_reset, %c0_i3 {firrtl.random_init_start = 64 : ui64} : i3
    %tail = seq.firreg %31 clock %io_clock reset sync %io_reset, %c0_i3 {firrtl.random_init_start = 67 : ui64} : i3
    %count = seq.firreg %35 clock %io_clock reset sync %io_reset, %c0_i4 {firrtl.random_init_start = 70 : ui64} : i4
    %0 = comb.icmp bin ne %count, %c0_i4 {sv.namehint = "io_deqValid"} : i4
    %1 = comb.icmp bin ne %count, %c-8_i4 {sv.namehint = "io_enqReady"} : i4
    %2 = comb.and bin %io_enqValid, %1 {sv.namehint = "enqFire"} : i1
    %3 = comb.and bin %io_deqReady, %0 {sv.namehint = "deqFire"} : i1
    %4 = comb.icmp bin eq %head, %c0_i3 : i3
    %5 = comb.and bin %2, %4 : i1
    %6 = comb.mux bin %5, %io_enqData, %mem_0 : i8
    %7 = comb.icmp bin eq %head, %c1_i3 : i3
    %8 = comb.and bin %2, %7 : i1
    %9 = comb.mux bin %8, %io_enqData, %mem_1 : i8
    %10 = comb.icmp bin eq %head, %c2_i3 : i3
    %11 = comb.and bin %2, %10 : i1
    %12 = comb.mux bin %11, %io_enqData, %mem_2 : i8
    %13 = comb.icmp bin eq %head, %c3_i3 : i3
    %14 = comb.and bin %2, %13 : i1
    %15 = comb.mux bin %14, %io_enqData, %mem_3 : i8
    %16 = comb.icmp bin eq %head, %c-4_i3 : i3
    %17 = comb.and bin %2, %16 : i1
    %18 = comb.mux bin %17, %io_enqData, %mem_4 : i8
    %19 = comb.icmp bin eq %head, %c-3_i3 : i3
    %20 = comb.and bin %2, %19 : i1
    %21 = comb.mux bin %20, %io_enqData, %mem_5 : i8
    %22 = comb.icmp bin eq %head, %c-2_i3 : i3
    %23 = comb.and bin %2, %22 : i1
    %24 = comb.mux bin %23, %io_enqData, %mem_6 : i8
    %25 = comb.icmp bin eq %head, %c-1_i3 : i3
    %26 = comb.and bin %2, %25 : i1
    %27 = comb.mux bin %26, %io_enqData, %mem_7 : i8
    %28 = comb.add bin %head, %c1_i3 {sv.namehint = "_head_T"} : i3
    %29 = comb.mux bin %2, %28, %head : i3
    %30 = comb.add bin %tail, %c1_i3 {sv.namehint = "_tail_T"} : i3
    %31 = comb.mux bin %3, %30, %tail : i3
    %32 = comb.concat %c0_i3, %2 : i3, i1
    %33 = comb.add bin %count, %32 {sv.namehint = "_count_T"} : i4
    %34 = comb.concat %c0_i3, %3 : i3, i1
    %35 = comb.sub bin %33, %34 {sv.namehint = "_count_T_2"} : i4
    %36 = hw.array_create %mem_7, %mem_6, %mem_5, %mem_4, %mem_3, %mem_2, %mem_1, %mem_0 : i8
    %37 = hw.array_get %36[%tail] {sv.namehint = "io_deqData"} : !hw.array<8xi8>, i3
    hw.output %1, %0, %37 : i1, i1, i8
  }
  om.class @SimpleChiselTop_Class(%basepath: !om.basepath) {
    om.class.fields 
  }
}
