module {
  hw.module private @BusMaster(in %clock : !seq.clock, in %reset : i1, in %io_loadEn : i1, in %io_loadAddr : i4, in %io_loadData : i16, out io_req_valid : i1, out io_req_write : i1, out io_req_addr : i8, out io_req_wdata : i8, in %io_resp_granted : i1, in %io_resp_rdata : i8, out io_halted : i1, out io_debug : i8) {
    %c-1_i2 = hw.constant -1 : i2
    %c0_i2 = hw.constant 0 : i2
    %false = hw.constant false
    %true = hw.constant true
    %c0_i4 = hw.constant 0 : i4
    %c1_i4 = hw.constant 1 : i4
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c1_i2 = hw.constant 1 : i2
    %c-2_i2 = hw.constant -2 : i2
    %c0_i8 = hw.constant 0 : i8
    %instrMem = seq.firmem 0, 1, undefined, port_order : <16 x 14>
    seq.firmem.write_port %instrMem[%io_loadAddr] = %1, clock %clock enable %io_loadEn : <16 x 14>
    %0 = seq.firmem.read_port %instrMem[%pc], clock %clock : <16 x 14>
    %1 = comb.extract %io_loadData from 2 : (i16) -> i14
    %pc = seq.firreg %13 clock %clock reset sync %reset, %c0_i4 {firrtl.random_init_start = 0 : ui64} : i4
    %halted = seq.firreg %29 clock %clock reset sync %reset, %false {firrtl.random_init_start = 4 : ui64, sv.namehint = "halted"} : i1
    %regs_0 = seq.firreg %17 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 5 : ui64, sv.namehint = "regs_0"} : i8
    %regs_1 = seq.firreg %20 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 13 : ui64} : i8
    %regs_2 = seq.firreg %23 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 21 : ui64} : i8
    %regs_3 = seq.firreg %26 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 29 : ui64} : i8
    %2 = comb.extract %0 from 10 : (i14) -> i4
    %3 = comb.extract %0 from 8 : (i14) -> i2
    %4 = comb.extract %0 from 0 {sv.namehint = "io_req_addr"} : (i14) -> i8
    %5 = comb.icmp bin eq %2, %c1_i4 {sv.namehint = "isLoad"} : i4
    %6 = comb.icmp bin eq %2, %c2_i4 {sv.namehint = "isStore"} : i4
    %7 = comb.xor bin %halted, %true {sv.namehint = "_io_req_valid_T"} : i1
    %8 = comb.or bin %5, %6 {sv.namehint = "_io_req_valid_T_1"} : i1
    %9 = comb.and bin %7, %8 {sv.namehint = "io_req_valid"} : i1
    %10 = hw.array_create %regs_3, %regs_2, %regs_1, %regs_0 : i8
    %11 = hw.array_get %10[%3] {sv.namehint = "io_req_wdata"} : !hw.array<4xi8>, i2
    %12 = comb.add bin %pc, %c1_i4 {sv.namehint = "_pc_T"} : i4
    %13 = comb.mux bin %halted, %pc, %12 : i4
    %14 = comb.and bin %5, %io_resp_granted : i1
    %15 = comb.icmp bin eq %3, %c0_i2 : i2
    %16 = comb.and bin %7, %14, %15 : i1
    %17 = comb.mux bin %16, %io_resp_rdata, %regs_0 : i8
    %18 = comb.icmp bin eq %3, %c1_i2 : i2
    %19 = comb.and bin %7, %14, %18 : i1
    %20 = comb.mux bin %19, %io_resp_rdata, %regs_1 : i8
    %21 = comb.icmp bin eq %3, %c-2_i2 : i2
    %22 = comb.and bin %7, %14, %21 : i1
    %23 = comb.mux bin %22, %io_resp_rdata, %regs_2 : i8
    %24 = comb.icmp bin eq %3, %c-1_i2 : i2
    %25 = comb.and bin %7, %14, %24 : i1
    %26 = comb.mux bin %25, %io_resp_rdata, %regs_3 : i8
    %27 = comb.icmp bin eq %2, %c3_i4 : i4
    %28 = comb.and bin %7, %27 : i1
    %29 = comb.or %28, %halted : i1
    hw.output %9, %6, %4, %11, %halted, %regs_0 : i1, i1, i8, i8, i1, i8
  }
  hw.module private @RegFilePeriph(in %clock : !seq.clock, in %reset : i1, in %io_sel : i1, in %io_write : i1, in %io_addr : i5, in %io_wdata : i8, out io_rdata : i8) {
    %c-1_i3 = hw.constant -1 : i3
    %c0_i3 = hw.constant 0 : i3
    %c1_i3 = hw.constant 1 : i3
    %c2_i3 = hw.constant 2 : i3
    %c3_i3 = hw.constant 3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c-2_i3 = hw.constant -2 : i3
    %c0_i8 = hw.constant 0 : i8
    %mem_0 = seq.firreg %4 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 0 : ui64} : i8
    %mem_1 = seq.firreg %7 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 8 : ui64} : i8
    %mem_2 = seq.firreg %10 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 16 : ui64} : i8
    %mem_3 = seq.firreg %13 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 24 : ui64} : i8
    %mem_4 = seq.firreg %16 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 32 : ui64} : i8
    %mem_5 = seq.firreg %19 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 40 : ui64} : i8
    %mem_6 = seq.firreg %22 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 48 : ui64} : i8
    %mem_7 = seq.firreg %25 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 56 : ui64} : i8
    %0 = comb.extract %io_addr from 0 {sv.namehint = "idx"} : (i5) -> i3
    %1 = comb.and bin %io_sel, %io_write : i1
    %2 = comb.icmp bin eq %0, %c0_i3 : i3
    %3 = comb.and bin %1, %2 : i1
    %4 = comb.mux bin %3, %io_wdata, %mem_0 : i8
    %5 = comb.icmp bin eq %0, %c1_i3 : i3
    %6 = comb.and bin %1, %5 : i1
    %7 = comb.mux bin %6, %io_wdata, %mem_1 : i8
    %8 = comb.icmp bin eq %0, %c2_i3 : i3
    %9 = comb.and bin %1, %8 : i1
    %10 = comb.mux bin %9, %io_wdata, %mem_2 : i8
    %11 = comb.icmp bin eq %0, %c3_i3 : i3
    %12 = comb.and bin %1, %11 : i1
    %13 = comb.mux bin %12, %io_wdata, %mem_3 : i8
    %14 = comb.icmp bin eq %0, %c-4_i3 : i3
    %15 = comb.and bin %1, %14 : i1
    %16 = comb.mux bin %15, %io_wdata, %mem_4 : i8
    %17 = comb.icmp bin eq %0, %c-3_i3 : i3
    %18 = comb.and bin %1, %17 : i1
    %19 = comb.mux bin %18, %io_wdata, %mem_5 : i8
    %20 = comb.icmp bin eq %0, %c-2_i3 : i3
    %21 = comb.and bin %1, %20 : i1
    %22 = comb.mux bin %21, %io_wdata, %mem_6 : i8
    %23 = comb.icmp bin eq %0, %c-1_i3 : i3
    %24 = comb.and bin %1, %23 : i1
    %25 = comb.mux bin %24, %io_wdata, %mem_7 : i8
    %26 = hw.array_create %mem_7, %mem_6, %mem_5, %mem_4, %mem_3, %mem_2, %mem_1, %mem_0 : i8
    %27 = hw.array_get %26[%0] {sv.namehint = "io_rdata"} : !hw.array<8xi8>, i3
    hw.output %27 : i8
  }
  hw.module private @CounterPeriph(in %clock : !seq.clock, in %reset : i1, in %io_sel : i1, in %io_write : i1, in %io_wdata : i8, out io_rdata : i8) {
    %c1_i8 = hw.constant 1 : i8
    %c0_i8 = hw.constant 0 : i8
    %count = seq.firreg %2 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 0 : ui64, sv.namehint = "count"} : i8
    %0 = comb.add bin %count, %c1_i8 {sv.namehint = "_count_T"} : i8
    %1 = comb.and bin %io_sel, %io_write : i1
    %2 = comb.mux bin %1, %io_wdata, %0 : i8
    hw.output %count : i8
  }
  hw.module private @GpioPeriph(in %clock : !seq.clock, in %reset : i1, in %io_sel : i1, in %io_write : i1, in %io_wdata : i8, out io_rdata : i8, out pins : i8) {
    %c0_i8 = hw.constant 0 : i8
    %reg = seq.firreg %1 clock %clock reset sync %reset, %c0_i8 {firrtl.random_init_start = 0 : ui64, sv.namehint = "reg"} : i8
    %0 = comb.and bin %io_sel, %io_write : i1
    %1 = comb.mux bin %0, %io_wdata, %reg : i8
    hw.output %reg, %reg : i8, i8
  }
  hw.module @SimpleChiselTop(in %io_clock : !seq.clock, in %io_reset : i1, in %io_loadEn_0 : i1, in %io_loadEn_1 : i1, in %io_loadEn_2 : i1, in %io_loadAddr_0 : i4, in %io_loadAddr_1 : i4, in %io_loadAddr_2 : i4, in %io_loadData_0 : i16, in %io_loadData_1 : i16, in %io_loadData_2 : i16, out io_masterHalted_0 : i1, out io_masterHalted_1 : i1, out io_masterHalted_2 : i1, out io_masterDebug_0 : i8, out io_masterDebug_1 : i8, out io_masterDebug_2 : i8, out io_gpioPins : i8) {
    %c0_i5 = hw.constant 0 : i5
    %c2_i3 = hw.constant 2 : i3
    %c1_i3 = hw.constant 1 : i3
    %c0_i3 = hw.constant 0 : i3
    %true = hw.constant true
    %c0_i8 = hw.constant 0 : i8
    %masters_0.io_req_valid, %masters_0.io_req_write, %masters_0.io_req_addr, %masters_0.io_req_wdata, %masters_0.io_halted, %masters_0.io_debug = hw.instance "masters_0" @BusMaster(clock: %io_clock: !seq.clock, reset: %io_reset: i1, io_loadEn: %io_loadEn_0: i1, io_loadAddr: %io_loadAddr_0: i4, io_loadData: %io_loadData_0: i16, io_resp_granted: %70: i1, io_resp_rdata: %74: i8) -> (io_req_valid: i1, io_req_write: i1, io_req_addr: i8, io_req_wdata: i8, io_halted: i1, io_debug: i8) {sv.namehint = "io_masterDebug_0"}
    %masters_1.io_req_valid, %masters_1.io_req_write, %masters_1.io_req_addr, %masters_1.io_req_wdata, %masters_1.io_halted, %masters_1.io_debug = hw.instance "masters_1" @BusMaster(clock: %io_clock: !seq.clock, reset: %io_reset: i1, io_loadEn: %io_loadEn_1: i1, io_loadAddr: %io_loadAddr_1: i4, io_loadData: %io_loadData_1: i16, io_resp_granted: %75: i1, io_resp_rdata: %79: i8) -> (io_req_valid: i1, io_req_write: i1, io_req_addr: i8, io_req_wdata: i8, io_halted: i1, io_debug: i8) {sv.namehint = "io_masterDebug_1"}
    %masters_2.io_req_valid, %masters_2.io_req_write, %masters_2.io_req_addr, %masters_2.io_req_wdata, %masters_2.io_halted, %masters_2.io_debug = hw.instance "masters_2" @BusMaster(clock: %io_clock: !seq.clock, reset: %io_reset: i1, io_loadEn: %io_loadEn_2: i1, io_loadAddr: %io_loadAddr_2: i4, io_loadData: %io_loadData_2: i16, io_resp_granted: %80: i1, io_resp_rdata: %84: i8) -> (io_req_valid: i1, io_req_write: i1, io_req_addr: i8, io_req_wdata: i8, io_halted: i1, io_debug: i8) {sv.namehint = "io_masterDebug_2"}
    %regFile.io_rdata = hw.instance "regFile" @RegFilePeriph(clock: %io_clock: !seq.clock, reset: %io_reset: i1, io_sel: %49: i1, io_write: %47: i1, io_addr: %43: i5, io_wdata: %36: i8) -> (io_rdata: i8)
    %counter.io_rdata = hw.instance "counter" @CounterPeriph(clock: %io_clock: !seq.clock, reset: %io_reset: i1, io_sel: %59: i1, io_write: %57: i1, io_wdata: %53: i8) -> (io_rdata: i8)
    %gpio.io_rdata, %gpio.pins = hw.instance "gpio" @GpioPeriph(clock: %io_clock: !seq.clock, reset: %io_reset: i1, io_sel: %69: i1, io_write: %67: i1, io_wdata: %63: i8) -> (io_rdata: i8, pins: i8) {sv.namehint = "io_gpioPins"}
    %0 = comb.extract %masters_0.io_req_addr from 5 {sv.namehint = "_grant_T_24"} : (i8) -> i3
    %1 = comb.icmp bin eq %0, %c0_i3 {sv.namehint = "_grant_T_1"} : i3
    %2 = comb.and bin %masters_0.io_req_valid, %1 {sv.namehint = "grant_0_0"} : i1
    %3 = comb.extract %masters_1.io_req_addr from 5 {sv.namehint = "_grant_T_27"} : (i8) -> i3
    %4 = comb.icmp bin eq %3, %c0_i3 {sv.namehint = "_grant_T_4"} : i3
    %5 = comb.and bin %masters_1.io_req_valid, %4 {sv.namehint = "_grant_T_5"} : i1
    %6 = comb.extract %masters_2.io_req_addr from 5 {sv.namehint = "_grant_T_30"} : (i8) -> i3
    %7 = comb.icmp bin eq %6, %c0_i3 {sv.namehint = "_grant_T_7"} : i3
    %8 = comb.xor bin %2, %true {sv.namehint = "_grant_oh_1_T"} : i1
    %9 = comb.and bin %5, %8 {sv.namehint = "grant_0_1"} : i1
    %10 = comb.or bin %2, %5 {sv.namehint = "_grant_T_10"} : i1
    %11 = comb.xor bin %10, %true {sv.namehint = "_grant_oh_2_T"} : i1
    %12 = comb.and bin %masters_2.io_req_valid, %7, %11 {sv.namehint = "grant_0_2"} : i1
    %13 = comb.icmp bin eq %0, %c1_i3 {sv.namehint = "_grant_T_13"} : i3
    %14 = comb.and bin %masters_0.io_req_valid, %13 {sv.namehint = "grant_1_0"} : i1
    %15 = comb.icmp bin eq %3, %c1_i3 {sv.namehint = "_grant_T_16"} : i3
    %16 = comb.and bin %masters_1.io_req_valid, %15 {sv.namehint = "_grant_T_17"} : i1
    %17 = comb.icmp bin eq %6, %c1_i3 {sv.namehint = "_grant_T_19"} : i3
    %18 = comb.xor bin %14, %true {sv.namehint = "_grant_oh_1_T_2"} : i1
    %19 = comb.and bin %16, %18 {sv.namehint = "grant_1_1"} : i1
    %20 = comb.or bin %14, %16 {sv.namehint = "_grant_T_22"} : i1
    %21 = comb.xor bin %20, %true {sv.namehint = "_grant_oh_2_T_2"} : i1
    %22 = comb.and bin %masters_2.io_req_valid, %17, %21 {sv.namehint = "grant_1_2"} : i1
    %23 = comb.icmp bin eq %0, %c2_i3 {sv.namehint = "_grant_T_25"} : i3
    %24 = comb.and bin %masters_0.io_req_valid, %23 {sv.namehint = "grant_2_0"} : i1
    %25 = comb.icmp bin eq %3, %c2_i3 {sv.namehint = "_grant_T_28"} : i3
    %26 = comb.and bin %masters_1.io_req_valid, %25 {sv.namehint = "_grant_T_29"} : i1
    %27 = comb.icmp bin eq %6, %c2_i3 {sv.namehint = "_grant_T_31"} : i3
    %28 = comb.xor bin %24, %true {sv.namehint = "_grant_oh_1_T_4"} : i1
    %29 = comb.and bin %26, %28 {sv.namehint = "grant_2_1"} : i1
    %30 = comb.or bin %24, %26 {sv.namehint = "_grant_T_34"} : i1
    %31 = comb.xor bin %30, %true {sv.namehint = "_grant_oh_2_T_4"} : i1
    %32 = comb.and bin %masters_2.io_req_valid, %27, %31 {sv.namehint = "grant_2_2"} : i1
    %33 = comb.mux bin %2, %masters_0.io_req_wdata, %c0_i8 {sv.namehint = "_selMaster_T"} : i8
    %34 = comb.mux bin %9, %masters_1.io_req_wdata, %c0_i8 {sv.namehint = "_selMaster_T_1"} : i8
    %35 = comb.mux bin %12, %masters_2.io_req_wdata, %c0_i8 {sv.namehint = "_selMaster_T_2"} : i8
    %36 = comb.or bin %33, %34, %35 {sv.namehint = "selMaster_wdata"} : i8
    %37 = comb.extract %masters_0.io_req_addr from 0 : (i8) -> i5
    %38 = comb.mux bin %2, %37, %c0_i5 {sv.namehint = "_selMaster_T_5"} : i5
    %39 = comb.extract %masters_1.io_req_addr from 0 : (i8) -> i5
    %40 = comb.mux bin %9, %39, %c0_i5 {sv.namehint = "_selMaster_T_6"} : i5
    %41 = comb.extract %masters_2.io_req_addr from 0 : (i8) -> i5
    %42 = comb.mux bin %12, %41, %c0_i5 {sv.namehint = "_selMaster_T_7"} : i5
    %43 = comb.or bin %38, %40, %42 {sv.namehint = "selMaster_addr"} : i5
    %44 = comb.and %2, %masters_0.io_req_write {sv.namehint = "_selMaster_T_10"} : i1
    %45 = comb.and %9, %masters_1.io_req_write {sv.namehint = "_selMaster_T_11"} : i1
    %46 = comb.and %12, %masters_2.io_req_write {sv.namehint = "_selMaster_T_12"} : i1
    %47 = comb.or bin %44, %45, %46 {sv.namehint = "selMaster_write"} : i1
    %48 = comb.concat %12, %9, %2 {sv.namehint = "_regFile_io_sel_T"} : i1, i1, i1
    %49 = comb.icmp bin ne %48, %c0_i3 {sv.namehint = "regFile.io_sel"} : i3
    %50 = comb.mux bin %14, %masters_0.io_req_wdata, %c0_i8 {sv.namehint = "_selMaster_T_20"} : i8
    %51 = comb.mux bin %19, %masters_1.io_req_wdata, %c0_i8 {sv.namehint = "_selMaster_T_21"} : i8
    %52 = comb.mux bin %22, %masters_2.io_req_wdata, %c0_i8 {sv.namehint = "_selMaster_T_22"} : i8
    %53 = comb.or bin %50, %51, %52 {sv.namehint = "counter.io_wdata"} : i8
    %54 = comb.and %14, %masters_0.io_req_write {sv.namehint = "_selMaster_T_30"} : i1
    %55 = comb.and %19, %masters_1.io_req_write {sv.namehint = "_selMaster_T_31"} : i1
    %56 = comb.and %22, %masters_2.io_req_write {sv.namehint = "_selMaster_T_32"} : i1
    %57 = comb.or bin %54, %55, %56 {sv.namehint = "counter.io_write"} : i1
    %58 = comb.concat %22, %19, %14 {sv.namehint = "_counter_io_sel_T"} : i1, i1, i1
    %59 = comb.icmp bin ne %58, %c0_i3 {sv.namehint = "counter.io_sel"} : i3
    %60 = comb.mux bin %24, %masters_0.io_req_wdata, %c0_i8 {sv.namehint = "_selMaster_T_40"} : i8
    %61 = comb.mux bin %29, %masters_1.io_req_wdata, %c0_i8 {sv.namehint = "_selMaster_T_41"} : i8
    %62 = comb.mux bin %32, %masters_2.io_req_wdata, %c0_i8 {sv.namehint = "_selMaster_T_42"} : i8
    %63 = comb.or bin %60, %61, %62 {sv.namehint = "gpio.io_wdata"} : i8
    %64 = comb.and %24, %masters_0.io_req_write {sv.namehint = "_selMaster_T_50"} : i1
    %65 = comb.and %29, %masters_1.io_req_write {sv.namehint = "_selMaster_T_51"} : i1
    %66 = comb.and %32, %masters_2.io_req_write {sv.namehint = "_selMaster_T_52"} : i1
    %67 = comb.or bin %64, %65, %66 {sv.namehint = "gpio.io_write"} : i1
    %68 = comb.concat %32, %29, %24 {sv.namehint = "_gpio_io_sel_T"} : i1, i1, i1
    %69 = comb.icmp bin ne %68, %c0_i3 {sv.namehint = "gpio.io_sel"} : i3
    %70 = comb.or bin %2, %14, %24 {sv.namehint = "masters_0.io_resp_granted"} : i1
    %71 = comb.mux bin %2, %regFile.io_rdata, %c0_i8 {sv.namehint = "_masters_0_io_resp_rdata_T"} : i8
    %72 = comb.mux bin %14, %counter.io_rdata, %c0_i8 {sv.namehint = "_masters_0_io_resp_rdata_T_1"} : i8
    %73 = comb.mux bin %24, %gpio.io_rdata, %c0_i8 {sv.namehint = "_masters_0_io_resp_rdata_T_2"} : i8
    %74 = comb.or bin %71, %72, %73 {sv.namehint = "masters_0.io_resp_rdata"} : i8
    %75 = comb.or bin %9, %19, %29 {sv.namehint = "masters_1.io_resp_granted"} : i1
    %76 = comb.mux bin %9, %regFile.io_rdata, %c0_i8 {sv.namehint = "_masters_1_io_resp_rdata_T"} : i8
    %77 = comb.mux bin %19, %counter.io_rdata, %c0_i8 {sv.namehint = "_masters_1_io_resp_rdata_T_1"} : i8
    %78 = comb.mux bin %29, %gpio.io_rdata, %c0_i8 {sv.namehint = "_masters_1_io_resp_rdata_T_2"} : i8
    %79 = comb.or bin %76, %77, %78 {sv.namehint = "masters_1.io_resp_rdata"} : i8
    %80 = comb.or bin %12, %22, %32 {sv.namehint = "masters_2.io_resp_granted"} : i1
    %81 = comb.mux bin %12, %regFile.io_rdata, %c0_i8 {sv.namehint = "_masters_2_io_resp_rdata_T"} : i8
    %82 = comb.mux bin %22, %counter.io_rdata, %c0_i8 {sv.namehint = "_masters_2_io_resp_rdata_T_1"} : i8
    %83 = comb.mux bin %32, %gpio.io_rdata, %c0_i8 {sv.namehint = "_masters_2_io_resp_rdata_T_2"} : i8
    %84 = comb.or bin %81, %82, %83 {sv.namehint = "masters_2.io_resp_rdata"} : i8
    hw.output %masters_0.io_halted, %masters_1.io_halted, %masters_2.io_halted, %masters_0.io_debug, %masters_1.io_debug, %masters_2.io_debug, %gpio.pins : i1, i1, i1, i8, i8, i8, i8
  }
  om.class @SimpleChiselTop_Class(%basepath: !om.basepath) {
    om.class.fields 
  }
}
