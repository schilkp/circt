module {
  hw.module @SimpleChiselTop_transfer(in %in_io_loadEn_0 : i1, in %in_io_loadEn_1 : i1, in %in_io_loadEn_2 : i1, in %in_io_loadAddr_0 : i4, in %in_io_loadAddr_1 : i4, in %in_io_loadAddr_2 : i4, in %in_io_loadData_0 : i16, in %in_io_loadData_1 : i16, in %in_io_loadData_2 : i16, in %reg_masters_0_pc : i4, in %reg_masters_0_halted : i1, in %reg_masters_0_regs_0 : i8, in %reg_masters_0_regs_1 : i8, in %reg_masters_0_regs_2 : i8, in %reg_masters_0_regs_3 : i8, in %reg_masters_1_pc : i4, in %reg_masters_1_halted : i1, in %reg_masters_1_regs_0 : i8, in %reg_masters_1_regs_1 : i8, in %reg_masters_1_regs_2 : i8, in %reg_masters_1_regs_3 : i8, in %reg_masters_2_pc : i4, in %reg_masters_2_halted : i1, in %reg_masters_2_regs_0 : i8, in %reg_masters_2_regs_1 : i8, in %reg_masters_2_regs_2 : i8, in %reg_masters_2_regs_3 : i8, in %reg_regFile_mem_0 : i8, in %reg_regFile_mem_1 : i8, in %reg_regFile_mem_2 : i8, in %reg_regFile_mem_3 : i8, in %reg_regFile_mem_4 : i8, in %reg_regFile_mem_5 : i8, in %reg_regFile_mem_6 : i8, in %reg_regFile_mem_7 : i8, in %reg_counter_count : i8, in %reg_gpio_reg : i8, in %mem_masters_0_instrMem_r_0_data : i14, in %mem_masters_1_instrMem_r_1_data : i14, in %mem_masters_2_instrMem_r_2_data : i14, out out_io_masterHalted_0 : i1, out out_io_masterHalted_1 : i1, out out_io_masterHalted_2 : i1, out out_io_masterDebug_0 : i8, out out_io_masterDebug_1 : i8, out out_io_masterDebug_2 : i8, out out_io_gpioPins : i8, out reg_masters_0_pc_next : i4, out reg_masters_0_halted_next : i1, out reg_masters_0_regs_0_next : i8, out reg_masters_0_regs_1_next : i8, out reg_masters_0_regs_2_next : i8, out reg_masters_0_regs_3_next : i8, out reg_masters_1_pc_next : i4, out reg_masters_1_halted_next : i1, out reg_masters_1_regs_0_next : i8, out reg_masters_1_regs_1_next : i8, out reg_masters_1_regs_2_next : i8, out reg_masters_1_regs_3_next : i8, out reg_masters_2_pc_next : i4, out reg_masters_2_halted_next : i1, out reg_masters_2_regs_0_next : i8, out reg_masters_2_regs_1_next : i8, out reg_masters_2_regs_2_next : i8, out reg_masters_2_regs_3_next : i8, out reg_regFile_mem_0_next : i8, out reg_regFile_mem_1_next : i8, out reg_regFile_mem_2_next : i8, out reg_regFile_mem_3_next : i8, out reg_regFile_mem_4_next : i8, out reg_regFile_mem_5_next : i8, out reg_regFile_mem_6_next : i8, out reg_regFile_mem_7_next : i8, out reg_counter_count_next : i8, out reg_gpio_reg_next : i8, out mem_masters_0_instrMem_r_0_addr : i4, out mem_masters_1_instrMem_r_1_addr : i4, out mem_masters_2_instrMem_r_2_addr : i4, out mem_masters_0_instrMem_w_0_addr : i4, out mem_masters_0_instrMem_w_0_en : i1, out mem_masters_0_instrMem_w_0_data : i14, out mem_masters_1_instrMem_w_1_addr : i4, out mem_masters_1_instrMem_w_1_en : i1, out mem_masters_1_instrMem_w_1_data : i14, out mem_masters_2_instrMem_w_2_addr : i4, out mem_masters_2_instrMem_w_2_en : i1, out mem_masters_2_instrMem_w_2_data : i14) {
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
    %c1_i4 = hw.constant 1 : i4
    %c2_i4 = hw.constant 2 : i4
    %c3_i4 = hw.constant 3 : i4
    %c1_i2 = hw.constant 1 : i2
    %c-2_i2 = hw.constant -2 : i2
    %0 = comb.extract %in_io_loadData_0 from 2 : (i16) -> i14
    %1 = comb.extract %mem_masters_0_instrMem_r_0_data from 10 : (i14) -> i4
    %2 = comb.extract %mem_masters_0_instrMem_r_0_data from 8 : (i14) -> i2
    %3 = comb.icmp bin eq %1, %c1_i4 {sv.namehint = "isLoad"} : i4
    %4 = comb.icmp bin eq %1, %c2_i4 {sv.namehint = "isStore"} : i4
    %5 = comb.xor bin %reg_masters_0_halted, %true {sv.namehint = "_io_req_valid_T"} : i1
    %6 = comb.or bin %3, %4 {sv.namehint = "_io_req_valid_T_1"} : i1
    %7 = comb.and bin %5, %6 {sv.namehint = "io_req_valid"} : i1
    %8 = comb.extract %mem_masters_0_instrMem_r_0_data from 8 : (i14) -> i1
    %9 = comb.extract %mem_masters_0_instrMem_r_0_data from 9 : (i14) -> i1
    %10 = comb.mux %8, %reg_masters_0_regs_3, %reg_masters_0_regs_2 : i8
    %11 = comb.mux %8, %reg_masters_0_regs_1, %reg_masters_0_regs_0 : i8
    %12 = comb.mux %9, %10, %11 : i8
    %13 = comb.add bin %reg_masters_0_pc, %c1_i4 {sv.namehint = "_pc_T"} : i4
    %14 = comb.mux bin %reg_masters_0_halted, %reg_masters_0_pc, %13 : i4
    %15 = comb.and bin %3, %203 : i1
    %16 = comb.icmp bin eq %2, %c0_i2 : i2
    %17 = comb.and bin %5, %15, %16 : i1
    %18 = comb.mux bin %17, %207, %reg_masters_0_regs_0 : i8
    %19 = comb.icmp bin eq %2, %c1_i2 : i2
    %20 = comb.and bin %5, %15, %19 : i1
    %21 = comb.mux bin %20, %207, %reg_masters_0_regs_1 : i8
    %22 = comb.icmp bin eq %2, %c-2_i2 : i2
    %23 = comb.and bin %5, %15, %22 : i1
    %24 = comb.mux bin %23, %207, %reg_masters_0_regs_2 : i8
    %25 = comb.icmp bin eq %2, %c-1_i2 : i2
    %26 = comb.and bin %5, %15, %25 : i1
    %27 = comb.mux bin %26, %207, %reg_masters_0_regs_3 : i8
    %28 = comb.icmp bin eq %1, %c3_i4 : i4
    %29 = comb.and bin %5, %28 : i1
    %30 = comb.or %29, %reg_masters_0_halted : i1
    %31 = comb.extract %in_io_loadData_1 from 2 : (i16) -> i14
    %32 = comb.extract %mem_masters_1_instrMem_r_1_data from 10 : (i14) -> i4
    %33 = comb.extract %mem_masters_1_instrMem_r_1_data from 8 : (i14) -> i2
    %34 = comb.icmp bin eq %32, %c1_i4 {sv.namehint = "isLoad"} : i4
    %35 = comb.icmp bin eq %32, %c2_i4 {sv.namehint = "isStore"} : i4
    %36 = comb.xor bin %reg_masters_1_halted, %true {sv.namehint = "_io_req_valid_T"} : i1
    %37 = comb.or bin %34, %35 {sv.namehint = "_io_req_valid_T_1"} : i1
    %38 = comb.and bin %36, %37 {sv.namehint = "io_req_valid"} : i1
    %39 = comb.extract %mem_masters_1_instrMem_r_1_data from 8 : (i14) -> i1
    %40 = comb.extract %mem_masters_1_instrMem_r_1_data from 9 : (i14) -> i1
    %41 = comb.mux %39, %reg_masters_1_regs_3, %reg_masters_1_regs_2 : i8
    %42 = comb.mux %39, %reg_masters_1_regs_1, %reg_masters_1_regs_0 : i8
    %43 = comb.mux %40, %41, %42 : i8
    %44 = comb.add bin %reg_masters_1_pc, %c1_i4 {sv.namehint = "_pc_T"} : i4
    %45 = comb.mux bin %reg_masters_1_halted, %reg_masters_1_pc, %44 : i4
    %46 = comb.and bin %34, %208 : i1
    %47 = comb.icmp bin eq %33, %c0_i2 : i2
    %48 = comb.and bin %36, %46, %47 : i1
    %49 = comb.mux bin %48, %212, %reg_masters_1_regs_0 : i8
    %50 = comb.icmp bin eq %33, %c1_i2 : i2
    %51 = comb.and bin %36, %46, %50 : i1
    %52 = comb.mux bin %51, %212, %reg_masters_1_regs_1 : i8
    %53 = comb.icmp bin eq %33, %c-2_i2 : i2
    %54 = comb.and bin %36, %46, %53 : i1
    %55 = comb.mux bin %54, %212, %reg_masters_1_regs_2 : i8
    %56 = comb.icmp bin eq %33, %c-1_i2 : i2
    %57 = comb.and bin %36, %46, %56 : i1
    %58 = comb.mux bin %57, %212, %reg_masters_1_regs_3 : i8
    %59 = comb.icmp bin eq %32, %c3_i4 : i4
    %60 = comb.and bin %36, %59 : i1
    %61 = comb.or %60, %reg_masters_1_halted : i1
    %62 = comb.extract %in_io_loadData_2 from 2 : (i16) -> i14
    %63 = comb.extract %mem_masters_2_instrMem_r_2_data from 10 : (i14) -> i4
    %64 = comb.extract %mem_masters_2_instrMem_r_2_data from 8 : (i14) -> i2
    %65 = comb.icmp bin eq %63, %c1_i4 {sv.namehint = "isLoad"} : i4
    %66 = comb.icmp bin eq %63, %c2_i4 {sv.namehint = "isStore"} : i4
    %67 = comb.xor bin %reg_masters_2_halted, %true {sv.namehint = "_io_req_valid_T"} : i1
    %68 = comb.or bin %65, %66 {sv.namehint = "_io_req_valid_T_1"} : i1
    %69 = comb.and bin %67, %68 {sv.namehint = "io_req_valid"} : i1
    %70 = comb.extract %mem_masters_2_instrMem_r_2_data from 8 : (i14) -> i1
    %71 = comb.extract %mem_masters_2_instrMem_r_2_data from 9 : (i14) -> i1
    %72 = comb.mux %70, %reg_masters_2_regs_3, %reg_masters_2_regs_2 : i8
    %73 = comb.mux %70, %reg_masters_2_regs_1, %reg_masters_2_regs_0 : i8
    %74 = comb.mux %71, %72, %73 : i8
    %75 = comb.add bin %reg_masters_2_pc, %c1_i4 {sv.namehint = "_pc_T"} : i4
    %76 = comb.mux bin %reg_masters_2_halted, %reg_masters_2_pc, %75 : i4
    %77 = comb.and bin %65, %213 : i1
    %78 = comb.icmp bin eq %64, %c0_i2 : i2
    %79 = comb.and bin %67, %77, %78 : i1
    %80 = comb.mux bin %79, %217, %reg_masters_2_regs_0 : i8
    %81 = comb.icmp bin eq %64, %c1_i2 : i2
    %82 = comb.and bin %67, %77, %81 : i1
    %83 = comb.mux bin %82, %217, %reg_masters_2_regs_1 : i8
    %84 = comb.icmp bin eq %64, %c-2_i2 : i2
    %85 = comb.and bin %67, %77, %84 : i1
    %86 = comb.mux bin %85, %217, %reg_masters_2_regs_2 : i8
    %87 = comb.icmp bin eq %64, %c-1_i2 : i2
    %88 = comb.and bin %67, %77, %87 : i1
    %89 = comb.mux bin %88, %217, %reg_masters_2_regs_3 : i8
    %90 = comb.icmp bin eq %63, %c3_i4 : i4
    %91 = comb.and bin %67, %90 : i1
    %92 = comb.or %91, %reg_masters_2_halted : i1
    %93 = comb.and bin %182, %180 : i1
    %94 = comb.icmp bin eq %176, %c0_i3 : i3
    %95 = comb.and bin %93, %94 : i1
    %96 = comb.mux bin %95, %169, %reg_regFile_mem_0 : i8
    %97 = comb.icmp bin eq %176, %c1_i3 : i3
    %98 = comb.and bin %93, %97 : i1
    %99 = comb.mux bin %98, %169, %reg_regFile_mem_1 : i8
    %100 = comb.icmp bin eq %176, %c2_i3 : i3
    %101 = comb.and bin %93, %100 : i1
    %102 = comb.mux bin %101, %169, %reg_regFile_mem_2 : i8
    %103 = comb.icmp bin eq %176, %c3_i3 : i3
    %104 = comb.and bin %93, %103 : i1
    %105 = comb.mux bin %104, %169, %reg_regFile_mem_3 : i8
    %106 = comb.icmp bin eq %176, %c-4_i3 : i3
    %107 = comb.and bin %93, %106 : i1
    %108 = comb.mux bin %107, %169, %reg_regFile_mem_4 : i8
    %109 = comb.icmp bin eq %176, %c-3_i3 : i3
    %110 = comb.and bin %93, %109 : i1
    %111 = comb.mux bin %110, %169, %reg_regFile_mem_5 : i8
    %112 = comb.icmp bin eq %176, %c-2_i3 : i3
    %113 = comb.and bin %93, %112 : i1
    %114 = comb.mux bin %113, %169, %reg_regFile_mem_6 : i8
    %115 = comb.icmp bin eq %176, %c-1_i3 : i3
    %116 = comb.and bin %93, %115 : i1
    %117 = comb.mux bin %116, %169, %reg_regFile_mem_7 : i8
    %118 = comb.extract %176 from 0 : (i3) -> i1
    %119 = comb.extract %176 from 1 : (i3) -> i1
    %120 = comb.extract %176 from 2 : (i3) -> i1
    %121 = comb.mux %118, %reg_regFile_mem_7, %reg_regFile_mem_6 : i8
    %122 = comb.mux %118, %reg_regFile_mem_5, %reg_regFile_mem_4 : i8
    %123 = comb.mux %119, %121, %122 : i8
    %124 = comb.mux %118, %reg_regFile_mem_3, %reg_regFile_mem_2 : i8
    %125 = comb.mux %118, %reg_regFile_mem_1, %reg_regFile_mem_0 : i8
    %126 = comb.mux %119, %124, %125 : i8
    %127 = comb.mux %120, %123, %126 : i8
    %128 = comb.add bin %reg_counter_count, %c1_i8 {sv.namehint = "_count_T"} : i8
    %129 = comb.and bin %192, %190 : i1
    %130 = comb.mux bin %129, %186, %128 : i8
    %131 = comb.and bin %202, %200 : i1
    %132 = comb.mux bin %131, %196, %reg_gpio_reg : i8
    %133 = comb.extract %mem_masters_0_instrMem_r_0_data from 5 {sv.namehint = "_grant_T_24"} : (i14) -> i3
    %134 = comb.icmp bin eq %133, %c0_i3 {sv.namehint = "_grant_T_1"} : i3
    %135 = comb.and bin %7, %134 {sv.namehint = "grant_0_0"} : i1
    %136 = comb.extract %mem_masters_1_instrMem_r_1_data from 5 {sv.namehint = "_grant_T_27"} : (i14) -> i3
    %137 = comb.icmp bin eq %136, %c0_i3 {sv.namehint = "_grant_T_4"} : i3
    %138 = comb.and bin %38, %137 {sv.namehint = "_grant_T_5"} : i1
    %139 = comb.extract %mem_masters_2_instrMem_r_2_data from 5 {sv.namehint = "_grant_T_30"} : (i14) -> i3
    %140 = comb.icmp bin eq %139, %c0_i3 {sv.namehint = "_grant_T_7"} : i3
    %141 = comb.xor bin %135, %true {sv.namehint = "_grant_oh_1_T"} : i1
    %142 = comb.and bin %138, %141 {sv.namehint = "grant_0_1"} : i1
    %143 = comb.or bin %135, %138 {sv.namehint = "_grant_T_10"} : i1
    %144 = comb.xor bin %143, %true {sv.namehint = "_grant_oh_2_T"} : i1
    %145 = comb.and bin %69, %140, %144 {sv.namehint = "grant_0_2"} : i1
    %146 = comb.icmp bin eq %133, %c1_i3 {sv.namehint = "_grant_T_13"} : i3
    %147 = comb.and bin %7, %146 {sv.namehint = "grant_1_0"} : i1
    %148 = comb.icmp bin eq %136, %c1_i3 {sv.namehint = "_grant_T_16"} : i3
    %149 = comb.and bin %38, %148 {sv.namehint = "_grant_T_17"} : i1
    %150 = comb.icmp bin eq %139, %c1_i3 {sv.namehint = "_grant_T_19"} : i3
    %151 = comb.xor bin %147, %true {sv.namehint = "_grant_oh_1_T_2"} : i1
    %152 = comb.and bin %149, %151 {sv.namehint = "grant_1_1"} : i1
    %153 = comb.or bin %147, %149 {sv.namehint = "_grant_T_22"} : i1
    %154 = comb.xor bin %153, %true {sv.namehint = "_grant_oh_2_T_2"} : i1
    %155 = comb.and bin %69, %150, %154 {sv.namehint = "grant_1_2"} : i1
    %156 = comb.icmp bin eq %133, %c2_i3 {sv.namehint = "_grant_T_25"} : i3
    %157 = comb.and bin %7, %156 {sv.namehint = "grant_2_0"} : i1
    %158 = comb.icmp bin eq %136, %c2_i3 {sv.namehint = "_grant_T_28"} : i3
    %159 = comb.and bin %38, %158 {sv.namehint = "_grant_T_29"} : i1
    %160 = comb.icmp bin eq %139, %c2_i3 {sv.namehint = "_grant_T_31"} : i3
    %161 = comb.xor bin %157, %true {sv.namehint = "_grant_oh_1_T_4"} : i1
    %162 = comb.and bin %159, %161 {sv.namehint = "grant_2_1"} : i1
    %163 = comb.or bin %157, %159 {sv.namehint = "_grant_T_34"} : i1
    %164 = comb.xor bin %163, %true {sv.namehint = "_grant_oh_2_T_4"} : i1
    %165 = comb.and bin %69, %160, %164 {sv.namehint = "grant_2_2"} : i1
    %166 = comb.mux bin %135, %12, %c0_i8 {sv.namehint = "_selMaster_T"} : i8
    %167 = comb.mux bin %142, %43, %c0_i8 {sv.namehint = "_selMaster_T_1"} : i8
    %168 = comb.mux bin %145, %74, %c0_i8 {sv.namehint = "_selMaster_T_2"} : i8
    %169 = comb.or bin %166, %167, %168 {sv.namehint = "selMaster_wdata"} : i8
    %170 = comb.extract %mem_masters_0_instrMem_r_0_data from 0 : (i14) -> i3
    %171 = comb.mux bin %135, %170, %c0_i3 {sv.namehint = "_selMaster_T_5"} : i3
    %172 = comb.extract %mem_masters_1_instrMem_r_1_data from 0 : (i14) -> i3
    %173 = comb.mux bin %142, %172, %c0_i3 {sv.namehint = "_selMaster_T_6"} : i3
    %174 = comb.extract %mem_masters_2_instrMem_r_2_data from 0 : (i14) -> i3
    %175 = comb.mux bin %145, %174, %c0_i3 {sv.namehint = "_selMaster_T_7"} : i3
    %176 = comb.or bin %171, %173, %175 {sv.namehint = "selMaster_addr"} : i3
    %177 = comb.and %135, %4 {sv.namehint = "_selMaster_T_10"} : i1
    %178 = comb.and %142, %35 {sv.namehint = "_selMaster_T_11"} : i1
    %179 = comb.and %145, %66 {sv.namehint = "_selMaster_T_12"} : i1
    %180 = comb.or bin %177, %178, %179 {sv.namehint = "selMaster_write"} : i1
    %181 = comb.concat %145, %142, %135 {sv.namehint = "_regFile_io_sel_T"} : i1, i1, i1
    %182 = comb.icmp bin ne %181, %c0_i3 {sv.namehint = "regFile.io_sel"} : i3
    %183 = comb.mux bin %147, %12, %c0_i8 {sv.namehint = "_selMaster_T_20"} : i8
    %184 = comb.mux bin %152, %43, %c0_i8 {sv.namehint = "_selMaster_T_21"} : i8
    %185 = comb.mux bin %155, %74, %c0_i8 {sv.namehint = "_selMaster_T_22"} : i8
    %186 = comb.or bin %183, %184, %185 {sv.namehint = "counter.io_wdata"} : i8
    %187 = comb.and %147, %4 {sv.namehint = "_selMaster_T_30"} : i1
    %188 = comb.and %152, %35 {sv.namehint = "_selMaster_T_31"} : i1
    %189 = comb.and %155, %66 {sv.namehint = "_selMaster_T_32"} : i1
    %190 = comb.or bin %187, %188, %189 {sv.namehint = "counter.io_write"} : i1
    %191 = comb.concat %155, %152, %147 {sv.namehint = "_counter_io_sel_T"} : i1, i1, i1
    %192 = comb.icmp bin ne %191, %c0_i3 {sv.namehint = "counter.io_sel"} : i3
    %193 = comb.mux bin %157, %12, %c0_i8 {sv.namehint = "_selMaster_T_40"} : i8
    %194 = comb.mux bin %162, %43, %c0_i8 {sv.namehint = "_selMaster_T_41"} : i8
    %195 = comb.mux bin %165, %74, %c0_i8 {sv.namehint = "_selMaster_T_42"} : i8
    %196 = comb.or bin %193, %194, %195 {sv.namehint = "gpio.io_wdata"} : i8
    %197 = comb.and %157, %4 {sv.namehint = "_selMaster_T_50"} : i1
    %198 = comb.and %162, %35 {sv.namehint = "_selMaster_T_51"} : i1
    %199 = comb.and %165, %66 {sv.namehint = "_selMaster_T_52"} : i1
    %200 = comb.or bin %197, %198, %199 {sv.namehint = "gpio.io_write"} : i1
    %201 = comb.concat %165, %162, %157 {sv.namehint = "_gpio_io_sel_T"} : i1, i1, i1
    %202 = comb.icmp bin ne %201, %c0_i3 {sv.namehint = "gpio.io_sel"} : i3
    %203 = comb.or bin %135, %147, %157 {sv.namehint = "masters_0.io_resp_granted"} : i1
    %204 = comb.mux bin %135, %127, %c0_i8 {sv.namehint = "_masters_0_io_resp_rdata_T"} : i8
    %205 = comb.mux bin %147, %reg_counter_count, %c0_i8 {sv.namehint = "_masters_0_io_resp_rdata_T_1"} : i8
    %206 = comb.mux bin %157, %reg_gpio_reg, %c0_i8 {sv.namehint = "_masters_0_io_resp_rdata_T_2"} : i8
    %207 = comb.or bin %204, %205, %206 {sv.namehint = "masters_0.io_resp_rdata"} : i8
    %208 = comb.or bin %142, %152, %162 {sv.namehint = "masters_1.io_resp_granted"} : i1
    %209 = comb.mux bin %142, %127, %c0_i8 {sv.namehint = "_masters_1_io_resp_rdata_T"} : i8
    %210 = comb.mux bin %152, %reg_counter_count, %c0_i8 {sv.namehint = "_masters_1_io_resp_rdata_T_1"} : i8
    %211 = comb.mux bin %162, %reg_gpio_reg, %c0_i8 {sv.namehint = "_masters_1_io_resp_rdata_T_2"} : i8
    %212 = comb.or bin %209, %210, %211 {sv.namehint = "masters_1.io_resp_rdata"} : i8
    %213 = comb.or bin %145, %155, %165 {sv.namehint = "masters_2.io_resp_granted"} : i1
    %214 = comb.mux bin %145, %127, %c0_i8 {sv.namehint = "_masters_2_io_resp_rdata_T"} : i8
    %215 = comb.mux bin %155, %reg_counter_count, %c0_i8 {sv.namehint = "_masters_2_io_resp_rdata_T_1"} : i8
    %216 = comb.mux bin %165, %reg_gpio_reg, %c0_i8 {sv.namehint = "_masters_2_io_resp_rdata_T_2"} : i8
    %217 = comb.or bin %214, %215, %216 {sv.namehint = "masters_2.io_resp_rdata"} : i8
    %218 = hw.tfoutput %reg_masters_0_halted as "out_io_masterHalted_0" : i1
    %219 = hw.tfoutput %reg_masters_1_halted as "out_io_masterHalted_1" : i1
    %220 = hw.tfoutput %reg_masters_2_halted as "out_io_masterHalted_2" : i1
    %221 = hw.tfoutput %reg_masters_0_regs_0 as "out_io_masterDebug_0" : i8
    %222 = hw.tfoutput %reg_masters_1_regs_0 as "out_io_masterDebug_1" : i8
    %223 = hw.tfoutput %reg_masters_2_regs_0 as "out_io_masterDebug_2" : i8
    %224 = hw.tfoutput %reg_gpio_reg as "out_io_gpioPins" : i8
    %225 = hw.tfoutput %14 as "reg_masters_0_pc_next" : i4
    %226 = hw.tfoutput %30 as "reg_masters_0_halted_next" : i1
    %227 = hw.tfoutput %18 as "reg_masters_0_regs_0_next" : i8
    %228 = hw.tfoutput %21 as "reg_masters_0_regs_1_next" : i8
    %229 = hw.tfoutput %24 as "reg_masters_0_regs_2_next" : i8
    %230 = hw.tfoutput %27 as "reg_masters_0_regs_3_next" : i8
    %231 = hw.tfoutput %45 as "reg_masters_1_pc_next" : i4
    %232 = hw.tfoutput %61 as "reg_masters_1_halted_next" : i1
    %233 = hw.tfoutput %49 as "reg_masters_1_regs_0_next" : i8
    %234 = hw.tfoutput %52 as "reg_masters_1_regs_1_next" : i8
    %235 = hw.tfoutput %55 as "reg_masters_1_regs_2_next" : i8
    %236 = hw.tfoutput %58 as "reg_masters_1_regs_3_next" : i8
    %237 = hw.tfoutput %76 as "reg_masters_2_pc_next" : i4
    %238 = hw.tfoutput %92 as "reg_masters_2_halted_next" : i1
    %239 = hw.tfoutput %80 as "reg_masters_2_regs_0_next" : i8
    %240 = hw.tfoutput %83 as "reg_masters_2_regs_1_next" : i8
    %241 = hw.tfoutput %86 as "reg_masters_2_regs_2_next" : i8
    %242 = hw.tfoutput %89 as "reg_masters_2_regs_3_next" : i8
    %243 = hw.tfoutput %96 as "reg_regFile_mem_0_next" : i8
    %244 = hw.tfoutput %99 as "reg_regFile_mem_1_next" : i8
    %245 = hw.tfoutput %102 as "reg_regFile_mem_2_next" : i8
    %246 = hw.tfoutput %105 as "reg_regFile_mem_3_next" : i8
    %247 = hw.tfoutput %108 as "reg_regFile_mem_4_next" : i8
    %248 = hw.tfoutput %111 as "reg_regFile_mem_5_next" : i8
    %249 = hw.tfoutput %114 as "reg_regFile_mem_6_next" : i8
    %250 = hw.tfoutput %117 as "reg_regFile_mem_7_next" : i8
    %251 = hw.tfoutput %130 as "reg_counter_count_next" : i8
    %252 = hw.tfoutput %132 as "reg_gpio_reg_next" : i8
    %253 = hw.tfoutput %reg_masters_0_pc as "mem_masters_0_instrMem_r_0_addr" : i4
    %254 = hw.tfoutput %reg_masters_1_pc as "mem_masters_1_instrMem_r_1_addr" : i4
    %255 = hw.tfoutput %reg_masters_2_pc as "mem_masters_2_instrMem_r_2_addr" : i4
    %256 = hw.tfoutput %in_io_loadAddr_0 as "mem_masters_0_instrMem_w_0_addr" : i4
    %257 = hw.tfoutput %in_io_loadEn_0 as "mem_masters_0_instrMem_w_0_en" : i1
    %258 = hw.tfoutput %0 as "mem_masters_0_instrMem_w_0_data" : i14
    %259 = hw.tfoutput %in_io_loadAddr_1 as "mem_masters_1_instrMem_w_1_addr" : i4
    %260 = hw.tfoutput %in_io_loadEn_1 as "mem_masters_1_instrMem_w_1_en" : i1
    %261 = hw.tfoutput %31 as "mem_masters_1_instrMem_w_1_data" : i14
    %262 = hw.tfoutput %in_io_loadAddr_2 as "mem_masters_2_instrMem_w_2_addr" : i4
    %263 = hw.tfoutput %in_io_loadEn_2 as "mem_masters_2_instrMem_w_2_en" : i1
    %264 = hw.tfoutput %62 as "mem_masters_2_instrMem_w_2_data" : i14
    hw.output {output_names = ["out_io_masterHalted_0", "out_io_masterHalted_1", "out_io_masterHalted_2", "out_io_masterDebug_0", "out_io_masterDebug_1", "out_io_masterDebug_2", "out_io_gpioPins", "reg_masters_0_pc_next", "reg_masters_0_halted_next", "reg_masters_0_regs_0_next", "reg_masters_0_regs_1_next", "reg_masters_0_regs_2_next", "reg_masters_0_regs_3_next", "reg_masters_1_pc_next", "reg_masters_1_halted_next", "reg_masters_1_regs_0_next", "reg_masters_1_regs_1_next", "reg_masters_1_regs_2_next", "reg_masters_1_regs_3_next", "reg_masters_2_pc_next", "reg_masters_2_halted_next", "reg_masters_2_regs_0_next", "reg_masters_2_regs_1_next", "reg_masters_2_regs_2_next", "reg_masters_2_regs_3_next", "reg_regFile_mem_0_next", "reg_regFile_mem_1_next", "reg_regFile_mem_2_next", "reg_regFile_mem_3_next", "reg_regFile_mem_4_next", "reg_regFile_mem_5_next", "reg_regFile_mem_6_next", "reg_regFile_mem_7_next", "reg_counter_count_next", "reg_gpio_reg_next", "mem_masters_0_instrMem_r_0_addr", "mem_masters_1_instrMem_r_1_addr", "mem_masters_2_instrMem_r_2_addr", "mem_masters_0_instrMem_w_0_addr", "mem_masters_0_instrMem_w_0_en", "mem_masters_0_instrMem_w_0_data", "mem_masters_1_instrMem_w_1_addr", "mem_masters_1_instrMem_w_1_en", "mem_masters_1_instrMem_w_1_data", "mem_masters_2_instrMem_w_2_addr", "mem_masters_2_instrMem_w_2_en", "mem_masters_2_instrMem_w_2_data"]} %218, %219, %220, %221, %222, %223, %224, %225, %226, %227, %228, %229, %230, %231, %232, %233, %234, %235, %236, %237, %238, %239, %240, %241, %242, %243, %244, %245, %246, %247, %248, %249, %250, %251, %252, %253, %254, %255, %256, %257, %258, %259, %260, %261, %262, %263, %264 : i1, i1, i1, i8, i8, i8, i8, i4, i1, i8, i8, i8, i8, i4, i1, i8, i8, i8, i8, i4, i1, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i4, i4, i4, i4, i1, i14, i4, i1, i14, i4, i1, i14
  }
  hw.module @SimpleChiselTop(in %io_clock : !seq.clock, in %io_reset : i1, in %io_loadEn_0 : i1, in %io_loadEn_1 : i1, in %io_loadEn_2 : i1, in %io_loadAddr_0 : i4, in %io_loadAddr_1 : i4, in %io_loadAddr_2 : i4, in %io_loadData_0 : i16, in %io_loadData_1 : i16, in %io_loadData_2 : i16, out io_masterHalted_0 : i1, out io_masterHalted_1 : i1, out io_masterHalted_2 : i1, out io_masterDebug_0 : i8, out io_masterDebug_1 : i8, out io_masterDebug_2 : i8, out io_gpioPins : i8) {
    %c0_i8 = hw.constant 0 : i8
    %false = hw.constant false
    %c0_i4 = hw.constant 0 : i4
    %masters_02FinstrMem = seq.firmem name "masters_0/instrMem" 0, 1, undefined, port_order : <16 x 14>
    seq.firmem.write_port %masters_02FinstrMem[%SimpleChiselTop_inst.mem_masters_0_instrMem_w_0_addr] = %SimpleChiselTop_inst.mem_masters_0_instrMem_w_0_data, clock %io_clock enable %SimpleChiselTop_inst.mem_masters_0_instrMem_w_0_en : <16 x 14>
    %0 = seq.firmem.read_port %masters_02FinstrMem[%SimpleChiselTop_inst.mem_masters_0_instrMem_r_0_addr], clock %io_clock : <16 x 14>
    %masters_02Fpc = seq.firreg %SimpleChiselTop_inst.reg_masters_0_pc_next clock %io_clock reset sync %io_reset, %c0_i4 {firrtl.random_init_start = 0 : ui64, name = "masters_0/pc"} : i4
    %masters_02Fhalted = seq.firreg %SimpleChiselTop_inst.reg_masters_0_halted_next clock %io_clock reset sync %io_reset, %false {firrtl.random_init_start = 4 : ui64, name = "masters_0/halted", sv.namehint = "halted"} : i1
    %masters_02Fregs_0 = seq.firreg %SimpleChiselTop_inst.reg_masters_0_regs_0_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 5 : ui64, name = "masters_0/regs_0", sv.namehint = "regs_0"} : i8
    %masters_02Fregs_1 = seq.firreg %SimpleChiselTop_inst.reg_masters_0_regs_1_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 13 : ui64, name = "masters_0/regs_1"} : i8
    %masters_02Fregs_2 = seq.firreg %SimpleChiselTop_inst.reg_masters_0_regs_2_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 21 : ui64, name = "masters_0/regs_2"} : i8
    %masters_02Fregs_3 = seq.firreg %SimpleChiselTop_inst.reg_masters_0_regs_3_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 29 : ui64, name = "masters_0/regs_3"} : i8
    %masters_12FinstrMem = seq.firmem name "masters_1/instrMem" 0, 1, undefined, port_order : <16 x 14>
    seq.firmem.write_port %masters_12FinstrMem[%SimpleChiselTop_inst.mem_masters_1_instrMem_w_1_addr] = %SimpleChiselTop_inst.mem_masters_1_instrMem_w_1_data, clock %io_clock enable %SimpleChiselTop_inst.mem_masters_1_instrMem_w_1_en : <16 x 14>
    %1 = seq.firmem.read_port %masters_12FinstrMem[%SimpleChiselTop_inst.mem_masters_1_instrMem_r_1_addr], clock %io_clock : <16 x 14>
    %masters_12Fpc = seq.firreg %SimpleChiselTop_inst.reg_masters_1_pc_next clock %io_clock reset sync %io_reset, %c0_i4 {firrtl.random_init_start = 0 : ui64, name = "masters_1/pc"} : i4
    %masters_12Fhalted = seq.firreg %SimpleChiselTop_inst.reg_masters_1_halted_next clock %io_clock reset sync %io_reset, %false {firrtl.random_init_start = 4 : ui64, name = "masters_1/halted", sv.namehint = "halted"} : i1
    %masters_12Fregs_0 = seq.firreg %SimpleChiselTop_inst.reg_masters_1_regs_0_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 5 : ui64, name = "masters_1/regs_0", sv.namehint = "regs_0"} : i8
    %masters_12Fregs_1 = seq.firreg %SimpleChiselTop_inst.reg_masters_1_regs_1_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 13 : ui64, name = "masters_1/regs_1"} : i8
    %masters_12Fregs_2 = seq.firreg %SimpleChiselTop_inst.reg_masters_1_regs_2_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 21 : ui64, name = "masters_1/regs_2"} : i8
    %masters_12Fregs_3 = seq.firreg %SimpleChiselTop_inst.reg_masters_1_regs_3_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 29 : ui64, name = "masters_1/regs_3"} : i8
    %masters_22FinstrMem = seq.firmem name "masters_2/instrMem" 0, 1, undefined, port_order : <16 x 14>
    seq.firmem.write_port %masters_22FinstrMem[%SimpleChiselTop_inst.mem_masters_2_instrMem_w_2_addr] = %SimpleChiselTop_inst.mem_masters_2_instrMem_w_2_data, clock %io_clock enable %SimpleChiselTop_inst.mem_masters_2_instrMem_w_2_en : <16 x 14>
    %2 = seq.firmem.read_port %masters_22FinstrMem[%SimpleChiselTop_inst.mem_masters_2_instrMem_r_2_addr], clock %io_clock : <16 x 14>
    %masters_22Fpc = seq.firreg %SimpleChiselTop_inst.reg_masters_2_pc_next clock %io_clock reset sync %io_reset, %c0_i4 {firrtl.random_init_start = 0 : ui64, name = "masters_2/pc"} : i4
    %masters_22Fhalted = seq.firreg %SimpleChiselTop_inst.reg_masters_2_halted_next clock %io_clock reset sync %io_reset, %false {firrtl.random_init_start = 4 : ui64, name = "masters_2/halted", sv.namehint = "halted"} : i1
    %masters_22Fregs_0 = seq.firreg %SimpleChiselTop_inst.reg_masters_2_regs_0_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 5 : ui64, name = "masters_2/regs_0", sv.namehint = "regs_0"} : i8
    %masters_22Fregs_1 = seq.firreg %SimpleChiselTop_inst.reg_masters_2_regs_1_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 13 : ui64, name = "masters_2/regs_1"} : i8
    %masters_22Fregs_2 = seq.firreg %SimpleChiselTop_inst.reg_masters_2_regs_2_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 21 : ui64, name = "masters_2/regs_2"} : i8
    %masters_22Fregs_3 = seq.firreg %SimpleChiselTop_inst.reg_masters_2_regs_3_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 29 : ui64, name = "masters_2/regs_3"} : i8
    %regFile2Fmem_0 = seq.firreg %SimpleChiselTop_inst.reg_regFile_mem_0_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 0 : ui64, name = "regFile/mem_0"} : i8
    %regFile2Fmem_1 = seq.firreg %SimpleChiselTop_inst.reg_regFile_mem_1_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 8 : ui64, name = "regFile/mem_1"} : i8
    %regFile2Fmem_2 = seq.firreg %SimpleChiselTop_inst.reg_regFile_mem_2_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 16 : ui64, name = "regFile/mem_2"} : i8
    %regFile2Fmem_3 = seq.firreg %SimpleChiselTop_inst.reg_regFile_mem_3_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 24 : ui64, name = "regFile/mem_3"} : i8
    %regFile2Fmem_4 = seq.firreg %SimpleChiselTop_inst.reg_regFile_mem_4_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 32 : ui64, name = "regFile/mem_4"} : i8
    %regFile2Fmem_5 = seq.firreg %SimpleChiselTop_inst.reg_regFile_mem_5_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 40 : ui64, name = "regFile/mem_5"} : i8
    %regFile2Fmem_6 = seq.firreg %SimpleChiselTop_inst.reg_regFile_mem_6_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 48 : ui64, name = "regFile/mem_6"} : i8
    %regFile2Fmem_7 = seq.firreg %SimpleChiselTop_inst.reg_regFile_mem_7_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 56 : ui64, name = "regFile/mem_7"} : i8
    %counter2Fcount = seq.firreg %SimpleChiselTop_inst.reg_counter_count_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 0 : ui64, name = "counter/count", sv.namehint = "count"} : i8
    %gpio2Freg = seq.firreg %SimpleChiselTop_inst.reg_gpio_reg_next clock %io_clock reset sync %io_reset, %c0_i8 {firrtl.random_init_start = 0 : ui64, name = "gpio/reg", sv.namehint = "reg"} : i8
    %SimpleChiselTop_inst.out_io_masterHalted_0, %SimpleChiselTop_inst.out_io_masterHalted_1, %SimpleChiselTop_inst.out_io_masterHalted_2, %SimpleChiselTop_inst.out_io_masterDebug_0, %SimpleChiselTop_inst.out_io_masterDebug_1, %SimpleChiselTop_inst.out_io_masterDebug_2, %SimpleChiselTop_inst.out_io_gpioPins, %SimpleChiselTop_inst.reg_masters_0_pc_next, %SimpleChiselTop_inst.reg_masters_0_halted_next, %SimpleChiselTop_inst.reg_masters_0_regs_0_next, %SimpleChiselTop_inst.reg_masters_0_regs_1_next, %SimpleChiselTop_inst.reg_masters_0_regs_2_next, %SimpleChiselTop_inst.reg_masters_0_regs_3_next, %SimpleChiselTop_inst.reg_masters_1_pc_next, %SimpleChiselTop_inst.reg_masters_1_halted_next, %SimpleChiselTop_inst.reg_masters_1_regs_0_next, %SimpleChiselTop_inst.reg_masters_1_regs_1_next, %SimpleChiselTop_inst.reg_masters_1_regs_2_next, %SimpleChiselTop_inst.reg_masters_1_regs_3_next, %SimpleChiselTop_inst.reg_masters_2_pc_next, %SimpleChiselTop_inst.reg_masters_2_halted_next, %SimpleChiselTop_inst.reg_masters_2_regs_0_next, %SimpleChiselTop_inst.reg_masters_2_regs_1_next, %SimpleChiselTop_inst.reg_masters_2_regs_2_next, %SimpleChiselTop_inst.reg_masters_2_regs_3_next, %SimpleChiselTop_inst.reg_regFile_mem_0_next, %SimpleChiselTop_inst.reg_regFile_mem_1_next, %SimpleChiselTop_inst.reg_regFile_mem_2_next, %SimpleChiselTop_inst.reg_regFile_mem_3_next, %SimpleChiselTop_inst.reg_regFile_mem_4_next, %SimpleChiselTop_inst.reg_regFile_mem_5_next, %SimpleChiselTop_inst.reg_regFile_mem_6_next, %SimpleChiselTop_inst.reg_regFile_mem_7_next, %SimpleChiselTop_inst.reg_counter_count_next, %SimpleChiselTop_inst.reg_gpio_reg_next, %SimpleChiselTop_inst.mem_masters_0_instrMem_r_0_addr, %SimpleChiselTop_inst.mem_masters_1_instrMem_r_1_addr, %SimpleChiselTop_inst.mem_masters_2_instrMem_r_2_addr, %SimpleChiselTop_inst.mem_masters_0_instrMem_w_0_addr, %SimpleChiselTop_inst.mem_masters_0_instrMem_w_0_en, %SimpleChiselTop_inst.mem_masters_0_instrMem_w_0_data, %SimpleChiselTop_inst.mem_masters_1_instrMem_w_1_addr, %SimpleChiselTop_inst.mem_masters_1_instrMem_w_1_en, %SimpleChiselTop_inst.mem_masters_1_instrMem_w_1_data, %SimpleChiselTop_inst.mem_masters_2_instrMem_w_2_addr, %SimpleChiselTop_inst.mem_masters_2_instrMem_w_2_en, %SimpleChiselTop_inst.mem_masters_2_instrMem_w_2_data = hw.instance "SimpleChiselTop_inst" @SimpleChiselTop_transfer(in_io_loadEn_0: %io_loadEn_0: i1, in_io_loadEn_1: %io_loadEn_1: i1, in_io_loadEn_2: %io_loadEn_2: i1, in_io_loadAddr_0: %io_loadAddr_0: i4, in_io_loadAddr_1: %io_loadAddr_1: i4, in_io_loadAddr_2: %io_loadAddr_2: i4, in_io_loadData_0: %io_loadData_0: i16, in_io_loadData_1: %io_loadData_1: i16, in_io_loadData_2: %io_loadData_2: i16, reg_masters_0_pc: %masters_02Fpc: i4, reg_masters_0_halted: %masters_02Fhalted: i1, reg_masters_0_regs_0: %masters_02Fregs_0: i8, reg_masters_0_regs_1: %masters_02Fregs_1: i8, reg_masters_0_regs_2: %masters_02Fregs_2: i8, reg_masters_0_regs_3: %masters_02Fregs_3: i8, reg_masters_1_pc: %masters_12Fpc: i4, reg_masters_1_halted: %masters_12Fhalted: i1, reg_masters_1_regs_0: %masters_12Fregs_0: i8, reg_masters_1_regs_1: %masters_12Fregs_1: i8, reg_masters_1_regs_2: %masters_12Fregs_2: i8, reg_masters_1_regs_3: %masters_12Fregs_3: i8, reg_masters_2_pc: %masters_22Fpc: i4, reg_masters_2_halted: %masters_22Fhalted: i1, reg_masters_2_regs_0: %masters_22Fregs_0: i8, reg_masters_2_regs_1: %masters_22Fregs_1: i8, reg_masters_2_regs_2: %masters_22Fregs_2: i8, reg_masters_2_regs_3: %masters_22Fregs_3: i8, reg_regFile_mem_0: %regFile2Fmem_0: i8, reg_regFile_mem_1: %regFile2Fmem_1: i8, reg_regFile_mem_2: %regFile2Fmem_2: i8, reg_regFile_mem_3: %regFile2Fmem_3: i8, reg_regFile_mem_4: %regFile2Fmem_4: i8, reg_regFile_mem_5: %regFile2Fmem_5: i8, reg_regFile_mem_6: %regFile2Fmem_6: i8, reg_regFile_mem_7: %regFile2Fmem_7: i8, reg_counter_count: %counter2Fcount: i8, reg_gpio_reg: %gpio2Freg: i8, mem_masters_0_instrMem_r_0_data: %0: i14, mem_masters_1_instrMem_r_1_data: %1: i14, mem_masters_2_instrMem_r_2_data: %2: i14) -> (out_io_masterHalted_0: i1, out_io_masterHalted_1: i1, out_io_masterHalted_2: i1, out_io_masterDebug_0: i8, out_io_masterDebug_1: i8, out_io_masterDebug_2: i8, out_io_gpioPins: i8, reg_masters_0_pc_next: i4, reg_masters_0_halted_next: i1, reg_masters_0_regs_0_next: i8, reg_masters_0_regs_1_next: i8, reg_masters_0_regs_2_next: i8, reg_masters_0_regs_3_next: i8, reg_masters_1_pc_next: i4, reg_masters_1_halted_next: i1, reg_masters_1_regs_0_next: i8, reg_masters_1_regs_1_next: i8, reg_masters_1_regs_2_next: i8, reg_masters_1_regs_3_next: i8, reg_masters_2_pc_next: i4, reg_masters_2_halted_next: i1, reg_masters_2_regs_0_next: i8, reg_masters_2_regs_1_next: i8, reg_masters_2_regs_2_next: i8, reg_masters_2_regs_3_next: i8, reg_regFile_mem_0_next: i8, reg_regFile_mem_1_next: i8, reg_regFile_mem_2_next: i8, reg_regFile_mem_3_next: i8, reg_regFile_mem_4_next: i8, reg_regFile_mem_5_next: i8, reg_regFile_mem_6_next: i8, reg_regFile_mem_7_next: i8, reg_counter_count_next: i8, reg_gpio_reg_next: i8, mem_masters_0_instrMem_r_0_addr: i4, mem_masters_1_instrMem_r_1_addr: i4, mem_masters_2_instrMem_r_2_addr: i4, mem_masters_0_instrMem_w_0_addr: i4, mem_masters_0_instrMem_w_0_en: i1, mem_masters_0_instrMem_w_0_data: i14, mem_masters_1_instrMem_w_1_addr: i4, mem_masters_1_instrMem_w_1_en: i1, mem_masters_1_instrMem_w_1_data: i14, mem_masters_2_instrMem_w_2_addr: i4, mem_masters_2_instrMem_w_2_en: i1, mem_masters_2_instrMem_w_2_data: i14)
    hw.output %SimpleChiselTop_inst.out_io_masterHalted_0, %SimpleChiselTop_inst.out_io_masterHalted_1, %SimpleChiselTop_inst.out_io_masterHalted_2, %SimpleChiselTop_inst.out_io_masterDebug_0, %SimpleChiselTop_inst.out_io_masterDebug_1, %SimpleChiselTop_inst.out_io_masterDebug_2, %SimpleChiselTop_inst.out_io_gpioPins : i1, i1, i1, i8, i8, i8, i8
  }
  om.class @SimpleChiselTop_Class(%basepath: !om.basepath) {
    om.class.fields 
  }
}

