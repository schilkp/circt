module {
  hw.module @SimpleChiselTop(in %io_clock : !seq.clock, in %io_reset : i1, in %io_loadEn_0 : i1, in %io_loadEn_1 : i1, in %io_loadEn_2 : i1, in %io_loadAddr_0 : i4, in %io_loadAddr_1 : i4, in %io_loadAddr_2 : i4, in %io_loadData_0 : i16, in %io_loadData_1 : i16, in %io_loadData_2 : i16, out io_masterHalted_0 : i1, out io_masterHalted_1 : i1, out io_masterHalted_2 : i1, out io_masterDebug_0 : i8, out io_masterDebug_1 : i8, out io_masterDebug_2 : i8, out io_gpioPins : i8) {
    %c1_i8 = hw.constant 1 : i8
    %c-2_i3 = hw.constant -2 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c3_i3 = hw.constant 3 : i3
    %c-1_i3 = hw.constant -1 : i3
    %c2_i3 = hw.constant 2 : i3
    %c1_i3 = hw.constant 1 : i3
    %c0_i3 = hw.constant 0 : i3
    %true = hw.constant true
    %c0_i8 = hw.constant 0 : i8
    %c-1_i2 = hw.constant -1 : i2
    %c0_i2 = hw.constant 0 : i2
    %false = hw.constant false
    %c0_i4 = hw.constant 0 : i4
    %c1_i4 = hw.constant 1 : i4
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c1_i2 = hw.constant 1 : i2
    %c-2_i2 = hw.constant -2 : i2
    %masters_02FinstrMem = seq.firmem name "masters_0/instrMem" 0, 1, undefined, port_order : <16 x 14>
    seq.firmem.write_port %masters_02FinstrMem[%io_loadAddr_0] = %1, clock %io_clock enable %io_loadEn_0 : <16 x 14>
    %0 = seq.firmem.read_port %masters_02FinstrMem[%masters_02Fpc], clock %io_clock : <16 x 14>
    %1 = comb.extract %io_loadData_0 from 2 : (i16) -> i14
    %masters_02Fpc = seq.firreg %15 clock %io_clock reset sync %io_reset, %c0_i4 {firrtl.random_init_start = 0 : ui64, name = "masters_0/pc"} : i4
    %masters_02Fhalted = seq.firreg %31 clock %io_clock reset sync %io_reset, %false {firrtl.random_init_start = 4 : ui64, name = "masters_0/halted", sv.namehint = "halted"} : i1
    %masters_02Fregs_0 = seq.firreg %19 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 5 : ui64, name = "masters_0/regs_0", sv.namehint = "regs_0"} : i8
    %masters_02Fregs_1 = seq.firreg %22 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 13 : ui64, name = "masters_0/regs_1"} : i8
    %masters_02Fregs_2 = seq.firreg %25 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 21 : ui64, name = "masters_0/regs_2"} : i8
    %masters_02Fregs_3 = seq.firreg %28 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 29 : ui64, name = "masters_0/regs_3"} : i8
    %2 = comb.extract %0 from 10 : (i14) -> i4
    %3 = comb.extract %0 from 8 : (i14) -> i2
    %4 = comb.icmp bin eq %2, %c1_i4 {sv.namehint = "isLoad"} : i4
    %5 = comb.icmp bin eq %2, %c2_i4 {sv.namehint = "isStore"} : i4
    %6 = comb.xor bin %masters_02Fhalted, %true {sv.namehint = "_io_req_valid_T"} : i1
    %7 = comb.or bin %4, %5 {sv.namehint = "_io_req_valid_T_1"} : i1
    %8 = comb.and bin %6, %7 {sv.namehint = "io_req_valid"} : i1
    %9 = comb.extract %0 from 8 : (i14) -> i1
    %10 = comb.extract %0 from 9 : (i14) -> i1
    %11 = comb.mux %9, %masters_02Fregs_3, %masters_02Fregs_2 : i8
    %12 = comb.mux %9, %masters_02Fregs_1, %masters_02Fregs_0 : i8
    %13 = comb.mux %10, %11, %12 : i8
    %14 = comb.add bin %masters_02Fpc, %c1_i4 {sv.namehint = "_pc_T"} : i4
    %15 = comb.mux bin %masters_02Fhalted, %masters_02Fpc, %14 : i4
    %16 = comb.and bin %4, %206 : i1
    %17 = comb.icmp bin eq %3, %c0_i2 : i2
    %18 = comb.and bin %6, %16, %17 : i1
    %19 = comb.mux bin %18, %210, %masters_02Fregs_0 : i8
    %20 = comb.icmp bin eq %3, %c1_i2 : i2
    %21 = comb.and bin %6, %16, %20 : i1
    %22 = comb.mux bin %21, %210, %masters_02Fregs_1 : i8
    %23 = comb.icmp bin eq %3, %c-2_i2 : i2
    %24 = comb.and bin %6, %16, %23 : i1
    %25 = comb.mux bin %24, %210, %masters_02Fregs_2 : i8
    %26 = comb.icmp bin eq %3, %c-1_i2 : i2
    %27 = comb.and bin %6, %16, %26 : i1
    %28 = comb.mux bin %27, %210, %masters_02Fregs_3 : i8
    %29 = comb.icmp bin eq %2, %c3_i4 : i4
    %30 = comb.and bin %6, %29 : i1
    %31 = comb.or %30, %masters_02Fhalted : i1
    %masters_12FinstrMem = seq.firmem name "masters_1/instrMem" 0, 1, undefined, port_order : <16 x 14>
    seq.firmem.write_port %masters_12FinstrMem[%io_loadAddr_1] = %33, clock %io_clock enable %io_loadEn_1 : <16 x 14>
    %32 = seq.firmem.read_port %masters_12FinstrMem[%masters_12Fpc], clock %io_clock : <16 x 14>
    %33 = comb.extract %io_loadData_1 from 2 : (i16) -> i14
    %masters_12Fpc = seq.firreg %47 clock %io_clock reset sync %io_reset, %c0_i4 {firrtl.random_init_start = 0 : ui64, name = "masters_1/pc"} : i4
    %masters_12Fhalted = seq.firreg %63 clock %io_clock reset sync %io_reset, %false {firrtl.random_init_start = 4 : ui64, name = "masters_1/halted", sv.namehint = "halted"} : i1
    %masters_12Fregs_0 = seq.firreg %51 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 5 : ui64, name = "masters_1/regs_0", sv.namehint = "regs_0"} : i8
    %masters_12Fregs_1 = seq.firreg %54 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 13 : ui64, name = "masters_1/regs_1"} : i8
    %masters_12Fregs_2 = seq.firreg %57 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 21 : ui64, name = "masters_1/regs_2"} : i8
    %masters_12Fregs_3 = seq.firreg %60 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 29 : ui64, name = "masters_1/regs_3"} : i8
    %34 = comb.extract %32 from 10 : (i14) -> i4
    %35 = comb.extract %32 from 8 : (i14) -> i2
    %36 = comb.icmp bin eq %34, %c1_i4 {sv.namehint = "isLoad"} : i4
    %37 = comb.icmp bin eq %34, %c2_i4 {sv.namehint = "isStore"} : i4
    %38 = comb.xor bin %masters_12Fhalted, %true {sv.namehint = "_io_req_valid_T"} : i1
    %39 = comb.or bin %36, %37 {sv.namehint = "_io_req_valid_T_1"} : i1
    %40 = comb.and bin %38, %39 {sv.namehint = "io_req_valid"} : i1
    %41 = comb.extract %32 from 8 : (i14) -> i1
    %42 = comb.extract %32 from 9 : (i14) -> i1
    %43 = comb.mux %41, %masters_12Fregs_3, %masters_12Fregs_2 : i8
    %44 = comb.mux %41, %masters_12Fregs_1, %masters_12Fregs_0 : i8
    %45 = comb.mux %42, %43, %44 : i8
    %46 = comb.add bin %masters_12Fpc, %c1_i4 {sv.namehint = "_pc_T"} : i4
    %47 = comb.mux bin %masters_12Fhalted, %masters_12Fpc, %46 : i4
    %48 = comb.and bin %36, %211 : i1
    %49 = comb.icmp bin eq %35, %c0_i2 : i2
    %50 = comb.and bin %38, %48, %49 : i1
    %51 = comb.mux bin %50, %215, %masters_12Fregs_0 : i8
    %52 = comb.icmp bin eq %35, %c1_i2 : i2
    %53 = comb.and bin %38, %48, %52 : i1
    %54 = comb.mux bin %53, %215, %masters_12Fregs_1 : i8
    %55 = comb.icmp bin eq %35, %c-2_i2 : i2
    %56 = comb.and bin %38, %48, %55 : i1
    %57 = comb.mux bin %56, %215, %masters_12Fregs_2 : i8
    %58 = comb.icmp bin eq %35, %c-1_i2 : i2
    %59 = comb.and bin %38, %48, %58 : i1
    %60 = comb.mux bin %59, %215, %masters_12Fregs_3 : i8
    %61 = comb.icmp bin eq %34, %c3_i4 : i4
    %62 = comb.and bin %38, %61 : i1
    %63 = comb.or %62, %masters_12Fhalted : i1
    %masters_22FinstrMem = seq.firmem name "masters_2/instrMem" 0, 1, undefined, port_order : <16 x 14>
    seq.firmem.write_port %masters_22FinstrMem[%io_loadAddr_2] = %65, clock %io_clock enable %io_loadEn_2 : <16 x 14>
    %64 = seq.firmem.read_port %masters_22FinstrMem[%masters_22Fpc], clock %io_clock : <16 x 14>
    %65 = comb.extract %io_loadData_2 from 2 : (i16) -> i14
    %masters_22Fpc = seq.firreg %79 clock %io_clock reset sync %io_reset, %c0_i4 {firrtl.random_init_start = 0 : ui64, name = "masters_2/pc"} : i4
    %masters_22Fhalted = seq.firreg %95 clock %io_clock reset sync %io_reset, %false {firrtl.random_init_start = 4 : ui64, name = "masters_2/halted", sv.namehint = "halted"} : i1
    %masters_22Fregs_0 = seq.firreg %83 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 5 : ui64, name = "masters_2/regs_0", sv.namehint = "regs_0"} : i8
    %masters_22Fregs_1 = seq.firreg %86 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 13 : ui64, name = "masters_2/regs_1"} : i8
    %masters_22Fregs_2 = seq.firreg %89 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 21 : ui64, name = "masters_2/regs_2"} : i8
    %masters_22Fregs_3 = seq.firreg %92 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 29 : ui64, name = "masters_2/regs_3"} : i8
    %66 = comb.extract %64 from 10 : (i14) -> i4
    %67 = comb.extract %64 from 8 : (i14) -> i2
    %68 = comb.icmp bin eq %66, %c1_i4 {sv.namehint = "isLoad"} : i4
    %69 = comb.icmp bin eq %66, %c2_i4 {sv.namehint = "isStore"} : i4
    %70 = comb.xor bin %masters_22Fhalted, %true {sv.namehint = "_io_req_valid_T"} : i1
    %71 = comb.or bin %68, %69 {sv.namehint = "_io_req_valid_T_1"} : i1
    %72 = comb.and bin %70, %71 {sv.namehint = "io_req_valid"} : i1
    %73 = comb.extract %64 from 8 : (i14) -> i1
    %74 = comb.extract %64 from 9 : (i14) -> i1
    %75 = comb.mux %73, %masters_22Fregs_3, %masters_22Fregs_2 : i8
    %76 = comb.mux %73, %masters_22Fregs_1, %masters_22Fregs_0 : i8
    %77 = comb.mux %74, %75, %76 : i8
    %78 = comb.add bin %masters_22Fpc, %c1_i4 {sv.namehint = "_pc_T"} : i4
    %79 = comb.mux bin %masters_22Fhalted, %masters_22Fpc, %78 : i4
    %80 = comb.and bin %68, %216 : i1
    %81 = comb.icmp bin eq %67, %c0_i2 : i2
    %82 = comb.and bin %70, %80, %81 : i1
    %83 = comb.mux bin %82, %220, %masters_22Fregs_0 : i8
    %84 = comb.icmp bin eq %67, %c1_i2 : i2
    %85 = comb.and bin %70, %80, %84 : i1
    %86 = comb.mux bin %85, %220, %masters_22Fregs_1 : i8
    %87 = comb.icmp bin eq %67, %c-2_i2 : i2
    %88 = comb.and bin %70, %80, %87 : i1
    %89 = comb.mux bin %88, %220, %masters_22Fregs_2 : i8
    %90 = comb.icmp bin eq %67, %c-1_i2 : i2
    %91 = comb.and bin %70, %80, %90 : i1
    %92 = comb.mux bin %91, %220, %masters_22Fregs_3 : i8
    %93 = comb.icmp bin eq %66, %c3_i4 : i4
    %94 = comb.and bin %70, %93 : i1
    %95 = comb.or %94, %masters_22Fhalted : i1
    %regFile2Fmem_0 = seq.firreg %99 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 0 : ui64, name = "regFile/mem_0"} : i8
    %regFile2Fmem_1 = seq.firreg %102 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 8 : ui64, name = "regFile/mem_1"} : i8
    %regFile2Fmem_2 = seq.firreg %105 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 16 : ui64, name = "regFile/mem_2"} : i8
    %regFile2Fmem_3 = seq.firreg %108 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 24 : ui64, name = "regFile/mem_3"} : i8
    %regFile2Fmem_4 = seq.firreg %111 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 32 : ui64, name = "regFile/mem_4"} : i8
    %regFile2Fmem_5 = seq.firreg %114 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 40 : ui64, name = "regFile/mem_5"} : i8
    %regFile2Fmem_6 = seq.firreg %117 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 48 : ui64, name = "regFile/mem_6"} : i8
    %regFile2Fmem_7 = seq.firreg %120 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 56 : ui64, name = "regFile/mem_7"} : i8
    %96 = comb.and bin %185, %183 : i1
    %97 = comb.icmp bin eq %179, %c0_i3 : i3
    %98 = comb.and bin %96, %97 : i1
    %99 = comb.mux bin %98, %172, %regFile2Fmem_0 : i8
    %100 = comb.icmp bin eq %179, %c1_i3 : i3
    %101 = comb.and bin %96, %100 : i1
    %102 = comb.mux bin %101, %172, %regFile2Fmem_1 : i8
    %103 = comb.icmp bin eq %179, %c2_i3 : i3
    %104 = comb.and bin %96, %103 : i1
    %105 = comb.mux bin %104, %172, %regFile2Fmem_2 : i8
    %106 = comb.icmp bin eq %179, %c3_i3 : i3
    %107 = comb.and bin %96, %106 : i1
    %108 = comb.mux bin %107, %172, %regFile2Fmem_3 : i8
    %109 = comb.icmp bin eq %179, %c-4_i3 : i3
    %110 = comb.and bin %96, %109 : i1
    %111 = comb.mux bin %110, %172, %regFile2Fmem_4 : i8
    %112 = comb.icmp bin eq %179, %c-3_i3 : i3
    %113 = comb.and bin %96, %112 : i1
    %114 = comb.mux bin %113, %172, %regFile2Fmem_5 : i8
    %115 = comb.icmp bin eq %179, %c-2_i3 : i3
    %116 = comb.and bin %96, %115 : i1
    %117 = comb.mux bin %116, %172, %regFile2Fmem_6 : i8
    %118 = comb.icmp bin eq %179, %c-1_i3 : i3
    %119 = comb.and bin %96, %118 : i1
    %120 = comb.mux bin %119, %172, %regFile2Fmem_7 : i8
    %121 = comb.extract %179 from 0 : (i3) -> i1
    %122 = comb.extract %179 from 1 : (i3) -> i1
    %123 = comb.extract %179 from 2 : (i3) -> i1
    %124 = comb.mux %121, %regFile2Fmem_7, %regFile2Fmem_6 : i8
    %125 = comb.mux %121, %regFile2Fmem_5, %regFile2Fmem_4 : i8
    %126 = comb.mux %122, %124, %125 : i8
    %127 = comb.mux %121, %regFile2Fmem_3, %regFile2Fmem_2 : i8
    %128 = comb.mux %121, %regFile2Fmem_1, %regFile2Fmem_0 : i8
    %129 = comb.mux %122, %127, %128 : i8
    %130 = comb.mux %123, %126, %129 : i8
    %counter2Fcount = seq.firreg %133 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 0 : ui64, name = "counter/count", sv.namehint = "count"} : i8
    %131 = comb.add bin %counter2Fcount, %c1_i8 {sv.namehint = "_count_T"} : i8
    %132 = comb.and bin %195, %193 : i1
    %133 = comb.mux bin %132, %189, %131 : i8
    %gpio2Freg = seq.firreg %135 clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 0 : ui64, name = "gpio/reg", sv.namehint = "reg"} : i8
    %134 = comb.and bin %205, %203 : i1
    %135 = comb.mux bin %134, %199, %gpio2Freg : i8
    %136 = comb.extract %0 from 5 {sv.namehint = "_grant_T_24"} : (i14) -> i3
    %137 = comb.icmp bin eq %136, %c0_i3 {sv.namehint = "_grant_T_1"} : i3
    %138 = comb.and bin %8, %137 {sv.namehint = "grant_0_0"} : i1
    %139 = comb.extract %32 from 5 {sv.namehint = "_grant_T_27"} : (i14) -> i3
    %140 = comb.icmp bin eq %139, %c0_i3 {sv.namehint = "_grant_T_4"} : i3
    %141 = comb.and bin %40, %140 {sv.namehint = "_grant_T_5"} : i1
    %142 = comb.extract %64 from 5 {sv.namehint = "_grant_T_30"} : (i14) -> i3
    %143 = comb.icmp bin eq %142, %c0_i3 {sv.namehint = "_grant_T_7"} : i3
    %144 = comb.xor bin %138, %true {sv.namehint = "_grant_oh_1_T"} : i1
    %145 = comb.and bin %141, %144 {sv.namehint = "grant_0_1"} : i1
    %146 = comb.or bin %138, %141 {sv.namehint = "_grant_T_10"} : i1
    %147 = comb.xor bin %146, %true {sv.namehint = "_grant_oh_2_T"} : i1
    %148 = comb.and bin %72, %143, %147 {sv.namehint = "grant_0_2"} : i1
    %149 = comb.icmp bin eq %136, %c1_i3 {sv.namehint = "_grant_T_13"} : i3
    %150 = comb.and bin %8, %149 {sv.namehint = "grant_1_0"} : i1
    %151 = comb.icmp bin eq %139, %c1_i3 {sv.namehint = "_grant_T_16"} : i3
    %152 = comb.and bin %40, %151 {sv.namehint = "_grant_T_17"} : i1
    %153 = comb.icmp bin eq %142, %c1_i3 {sv.namehint = "_grant_T_19"} : i3
    %154 = comb.xor bin %150, %true {sv.namehint = "_grant_oh_1_T_2"} : i1
    %155 = comb.and bin %152, %154 {sv.namehint = "grant_1_1"} : i1
    %156 = comb.or bin %150, %152 {sv.namehint = "_grant_T_22"} : i1
    %157 = comb.xor bin %156, %true {sv.namehint = "_grant_oh_2_T_2"} : i1
    %158 = comb.and bin %72, %153, %157 {sv.namehint = "grant_1_2"} : i1
    %159 = comb.icmp bin eq %136, %c2_i3 {sv.namehint = "_grant_T_25"} : i3
    %160 = comb.and bin %8, %159 {sv.namehint = "grant_2_0"} : i1
    %161 = comb.icmp bin eq %139, %c2_i3 {sv.namehint = "_grant_T_28"} : i3
    %162 = comb.and bin %40, %161 {sv.namehint = "_grant_T_29"} : i1
    %163 = comb.icmp bin eq %142, %c2_i3 {sv.namehint = "_grant_T_31"} : i3
    %164 = comb.xor bin %160, %true {sv.namehint = "_grant_oh_1_T_4"} : i1
    %165 = comb.and bin %162, %164 {sv.namehint = "grant_2_1"} : i1
    %166 = comb.or bin %160, %162 {sv.namehint = "_grant_T_34"} : i1
    %167 = comb.xor bin %166, %true {sv.namehint = "_grant_oh_2_T_4"} : i1
    %168 = comb.and bin %72, %163, %167 {sv.namehint = "grant_2_2"} : i1
    %169 = comb.mux bin %138, %13, %c0_i8 {sv.namehint = "_selMaster_T"} : i8
    %170 = comb.mux bin %145, %45, %c0_i8 {sv.namehint = "_selMaster_T_1"} : i8
    %171 = comb.mux bin %148, %77, %c0_i8 {sv.namehint = "_selMaster_T_2"} : i8
    %172 = comb.or bin %169, %170, %171 {sv.namehint = "selMaster_wdata"} : i8
    %173 = comb.extract %0 from 0 : (i14) -> i3
    %174 = comb.mux bin %138, %173, %c0_i3 {sv.namehint = "_selMaster_T_5"} : i3
    %175 = comb.extract %32 from 0 : (i14) -> i3
    %176 = comb.mux bin %145, %175, %c0_i3 {sv.namehint = "_selMaster_T_6"} : i3
    %177 = comb.extract %64 from 0 : (i14) -> i3
    %178 = comb.mux bin %148, %177, %c0_i3 {sv.namehint = "_selMaster_T_7"} : i3
    %179 = comb.or bin %174, %176, %178 {sv.namehint = "selMaster_addr"} : i3
    %180 = comb.and %138, %5 {sv.namehint = "_selMaster_T_10"} : i1
    %181 = comb.and %145, %37 {sv.namehint = "_selMaster_T_11"} : i1
    %182 = comb.and %148, %69 {sv.namehint = "_selMaster_T_12"} : i1
    %183 = comb.or bin %180, %181, %182 {sv.namehint = "selMaster_write"} : i1
    %184 = comb.concat %148, %145, %138 {sv.namehint = "_regFile_io_sel_T"} : i1, i1, i1
    %185 = comb.icmp bin ne %184, %c0_i3 {sv.namehint = "regFile.io_sel"} : i3
    %186 = comb.mux bin %150, %13, %c0_i8 {sv.namehint = "_selMaster_T_20"} : i8
    %187 = comb.mux bin %155, %45, %c0_i8 {sv.namehint = "_selMaster_T_21"} : i8
    %188 = comb.mux bin %158, %77, %c0_i8 {sv.namehint = "_selMaster_T_22"} : i8
    %189 = comb.or bin %186, %187, %188 {sv.namehint = "counter.io_wdata"} : i8
    %190 = comb.and %150, %5 {sv.namehint = "_selMaster_T_30"} : i1
    %191 = comb.and %155, %37 {sv.namehint = "_selMaster_T_31"} : i1
    %192 = comb.and %158, %69 {sv.namehint = "_selMaster_T_32"} : i1
    %193 = comb.or bin %190, %191, %192 {sv.namehint = "counter.io_write"} : i1
    %194 = comb.concat %158, %155, %150 {sv.namehint = "_counter_io_sel_T"} : i1, i1, i1
    %195 = comb.icmp bin ne %194, %c0_i3 {sv.namehint = "counter.io_sel"} : i3
    %196 = comb.mux bin %160, %13, %c0_i8 {sv.namehint = "_selMaster_T_40"} : i8
    %197 = comb.mux bin %165, %45, %c0_i8 {sv.namehint = "_selMaster_T_41"} : i8
    %198 = comb.mux bin %168, %77, %c0_i8 {sv.namehint = "_selMaster_T_42"} : i8
    %199 = comb.or bin %196, %197, %198 {sv.namehint = "gpio.io_wdata"} : i8
    %200 = comb.and %160, %5 {sv.namehint = "_selMaster_T_50"} : i1
    %201 = comb.and %165, %37 {sv.namehint = "_selMaster_T_51"} : i1
    %202 = comb.and %168, %69 {sv.namehint = "_selMaster_T_52"} : i1
    %203 = comb.or bin %200, %201, %202 {sv.namehint = "gpio.io_write"} : i1
    %204 = comb.concat %168, %165, %160 {sv.namehint = "_gpio_io_sel_T"} : i1, i1, i1
    %205 = comb.icmp bin ne %204, %c0_i3 {sv.namehint = "gpio.io_sel"} : i3
    %206 = comb.or bin %138, %150, %160 {sv.namehint = "masters_0.io_resp_granted"} : i1
    %207 = comb.mux bin %138, %130, %c0_i8 {sv.namehint = "_masters_0_io_resp_rdata_T"} : i8
    %208 = comb.mux bin %150, %counter2Fcount, %c0_i8 {sv.namehint = "_masters_0_io_resp_rdata_T_1"} : i8
    %209 = comb.mux bin %160, %gpio2Freg, %c0_i8 {sv.namehint = "_masters_0_io_resp_rdata_T_2"} : i8
    %210 = comb.or bin %207, %208, %209 {sv.namehint = "masters_0.io_resp_rdata"} : i8
    %211 = comb.or bin %145, %155, %165 {sv.namehint = "masters_1.io_resp_granted"} : i1
    %212 = comb.mux bin %145, %130, %c0_i8 {sv.namehint = "_masters_1_io_resp_rdata_T"} : i8
    %213 = comb.mux bin %155, %counter2Fcount, %c0_i8 {sv.namehint = "_masters_1_io_resp_rdata_T_1"} : i8
    %214 = comb.mux bin %165, %gpio2Freg, %c0_i8 {sv.namehint = "_masters_1_io_resp_rdata_T_2"} : i8
    %215 = comb.or bin %212, %213, %214 {sv.namehint = "masters_1.io_resp_rdata"} : i8
    %216 = comb.or bin %148, %158, %168 {sv.namehint = "masters_2.io_resp_granted"} : i1
    %217 = comb.mux bin %148, %130, %c0_i8 {sv.namehint = "_masters_2_io_resp_rdata_T"} : i8
    %218 = comb.mux bin %158, %counter2Fcount, %c0_i8 {sv.namehint = "_masters_2_io_resp_rdata_T_1"} : i8
    %219 = comb.mux bin %168, %gpio2Freg, %c0_i8 {sv.namehint = "_masters_2_io_resp_rdata_T_2"} : i8
    %220 = comb.or bin %217, %218, %219 {sv.namehint = "masters_2.io_resp_rdata"} : i8
    hw.output %masters_02Fhalted, %masters_12Fhalted, %masters_22Fhalted, %masters_02Fregs_0, %masters_12Fregs_0, %masters_22Fregs_0, %gpio2Freg : i1, i1, i1, i8, i8, i8, i8
  }
  om.class @SimpleChiselTop_Class(%basepath: !om.basepath) {
    om.class.fields 
  }
}

