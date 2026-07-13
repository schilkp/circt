FIRRTL version 3.3.0
circuit SimToplevel :%[[
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|InstructionMemory",
    "group":"InstructionMemory"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|DualPortRAM",
    "group":"DualPortRAM"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|Queue128_UInt8",
    "group":"Queue128_UInt<8>"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|Queue128_UInt8_1",
    "group":"Queue128_UInt<8>"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|Uart",
    "group":"Uart"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|Syscon",
    "group":"Syscon"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|RegisterBank",
    "group":"RegisterBank"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|ProgramCounter",
    "group":"ProgramCounter"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|ALU",
    "group":"ALU"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|Decoder",
    "group":"Decoder"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|MemoryIOManager",
    "group":"MemoryIOManager"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|GPIO",
    "group":"GPIO"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|Timer",
    "group":"Timer"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|RVFICPUWrapper",
    "group":"RVFICPUWrapper"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|SimSOC",
    "group":"SimSOC"
  },
  {
    "class":"firrtl.transforms.DedupGroupAnnotation",
    "target":"~SimToplevel|SimToplevel",
    "group":"SimToplevel"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.ALU.io.inst",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumDefAnnotation",
    "typeName":"chiselv.Instruction",
    "definition":{
      "BNE":23,
      "NEQ":49,
      "OR":14,
      "SUB":3,
      "ORI":15,
      "LBU":42,
      "LHU":43,
      "JALR":29,
      "GTE":50,
      "LW":44,
      "SRAI":11,
      "BLT":24,
      "CSRRCI":39,
      "ADD":1,
      "JAL":28,
      "SLLI":7,
      "SRLI":9,
      "GTEU":51,
      "SRL":8,
      "SB":45,
      "CSRRW":34,
      "SW":47,
      "ANDI":13,
      "LH":41,
      "FENCEI":31,
      "BLTU":26,
      "BGE":25,
      "CSRRS":35,
      "SH":46,
      "ADDI":2,
      "CSRRSI":38,
      "BGEU":27,
      "EQ":48,
      "XOR":16,
      "LUI":4,
      "LB":40,
      "SLTIU":21,
      "ERR_INST":0,
      "SRA":10,
      "BEQ":22,
      "SLTI":19,
      "CSRRC":36,
      "ECALL":32,
      "SLL":6,
      "SLTU":20,
      "AUIPC":5,
      "AND":12,
      "XORI":17,
      "SLT":18,
      "EBREAK":33,
      "CSRRWI":37,
      "FENCE":30
    }
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder.io.inst",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_94",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumDefAnnotation",
    "typeName":"chiselv.InstructionType",
    "definition":{
      "INST_B":4,
      "INST_U":5,
      "IN_ERR":0,
      "INST_R":1,
      "INST_Z":7,
      "INST_S":3,
      "INST_I":2,
      "INST_J":6
    }
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_95",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_96",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_97",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_98",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_99",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_100",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_101",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_102",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_103",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_104",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_105",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_106",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_107",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_108",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_109",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_110",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_111",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_112",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_113",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_114",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_115",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_116",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_117",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_118",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_119",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_120",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_121",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_122",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_123",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_124",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_125",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_126",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_127",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_128",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_129",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_130",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_131",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_132",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_133",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_134",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_135",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_136",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_137",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_138",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_139",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder.signals_0",
    "enumTypeName":"chiselv.InstructionType"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_140",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_141",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_142",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_143",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_144",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_145",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_146",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_147",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_148",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_149",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_150",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_151",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_152",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_153",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_154",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_155",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_156",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_157",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_158",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_159",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_160",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_161",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_162",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_163",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_164",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_165",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_166",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_167",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_168",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_169",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_170",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_171",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_172",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_173",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_174",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_175",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_176",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_177",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_178",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_179",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_180",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_181",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_182",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_183",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_184",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder._signals_T_185",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"chisel3.experimental.EnumAnnotations$EnumComponentAnnotation",
    "target":"SimToplevel.Decoder.signals_1",
    "enumTypeName":"chiselv.Instruction"
  },
  {
    "class":"firrtl.annotations.MemoryFileInlineAnnotation",
    "target":"~SimToplevel|InstructionMemory>mem",
    "filename":"progload.mem",
    "hexOrBinary":"h"
  },
  {
    "class":"firrtl.annotations.MemoryFileInlineAnnotation",
    "target":"~SimToplevel|DualPortRAM>mem",
    "filename":"progload-RAM.mem",
    "hexOrBinary":"h"
  }
]]
  module InstructionMemory : @[chiselv/src/InstructionMemory.scala 13:7]
    input clock : Clock @[chiselv/src/InstructionMemory.scala 13:7]
    input reset : Reset @[chiselv/src/InstructionMemory.scala 13:7]
    output io : { flip readAddr : UInt<16>, readData : UInt<32>, ready : UInt<1>} @[chiselv/src/InstructionMemory.scala 19:17]

    cmem mem : UInt<32> [2048] @[chiselv/src/InstructionMemory.scala 21:16]
    node readAddress = shr(io.readAddr, 2) @[chiselv/src/InstructionMemory.scala 23:33]
    node _io_readData_T = bits(readAddress, 10, 0) @[chiselv/src/InstructionMemory.scala 28:26]
    read mport io_readData_MPORT = mem[_io_readData_T], clock @[chiselv/src/InstructionMemory.scala 28:26]
    connect io.readData, io_readData_MPORT @[chiselv/src/InstructionMemory.scala 28:15]
    connect io.ready, UInt<1>(0h1) @[chiselv/src/InstructionMemory.scala 29:15]

  module DualPortRAM : @[chiselv/src/DataMemory.scala 16:7]
    input clock : Clock @[chiselv/src/DataMemory.scala 16:7]
    input reset : Reset @[chiselv/src/DataMemory.scala 16:7]
    output io : { flip readAddress : UInt<16>, readData : UInt<32>, flip writeAddress : UInt<16>, flip writeData : UInt<32>, flip writeMask : UInt<4>, flip dataSize : UInt<2>, flip writeEnable : UInt<1>} @[chiselv/src/DataMemory.scala 23:17]

    smem mem : UInt<32> [2048] @[chiselv/src/DataMemory.scala 33:24]
    node readAddress = shr(io.readAddress, 2) @[chiselv/src/DataMemory.scala 36:37]
    node writeAddress = shr(io.writeAddress, 2) @[chiselv/src/DataMemory.scala 37:38]
    wire _io_readData_WIRE : UInt<14> @[chiselv/src/DataMemory.scala 44:26]
    invalidate _io_readData_WIRE @[chiselv/src/DataMemory.scala 44:26]
    when UInt<1>(0h1) : @[chiselv/src/DataMemory.scala 44:26]
      connect _io_readData_WIRE, readAddress @[chiselv/src/DataMemory.scala 44:26]
      node _io_readData_T = bits(_io_readData_WIRE, 10, 0) @[chiselv/src/DataMemory.scala 44:26]
      read mport io_readData_MPORT = mem[_io_readData_T], clock @[chiselv/src/DataMemory.scala 44:26]
    connect io.readData, io_readData_MPORT @[chiselv/src/DataMemory.scala 44:15]
    node _T = eq(io.writeEnable, UInt<1>(0h1)) @[chiselv/src/DataMemory.scala 46:23]
    when _T : @[chiselv/src/DataMemory.scala 46:35]
      node _T_1 = bits(writeAddress, 10, 0) @[chiselv/src/DataMemory.scala 47:14]
      write mport MPORT = mem[_T_1], clock @[chiselv/src/DataMemory.scala 47:14]
      connect MPORT, io.writeData @[chiselv/src/DataMemory.scala 47:14]


  module Queue128_UInt8 : @[src/main/scala/chisel3/util/Decoupled.scala 243:7]
    input clock : Clock @[src/main/scala/chisel3/util/Decoupled.scala 243:7]
    input reset : Reset @[src/main/scala/chisel3/util/Decoupled.scala 243:7]
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, count : UInt<8>} @[src/main/scala/chisel3/util/Decoupled.scala 255:14]

    cmem ram : UInt<8> [128] @[src/main/scala/chisel3/util/Decoupled.scala 256:91]
    regreset enq_ptr_value : UInt<7>, clock, reset, UInt<7>(0h0) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    regreset deq_ptr_value : UInt<7>, clock, reset, UInt<7>(0h0) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    regreset maybe_full : UInt<1>, clock, reset, UInt<1>(0h0) @[src/main/scala/chisel3/util/Decoupled.scala 259:27]
    node ptr_match = eq(enq_ptr_value, deq_ptr_value) @[src/main/scala/chisel3/util/Decoupled.scala 260:33]
    node _empty_T = eq(maybe_full, UInt<1>(0h0)) @[src/main/scala/chisel3/util/Decoupled.scala 261:28]
    node empty = and(ptr_match, _empty_T) @[src/main/scala/chisel3/util/Decoupled.scala 261:25]
    node full = and(ptr_match, maybe_full) @[src/main/scala/chisel3/util/Decoupled.scala 262:24]
    node _do_enq_T = and(io.enq.ready, io.enq.valid) @[src/main/scala/chisel3/util/Decoupled.scala 51:35]
    wire do_enq : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 263:27]
    connect do_enq, _do_enq_T @[src/main/scala/chisel3/util/Decoupled.scala 263:27]
    node _do_deq_T = and(io.deq.ready, io.deq.valid) @[src/main/scala/chisel3/util/Decoupled.scala 51:35]
    wire do_deq : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 264:27]
    connect do_deq, _do_deq_T @[src/main/scala/chisel3/util/Decoupled.scala 264:27]
    when do_enq : @[src/main/scala/chisel3/util/Decoupled.scala 269:16]
      infer mport MPORT = ram[enq_ptr_value], clock @[src/main/scala/chisel3/util/Decoupled.scala 270:8]
      connect MPORT, io.enq.bits @[src/main/scala/chisel3/util/Decoupled.scala 270:24]
      node wrap = eq(enq_ptr_value, UInt<7>(0h7f)) @[src/main/scala/chisel3/util/Counter.scala 73:24]
      node _value_T = add(enq_ptr_value, UInt<1>(0h1)) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      node _value_T_1 = tail(_value_T, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      connect enq_ptr_value, _value_T_1 @[src/main/scala/chisel3/util/Counter.scala 77:15]
    when do_deq : @[src/main/scala/chisel3/util/Decoupled.scala 273:16]
      node wrap_1 = eq(deq_ptr_value, UInt<7>(0h7f)) @[src/main/scala/chisel3/util/Counter.scala 73:24]
      node _value_T_2 = add(deq_ptr_value, UInt<1>(0h1)) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      node _value_T_3 = tail(_value_T_2, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      connect deq_ptr_value, _value_T_3 @[src/main/scala/chisel3/util/Counter.scala 77:15]
    node _T = neq(do_enq, do_deq) @[src/main/scala/chisel3/util/Decoupled.scala 276:15]
    when _T : @[src/main/scala/chisel3/util/Decoupled.scala 276:27]
      connect maybe_full, do_enq @[src/main/scala/chisel3/util/Decoupled.scala 277:16]
    when UInt<1>(0h0) : @[src/main/scala/chisel3/util/Decoupled.scala 279:15]
      connect enq_ptr_value, UInt<1>(0h0) @[src/main/scala/chisel3/util/Counter.scala 98:11]
      connect deq_ptr_value, UInt<1>(0h0) @[src/main/scala/chisel3/util/Counter.scala 98:11]
      connect maybe_full, UInt<1>(0h0) @[src/main/scala/chisel3/util/Decoupled.scala 282:16]
    node _io_deq_valid_T = eq(empty, UInt<1>(0h0)) @[src/main/scala/chisel3/util/Decoupled.scala 285:19]
    connect io.deq.valid, _io_deq_valid_T @[src/main/scala/chisel3/util/Decoupled.scala 285:16]
    node _io_enq_ready_T = eq(full, UInt<1>(0h0)) @[src/main/scala/chisel3/util/Decoupled.scala 286:19]
    connect io.enq.ready, _io_enq_ready_T @[src/main/scala/chisel3/util/Decoupled.scala 286:16]
    infer mport io_deq_bits_MPORT = ram[deq_ptr_value], clock @[src/main/scala/chisel3/util/Decoupled.scala 293:23]
    connect io.deq.bits, io_deq_bits_MPORT @[src/main/scala/chisel3/util/Decoupled.scala 293:17]
    node _ptr_diff_T = sub(enq_ptr_value, deq_ptr_value) @[src/main/scala/chisel3/util/Decoupled.scala 309:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[src/main/scala/chisel3/util/Decoupled.scala 309:32]
    node _io_count_T = and(maybe_full, ptr_match) @[src/main/scala/chisel3/util/Decoupled.scala 312:32]
    node _io_count_T_1 = mux(_io_count_T, UInt<8>(0h80), UInt<1>(0h0)) @[src/main/scala/chisel3/util/Decoupled.scala 312:20]
    node _io_count_T_2 = or(_io_count_T_1, ptr_diff) @[src/main/scala/chisel3/util/Decoupled.scala 312:62]
    connect io.count, _io_count_T_2 @[src/main/scala/chisel3/util/Decoupled.scala 312:14]

  module Queue128_UInt8_1 : @[src/main/scala/chisel3/util/Decoupled.scala 243:7]
    input clock : Clock @[src/main/scala/chisel3/util/Decoupled.scala 243:7]
    input reset : Reset @[src/main/scala/chisel3/util/Decoupled.scala 243:7]
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, count : UInt<8>} @[src/main/scala/chisel3/util/Decoupled.scala 255:14]

    cmem ram : UInt<8> [128] @[src/main/scala/chisel3/util/Decoupled.scala 256:91]
    regreset enq_ptr_value : UInt<7>, clock, reset, UInt<7>(0h0) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    regreset deq_ptr_value : UInt<7>, clock, reset, UInt<7>(0h0) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    regreset maybe_full : UInt<1>, clock, reset, UInt<1>(0h0) @[src/main/scala/chisel3/util/Decoupled.scala 259:27]
    node ptr_match = eq(enq_ptr_value, deq_ptr_value) @[src/main/scala/chisel3/util/Decoupled.scala 260:33]
    node _empty_T = eq(maybe_full, UInt<1>(0h0)) @[src/main/scala/chisel3/util/Decoupled.scala 261:28]
    node empty = and(ptr_match, _empty_T) @[src/main/scala/chisel3/util/Decoupled.scala 261:25]
    node full = and(ptr_match, maybe_full) @[src/main/scala/chisel3/util/Decoupled.scala 262:24]
    node _do_enq_T = and(io.enq.ready, io.enq.valid) @[src/main/scala/chisel3/util/Decoupled.scala 51:35]
    wire do_enq : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 263:27]
    connect do_enq, _do_enq_T @[src/main/scala/chisel3/util/Decoupled.scala 263:27]
    node _do_deq_T = and(io.deq.ready, io.deq.valid) @[src/main/scala/chisel3/util/Decoupled.scala 51:35]
    wire do_deq : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 264:27]
    connect do_deq, _do_deq_T @[src/main/scala/chisel3/util/Decoupled.scala 264:27]
    when do_enq : @[src/main/scala/chisel3/util/Decoupled.scala 269:16]
      infer mport MPORT = ram[enq_ptr_value], clock @[src/main/scala/chisel3/util/Decoupled.scala 270:8]
      connect MPORT, io.enq.bits @[src/main/scala/chisel3/util/Decoupled.scala 270:24]
      node wrap = eq(enq_ptr_value, UInt<7>(0h7f)) @[src/main/scala/chisel3/util/Counter.scala 73:24]
      node _value_T = add(enq_ptr_value, UInt<1>(0h1)) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      node _value_T_1 = tail(_value_T, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      connect enq_ptr_value, _value_T_1 @[src/main/scala/chisel3/util/Counter.scala 77:15]
    when do_deq : @[src/main/scala/chisel3/util/Decoupled.scala 273:16]
      node wrap_1 = eq(deq_ptr_value, UInt<7>(0h7f)) @[src/main/scala/chisel3/util/Counter.scala 73:24]
      node _value_T_2 = add(deq_ptr_value, UInt<1>(0h1)) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      node _value_T_3 = tail(_value_T_2, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      connect deq_ptr_value, _value_T_3 @[src/main/scala/chisel3/util/Counter.scala 77:15]
    node _T = neq(do_enq, do_deq) @[src/main/scala/chisel3/util/Decoupled.scala 276:15]
    when _T : @[src/main/scala/chisel3/util/Decoupled.scala 276:27]
      connect maybe_full, do_enq @[src/main/scala/chisel3/util/Decoupled.scala 277:16]
    when UInt<1>(0h0) : @[src/main/scala/chisel3/util/Decoupled.scala 279:15]
      connect enq_ptr_value, UInt<1>(0h0) @[src/main/scala/chisel3/util/Counter.scala 98:11]
      connect deq_ptr_value, UInt<1>(0h0) @[src/main/scala/chisel3/util/Counter.scala 98:11]
      connect maybe_full, UInt<1>(0h0) @[src/main/scala/chisel3/util/Decoupled.scala 282:16]
    node _io_deq_valid_T = eq(empty, UInt<1>(0h0)) @[src/main/scala/chisel3/util/Decoupled.scala 285:19]
    connect io.deq.valid, _io_deq_valid_T @[src/main/scala/chisel3/util/Decoupled.scala 285:16]
    node _io_enq_ready_T = eq(full, UInt<1>(0h0)) @[src/main/scala/chisel3/util/Decoupled.scala 286:19]
    connect io.enq.ready, _io_enq_ready_T @[src/main/scala/chisel3/util/Decoupled.scala 286:16]
    infer mport io_deq_bits_MPORT = ram[deq_ptr_value], clock @[src/main/scala/chisel3/util/Decoupled.scala 293:23]
    connect io.deq.bits, io_deq_bits_MPORT @[src/main/scala/chisel3/util/Decoupled.scala 293:17]
    node _ptr_diff_T = sub(enq_ptr_value, deq_ptr_value) @[src/main/scala/chisel3/util/Decoupled.scala 309:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[src/main/scala/chisel3/util/Decoupled.scala 309:32]
    node _io_count_T = and(maybe_full, ptr_match) @[src/main/scala/chisel3/util/Decoupled.scala 312:32]
    node _io_count_T_1 = mux(_io_count_T, UInt<8>(0h80), UInt<1>(0h0)) @[src/main/scala/chisel3/util/Decoupled.scala 312:20]
    node _io_count_T_2 = or(_io_count_T_1, ptr_diff) @[src/main/scala/chisel3/util/Decoupled.scala 312:62]
    connect io.count, _io_count_T_2 @[src/main/scala/chisel3/util/Decoupled.scala 312:14]

  module Uart : @[chiselv/src/Uart.scala 41:7]
    input clock : Clock @[chiselv/src/Uart.scala 41:7]
    input reset : Reset @[chiselv/src/Uart.scala 41:7]
    output io : { serialPort : { flip rx : UInt<1>, tx : UInt<1>}, dataPort : { rxQueue : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, flip txQueue : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, rxEmpty : UInt<1>, txEmpty : UInt<1>, rxFull : UInt<1>, txFull : UInt<1>, flip clockDivisor : { valid : UInt<1>, bits : UInt<8>}}} @[chiselv/src/Uart.scala 42:14]

    regreset sampleClk : UInt<1>, clock, reset, UInt<1>(0h0) @[chiselv/src/Uart.scala 49:33]
    regreset sampleClkCounter : UInt<8>, clock, reset, UInt<8>(0h0) @[chiselv/src/Uart.scala 50:33]
    regreset clockDivisor : UInt<8>, clock, reset, UInt<8>(0h0) @[chiselv/src/Uart.scala 51:33]
    when io.dataPort.clockDivisor.valid : @[chiselv/src/Uart.scala 53:40]
      connect clockDivisor, io.dataPort.clockDivisor.bits @[chiselv/src/Uart.scala 54:18]
    inst txQueue of Queue128_UInt8 @[chiselv/src/Uart.scala 57:23]
    connect txQueue.clock, clock
    connect txQueue.reset, reset
    inst rxQueue of Queue128_UInt8_1 @[chiselv/src/Uart.scala 58:23]
    connect rxQueue.clock, clock
    connect rxQueue.reset, reset
    node _io_dataPort_rxEmpty_T = eq(rxQueue.io.count, UInt<1>(0h0)) @[chiselv/src/Uart.scala 60:43]
    connect io.dataPort.rxEmpty, _io_dataPort_rxEmpty_T @[chiselv/src/Uart.scala 60:23]
    node _io_dataPort_txEmpty_T = eq(txQueue.io.count, UInt<1>(0h0)) @[chiselv/src/Uart.scala 61:43]
    connect io.dataPort.txEmpty, _io_dataPort_txEmpty_T @[chiselv/src/Uart.scala 61:23]
    node _io_dataPort_rxFull_T = eq(rxQueue.io.count, UInt<8>(0h80)) @[chiselv/src/Uart.scala 62:43]
    connect io.dataPort.rxFull, _io_dataPort_rxFull_T @[chiselv/src/Uart.scala 62:23]
    node _io_dataPort_txFull_T = eq(txQueue.io.count, UInt<8>(0h80)) @[chiselv/src/Uart.scala 63:43]
    connect io.dataPort.txFull, _io_dataPort_txFull_T @[chiselv/src/Uart.scala 63:23]
    node uartEnabled = orr(clockDivisor) @[chiselv/src/Uart.scala 65:34]
    when uartEnabled : @[chiselv/src/Uart.scala 67:21]
      node _T = eq(sampleClkCounter, clockDivisor) @[chiselv/src/Uart.scala 68:27]
      when _T : @[chiselv/src/Uart.scala 68:45]
        connect sampleClk, UInt<1>(0h1) @[chiselv/src/Uart.scala 69:24]
        connect sampleClkCounter, UInt<1>(0h0) @[chiselv/src/Uart.scala 70:24]
      else :
        connect sampleClk, UInt<1>(0h0) @[chiselv/src/Uart.scala 72:24]
        node _sampleClkCounter_T = add(sampleClkCounter, UInt<1>(0h1)) @[chiselv/src/Uart.scala 73:44]
        node _sampleClkCounter_T_1 = tail(_sampleClkCounter_T, 1) @[chiselv/src/Uart.scala 73:44]
        connect sampleClkCounter, _sampleClkCounter_T_1 @[chiselv/src/Uart.scala 73:24]
    else :
      connect sampleClk, UInt<1>(0h0) @[chiselv/src/Uart.scala 76:22]
      connect sampleClkCounter, UInt<1>(0h0) @[chiselv/src/Uart.scala 77:22]
    node _T_1 = eq(sampleClk, UInt<1>(0h1)) @[chiselv/src/Uart.scala 84:59]
    regreset txCounterValue : UInt<4>, clock, reset, UInt<4>(0h0) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    wire txCounterWrap : UInt<1> @[src/main/scala/chisel3/util/Counter.scala 117:24]
    connect txCounterWrap, UInt<1>(0h0) @[src/main/scala/chisel3/util/Counter.scala 117:24]
    when _T_1 : @[src/main/scala/chisel3/util/Counter.scala 118:16]
      node wrap_wrap = eq(txCounterValue, UInt<4>(0hf)) @[src/main/scala/chisel3/util/Counter.scala 73:24]
      node _wrap_value_T = add(txCounterValue, UInt<1>(0h1)) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      node _wrap_value_T_1 = tail(_wrap_value_T, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      connect txCounterValue, _wrap_value_T_1 @[src/main/scala/chisel3/util/Counter.scala 77:15]
      connect txCounterWrap, wrap_wrap @[src/main/scala/chisel3/util/Counter.scala 118:23]
    regreset txState : UInt<2>, clock, reset, UInt<2>(0h0) @[chiselv/src/Uart.scala 89:51]
    reg txByte : UInt<8>, clock @[chiselv/src/Uart.scala 90:47]
    reg txByteBit : UInt<3>, clock @[chiselv/src/Uart.scala 91:47]
    regreset tx : UInt<1>, clock, reset, UInt<1>(0h1) @[chiselv/src/Uart.scala 93:19]
    connect txQueue.io.deq.ready, UInt<1>(0h0) @[chiselv/src/Uart.scala 95:24]
    node _T_2 = eq(txCounterWrap, UInt<1>(0h1)) @[chiselv/src/Uart.scala 98:14]
    when _T_2 : @[chiselv/src/Uart.scala 98:23]
      node _T_3 = eq(UInt<2>(0h0), txState) @[chiselv/src/Uart.scala 99:21]
      when _T_3 : @[chiselv/src/Uart.scala 99:21]
        when txQueue.io.deq.valid : @[chiselv/src/Uart.scala 102:36]
          connect txQueue.io.deq.ready, UInt<1>(0h1) @[chiselv/src/Uart.scala 103:32]
          connect txByte, txQueue.io.deq.bits @[chiselv/src/Uart.scala 104:32]
          connect txByteBit, UInt<1>(0h0) @[chiselv/src/Uart.scala 105:32]
          connect txState, UInt<2>(0h1) @[chiselv/src/Uart.scala 106:32]
          connect tx, UInt<1>(0h0) @[chiselv/src/Uart.scala 108:14]
        else :
          connect tx, UInt<1>(0h1) @[chiselv/src/Uart.scala 110:14]
      else :
        node _T_4 = eq(UInt<2>(0h1), txState) @[chiselv/src/Uart.scala 99:21]
        when _T_4 : @[chiselv/src/Uart.scala 99:21]
          node _T_5 = eq(txByteBit, UInt<3>(0h7)) @[chiselv/src/Uart.scala 115:24]
          when _T_5 : @[chiselv/src/Uart.scala 115:33]
            connect txState, UInt<2>(0h2) @[chiselv/src/Uart.scala 116:19]
          node _tx_T = dshr(txByte, txByteBit) @[chiselv/src/Uart.scala 118:28]
          node _tx_T_1 = bits(_tx_T, 0, 0) @[chiselv/src/Uart.scala 118:28]
          connect tx, _tx_T_1 @[chiselv/src/Uart.scala 118:19]
          node _txByteBit_T = add(txByteBit, UInt<1>(0h1)) @[chiselv/src/Uart.scala 119:32]
          node _txByteBit_T_1 = tail(_txByteBit_T, 1) @[chiselv/src/Uart.scala 119:32]
          connect txByteBit, _txByteBit_T_1 @[chiselv/src/Uart.scala 119:19]
        else :
          node _T_6 = eq(UInt<2>(0h2), txState) @[chiselv/src/Uart.scala 99:21]
          when _T_6 : @[chiselv/src/Uart.scala 99:21]
            connect txState, UInt<2>(0h0) @[chiselv/src/Uart.scala 123:17]
            connect tx, UInt<1>(0h1) @[chiselv/src/Uart.scala 125:12]
    connect io.serialPort.tx, tx @[chiselv/src/Uart.scala 130:20]
    regreset rxState : UInt<3>, clock, reset, UInt<3>(0h0) @[chiselv/src/Uart.scala 135:26]
    regreset rxCounter : UInt<4>, clock, reset, UInt<4>(0h0) @[chiselv/src/Uart.scala 136:26]
    wire _rxByte_WIRE : UInt<1>[8] @[chiselv/src/Uart.scala 137:34]
    connect _rxByte_WIRE[0], UInt<1>(0h0) @[chiselv/src/Uart.scala 137:34]
    connect _rxByte_WIRE[1], UInt<1>(0h0) @[chiselv/src/Uart.scala 137:34]
    connect _rxByte_WIRE[2], UInt<1>(0h0) @[chiselv/src/Uart.scala 137:34]
    connect _rxByte_WIRE[3], UInt<1>(0h0) @[chiselv/src/Uart.scala 137:34]
    connect _rxByte_WIRE[4], UInt<1>(0h0) @[chiselv/src/Uart.scala 137:34]
    connect _rxByte_WIRE[5], UInt<1>(0h0) @[chiselv/src/Uart.scala 137:34]
    connect _rxByte_WIRE[6], UInt<1>(0h0) @[chiselv/src/Uart.scala 137:34]
    connect _rxByte_WIRE[7], UInt<1>(0h0) @[chiselv/src/Uart.scala 137:34]
    regreset rxByte : UInt<1>[8], clock, reset, _rxByte_WIRE @[chiselv/src/Uart.scala 137:26]
    regreset rxByteBit : UInt<3>, clock, reset, UInt<3>(0h0) @[chiselv/src/Uart.scala 138:26]
    connect rxQueue.io.enq.bits, UInt<1>(0h0) @[chiselv/src/Uart.scala 140:24]
    connect rxQueue.io.enq.valid, UInt<1>(0h0) @[chiselv/src/Uart.scala 141:24]
    reg rx_REG : UInt, clock @[chiselv/src/Uart.scala 144:35]
    connect rx_REG, io.serialPort.rx @[chiselv/src/Uart.scala 144:35]
    reg rx_REG_1 : UInt, clock @[chiselv/src/Uart.scala 144:27]
    connect rx_REG_1, rx_REG @[chiselv/src/Uart.scala 144:27]
    reg rx : UInt, clock @[chiselv/src/Uart.scala 144:19]
    connect rx, rx_REG_1 @[chiselv/src/Uart.scala 144:19]
    node _T_7 = eq(sampleClk, UInt<1>(0h1)) @[chiselv/src/Uart.scala 146:18]
    when _T_7 : @[chiselv/src/Uart.scala 146:27]
      node _T_8 = eq(UInt<3>(0h0), rxState) @[chiselv/src/Uart.scala 147:21]
      when _T_8 : @[chiselv/src/Uart.scala 147:21]
        node _T_9 = eq(rx, UInt<1>(0h0)) @[chiselv/src/Uart.scala 149:17]
        when _T_9 : @[chiselv/src/Uart.scala 149:26]
          connect rxState, UInt<3>(0h1) @[chiselv/src/Uart.scala 150:21]
          connect rxCounter, UInt<1>(0h1) @[chiselv/src/Uart.scala 151:21]
          connect rxByte[0], UInt<1>(0h0) @[chiselv/src/Uart.scala 152:21]
          connect rxByte[1], UInt<1>(0h0) @[chiselv/src/Uart.scala 152:21]
          connect rxByte[2], UInt<1>(0h0) @[chiselv/src/Uart.scala 152:21]
          connect rxByte[3], UInt<1>(0h0) @[chiselv/src/Uart.scala 152:21]
          connect rxByte[4], UInt<1>(0h0) @[chiselv/src/Uart.scala 152:21]
          connect rxByte[5], UInt<1>(0h0) @[chiselv/src/Uart.scala 152:21]
          connect rxByte[6], UInt<1>(0h0) @[chiselv/src/Uart.scala 152:21]
          connect rxByte[7], UInt<1>(0h0) @[chiselv/src/Uart.scala 152:21]
          connect rxByteBit, UInt<1>(0h0) @[chiselv/src/Uart.scala 153:21]
      else :
        node _T_10 = eq(UInt<3>(0h1), rxState) @[chiselv/src/Uart.scala 147:21]
        when _T_10 : @[chiselv/src/Uart.scala 147:21]
          node _rxCounter_T = add(rxCounter, UInt<1>(0h1)) @[chiselv/src/Uart.scala 158:32]
          node _rxCounter_T_1 = tail(_rxCounter_T, 1) @[chiselv/src/Uart.scala 158:32]
          connect rxCounter, _rxCounter_T_1 @[chiselv/src/Uart.scala 158:19]
          node _T_11 = eq(rxCounter, UInt<4>(0h8)) @[chiselv/src/Uart.scala 160:24]
          when _T_11 : @[chiselv/src/Uart.scala 160:49]
            connect rxCounter, UInt<1>(0h1) @[chiselv/src/Uart.scala 161:21]
            connect rxState, UInt<3>(0h2) @[chiselv/src/Uart.scala 162:21]
        else :
          node _T_12 = eq(UInt<3>(0h2), rxState) @[chiselv/src/Uart.scala 147:21]
          when _T_12 : @[chiselv/src/Uart.scala 147:21]
            node _rxCounter_T_2 = add(rxCounter, UInt<1>(0h1)) @[chiselv/src/Uart.scala 167:32]
            node _rxCounter_T_3 = tail(_rxCounter_T_2, 1) @[chiselv/src/Uart.scala 167:32]
            connect rxCounter, _rxCounter_T_3 @[chiselv/src/Uart.scala 167:19]
            node _T_13 = eq(rxCounter, UInt<1>(0h0)) @[chiselv/src/Uart.scala 168:24]
            when _T_13 : @[chiselv/src/Uart.scala 168:33]
              node _T_14 = eq(rxByteBit, UInt<3>(0h7)) @[chiselv/src/Uart.scala 169:26]
              when _T_14 : @[chiselv/src/Uart.scala 169:35]
                connect rxState, UInt<3>(0h3) @[chiselv/src/Uart.scala 170:21]
              connect rxByte[rxByteBit], rx @[chiselv/src/Uart.scala 172:29]
              node _rxByteBit_T = add(rxByteBit, UInt<1>(0h1)) @[chiselv/src/Uart.scala 173:42]
              node _rxByteBit_T_1 = tail(_rxByteBit_T, 1) @[chiselv/src/Uart.scala 173:42]
              connect rxByteBit, _rxByteBit_T_1 @[chiselv/src/Uart.scala 173:29]
          else :
            node _T_15 = eq(UInt<3>(0h3), rxState) @[chiselv/src/Uart.scala 147:21]
            when _T_15 : @[chiselv/src/Uart.scala 147:21]
              node _rxCounter_T_4 = add(rxCounter, UInt<1>(0h1)) @[chiselv/src/Uart.scala 178:32]
              node _rxCounter_T_5 = tail(_rxCounter_T_4, 1) @[chiselv/src/Uart.scala 178:32]
              connect rxCounter, _rxCounter_T_5 @[chiselv/src/Uart.scala 178:19]
              node _T_16 = eq(rxCounter, UInt<1>(0h0)) @[chiselv/src/Uart.scala 179:24]
              when _T_16 : @[chiselv/src/Uart.scala 179:33]
                node _T_17 = eq(rx, UInt<1>(0h1)) @[chiselv/src/Uart.scala 181:19]
                when _T_17 : @[chiselv/src/Uart.scala 181:28]
                  node _rxQueue_io_enq_bits_T = cat(rxByte[7], rxByte[6]) @[chiselv/src/Uart.scala 183:61]
                  node _rxQueue_io_enq_bits_T_1 = cat(_rxQueue_io_enq_bits_T, rxByte[5]) @[chiselv/src/Uart.scala 183:61]
                  node _rxQueue_io_enq_bits_T_2 = cat(_rxQueue_io_enq_bits_T_1, rxByte[4]) @[chiselv/src/Uart.scala 183:61]
                  node _rxQueue_io_enq_bits_T_3 = cat(_rxQueue_io_enq_bits_T_2, rxByte[3]) @[chiselv/src/Uart.scala 183:61]
                  node _rxQueue_io_enq_bits_T_4 = cat(_rxQueue_io_enq_bits_T_3, rxByte[2]) @[chiselv/src/Uart.scala 183:61]
                  node _rxQueue_io_enq_bits_T_5 = cat(_rxQueue_io_enq_bits_T_4, rxByte[1]) @[chiselv/src/Uart.scala 183:61]
                  node _rxQueue_io_enq_bits_T_6 = cat(_rxQueue_io_enq_bits_T_5, rxByte[0]) @[chiselv/src/Uart.scala 183:61]
                  connect rxQueue.io.enq.bits, _rxQueue_io_enq_bits_T_6 @[chiselv/src/Uart.scala 183:34]
                  connect rxQueue.io.enq.valid, UInt<1>(0h1) @[chiselv/src/Uart.scala 184:34]
                  connect rxState, UInt<3>(0h0) @[chiselv/src/Uart.scala 185:34]
                else :
                  connect rxState, UInt<3>(0h4) @[chiselv/src/Uart.scala 188:21]
            else :
              node _T_18 = eq(UInt<3>(0h4), rxState) @[chiselv/src/Uart.scala 147:21]
              when _T_18 : @[chiselv/src/Uart.scala 147:21]
                node _rxCounter_T_6 = add(rxCounter, UInt<1>(0h1)) @[chiselv/src/Uart.scala 199:32]
                node _rxCounter_T_7 = tail(_rxCounter_T_6, 1) @[chiselv/src/Uart.scala 199:32]
                connect rxCounter, _rxCounter_T_7 @[chiselv/src/Uart.scala 199:19]
                node _T_19 = eq(rxCounter, UInt<1>(0h0)) @[chiselv/src/Uart.scala 200:24]
                when _T_19 : @[chiselv/src/Uart.scala 200:33]
                  connect rxState, UInt<3>(0h5) @[chiselv/src/Uart.scala 201:19]
              else :
                node _T_20 = eq(UInt<3>(0h5), rxState) @[chiselv/src/Uart.scala 147:21]
                when _T_20 : @[chiselv/src/Uart.scala 147:21]
                  node _rxCounter_T_8 = add(rxCounter, UInt<1>(0h1)) @[chiselv/src/Uart.scala 207:32]
                  node _rxCounter_T_9 = tail(_rxCounter_T_8, 1) @[chiselv/src/Uart.scala 207:32]
                  connect rxCounter, _rxCounter_T_9 @[chiselv/src/Uart.scala 207:19]
                  node _T_21 = eq(rxCounter, UInt<1>(0h0)) @[chiselv/src/Uart.scala 208:24]
                  when _T_21 : @[chiselv/src/Uart.scala 208:33]
                    connect rxState, UInt<3>(0h0) @[chiselv/src/Uart.scala 209:19]
    connect io.dataPort.rxQueue.bits, rxQueue.io.deq.bits @[chiselv/src/Uart.scala 215:18]
    connect io.dataPort.rxQueue.valid, rxQueue.io.deq.valid @[chiselv/src/Uart.scala 215:18]
    connect rxQueue.io.deq.ready, io.dataPort.rxQueue.ready @[chiselv/src/Uart.scala 215:18]
    connect txQueue.io.enq, io.dataPort.txQueue @[chiselv/src/Uart.scala 216:18]

  module Syscon : @[chiselv/src/Syscon.scala 11:7]
    input clock : Clock @[chiselv/src/Syscon.scala 11:7]
    input reset : Reset @[chiselv/src/Syscon.scala 11:7]
    output io : { flip Address : UInt<12>, DataOut : UInt<32>} @[chiselv/src/Syscon.scala 19:14]

    wire dataOut : UInt<32> @[chiselv/src/Syscon.scala 21:28]
    connect dataOut, UInt<32>(0h0) @[chiselv/src/Syscon.scala 21:28]
    node _T = eq(UInt<1>(0h0), io.Address) @[chiselv/src/Syscon.scala 23:22]
    when _T : @[chiselv/src/Syscon.scala 23:22]
      connect dataOut, UInt<32>(0hbaadcafe) @[chiselv/src/Syscon.scala 24:24]
    else :
      node _T_1 = eq(UInt<4>(0h8), io.Address) @[chiselv/src/Syscon.scala 23:22]
      when _T_1 : @[chiselv/src/Syscon.scala 23:22]
        connect dataOut, UInt<20>(0hf4240) @[chiselv/src/Syscon.scala 26:24]
      else :
        node _T_2 = eq(UInt<5>(0h10), io.Address) @[chiselv/src/Syscon.scala 23:22]
        when _T_2 : @[chiselv/src/Syscon.scala 23:22]
          connect dataOut, UInt<1>(0h1) @[chiselv/src/Syscon.scala 28:25]
        else :
          node _T_3 = eq(UInt<5>(0h18), io.Address) @[chiselv/src/Syscon.scala 23:22]
          when _T_3 : @[chiselv/src/Syscon.scala 23:22]
            connect dataOut, UInt<1>(0h1) @[chiselv/src/Syscon.scala 30:25]
          else :
            node _T_4 = eq(UInt<6>(0h20), io.Address) @[chiselv/src/Syscon.scala 23:22]
            when _T_4 : @[chiselv/src/Syscon.scala 23:22]
              connect dataOut, UInt<1>(0h0) @[chiselv/src/Syscon.scala 32:25]
            else :
              node _T_5 = eq(UInt<6>(0h24), io.Address) @[chiselv/src/Syscon.scala 23:22]
              when _T_5 : @[chiselv/src/Syscon.scala 23:22]
                connect dataOut, UInt<1>(0h1) @[chiselv/src/Syscon.scala 34:25]
              else :
                node _T_6 = eq(UInt<6>(0h28), io.Address) @[chiselv/src/Syscon.scala 23:22]
                when _T_6 : @[chiselv/src/Syscon.scala 23:22]
                  connect dataOut, UInt<4>(0h8) @[chiselv/src/Syscon.scala 36:25]
                else :
                  node _T_7 = eq(UInt<6>(0h2c), io.Address) @[chiselv/src/Syscon.scala 23:22]
                  when _T_7 : @[chiselv/src/Syscon.scala 23:22]
                    connect dataOut, UInt<1>(0h0) @[chiselv/src/Syscon.scala 38:25]
                  else :
                    node _T_8 = eq(UInt<6>(0h30), io.Address) @[chiselv/src/Syscon.scala 23:22]
                    when _T_8 : @[chiselv/src/Syscon.scala 23:22]
                      connect dataOut, UInt<17>(0h10000) @[chiselv/src/Syscon.scala 40:25]
                    else :
                      node _T_9 = eq(UInt<6>(0h34), io.Address) @[chiselv/src/Syscon.scala 23:22]
                      when _T_9 : @[chiselv/src/Syscon.scala 23:22]
                        connect dataOut, UInt<17>(0h10000) @[chiselv/src/Syscon.scala 42:25]
    connect io.DataOut, dataOut @[chiselv/src/Syscon.scala 45:14]

  module RegisterBank : @[chiselv/src/RegisterBank.scala 17:7]
    input clock : Clock @[chiselv/src/RegisterBank.scala 17:7]
    input reset : Reset @[chiselv/src/RegisterBank.scala 17:7]
    output io : { rs1 : UInt<32>, rs2 : UInt<32>, flip rs1_addr : UInt<5>, flip rs2_addr : UInt<5>, flip regwr_addr : UInt<5>, flip regwr_data : UInt<32>, flip writeEnable : UInt<1>, flip stall : UInt<1>} @[chiselv/src/RegisterBank.scala 18:14]

    wire _regs_WIRE : UInt<32>[32] @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[0], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[1], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[2], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[3], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[4], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[5], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[6], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[7], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[8], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[9], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[10], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[11], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[12], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[13], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[14], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[15], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[16], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[17], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[18], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[19], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[20], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[21], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[22], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[23], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[24], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[25], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[26], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[27], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[28], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[29], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[30], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    connect _regs_WIRE[31], UInt<32>(0h0) @[chiselv/src/RegisterBank.scala 20:29]
    regreset regs : UInt<32>[32], clock, reset, _regs_WIRE @[chiselv/src/RegisterBank.scala 20:21]
    connect regs[0], UInt<1>(0h0) @[chiselv/src/RegisterBank.scala 21:11]
    connect io.rs1, regs[io.rs1_addr] @[chiselv/src/RegisterBank.scala 23:10]
    connect io.rs2, regs[io.rs2_addr] @[chiselv/src/RegisterBank.scala 24:10]
    node _T = neq(io.regwr_addr, UInt<1>(0h0)) @[chiselv/src/RegisterBank.scala 25:40]
    node _T_1 = and(io.writeEnable, _T) @[chiselv/src/RegisterBank.scala 25:23]
    node _T_2 = eq(io.stall, UInt<1>(0h0)) @[chiselv/src/RegisterBank.scala 25:51]
    node _T_3 = and(_T_1, _T_2) @[chiselv/src/RegisterBank.scala 25:48]
    when _T_3 : @[chiselv/src/RegisterBank.scala 25:62]
      connect regs[io.regwr_addr], io.regwr_data @[chiselv/src/RegisterBank.scala 26:25]


  module ProgramCounter : @[chiselv/src/ProgramCounter.scala 13:7]
    input clock : Clock @[chiselv/src/ProgramCounter.scala 13:7]
    input reset : Reset @[chiselv/src/ProgramCounter.scala 13:7]
    output io : { flip dataIn : UInt<32>, PC : UInt<32>, PC4 : UInt<32>, flip writeEnable : UInt<1>, flip writeAdd : UInt<1>} @[chiselv/src/ProgramCounter.scala 14:14]

    regreset pc : UInt<32>, clock, reset, UInt<32>(0h0) @[chiselv/src/ProgramCounter.scala 16:19]
    when io.writeEnable : @[chiselv/src/ProgramCounter.scala 17:24]
      node _pc_T = asSInt(pc) @[chiselv/src/ProgramCounter.scala 18:32]
      node _pc_T_1 = asSInt(io.dataIn) @[chiselv/src/ProgramCounter.scala 18:51]
      node _pc_T_2 = add(_pc_T, _pc_T_1) @[chiselv/src/ProgramCounter.scala 18:39]
      node _pc_T_3 = tail(_pc_T_2, 1) @[chiselv/src/ProgramCounter.scala 18:39]
      node _pc_T_4 = asSInt(_pc_T_3) @[chiselv/src/ProgramCounter.scala 18:39]
      node _pc_T_5 = asUInt(_pc_T_4) @[chiselv/src/ProgramCounter.scala 18:59]
      node _pc_T_6 = mux(io.writeAdd, _pc_T_5, io.dataIn) @[chiselv/src/ProgramCounter.scala 18:14]
      connect pc, _pc_T_6 @[chiselv/src/ProgramCounter.scala 18:8]
    node _io_PC4_T = add(pc, UInt<3>(0h4)) @[chiselv/src/ProgramCounter.scala 20:16]
    node _io_PC4_T_1 = tail(_io_PC4_T, 1) @[chiselv/src/ProgramCounter.scala 20:16]
    connect io.PC4, _io_PC4_T_1 @[chiselv/src/ProgramCounter.scala 20:10]
    connect io.PC, pc @[chiselv/src/ProgramCounter.scala 21:10]

  module ALU : @[chiselv/src/ALU.scala 13:7]
    input clock : Clock @[chiselv/src/ALU.scala 13:7]
    input reset : Reset @[chiselv/src/ALU.scala 13:7]
    output io : { flip inst : UInt<6>, flip a : UInt<32>, flip b : UInt<32>, x : UInt<32>} @[chiselv/src/ALU.scala 14:15]

    wire out : UInt<32> @[chiselv/src/ALU.scala 15:24]
    connect out, UInt<32>(0h0) @[chiselv/src/ALU.scala 15:24]
    node _T = asUInt(UInt<1>(0h1)) @[chiselv/src/ALU.scala 20:19]
    node _T_1 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
    node _T_2 = eq(_T, _T_1) @[chiselv/src/ALU.scala 20:19]
    node _T_3 = asUInt(UInt<2>(0h2)) @[chiselv/src/ALU.scala 20:19]
    node _T_4 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
    node _T_5 = eq(_T_3, _T_4) @[chiselv/src/ALU.scala 20:19]
    node _T_6 = or(_T_2, _T_5) @[chiselv/src/ALU.scala 20:19]
    when _T_6 : @[chiselv/src/ALU.scala 20:19]
      node _out_T = add(io.a, io.b) @[chiselv/src/ALU.scala 22:31]
      node _out_T_1 = tail(_out_T, 1) @[chiselv/src/ALU.scala 22:31]
      connect out, _out_T_1 @[chiselv/src/ALU.scala 22:23]
    else :
      node _T_7 = asUInt(UInt<2>(0h3)) @[chiselv/src/ALU.scala 20:19]
      node _T_8 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
      node _T_9 = eq(_T_7, _T_8) @[chiselv/src/ALU.scala 20:19]
      when _T_9 : @[chiselv/src/ALU.scala 20:19]
        node _out_T_2 = sub(io.a, io.b) @[chiselv/src/ALU.scala 23:31]
        node _out_T_3 = tail(_out_T_2, 1) @[chiselv/src/ALU.scala 23:31]
        connect out, _out_T_3 @[chiselv/src/ALU.scala 23:23]
      else :
        node _T_10 = asUInt(UInt<4>(0ha)) @[chiselv/src/ALU.scala 20:19]
        node _T_11 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
        node _T_12 = eq(_T_10, _T_11) @[chiselv/src/ALU.scala 20:19]
        node _T_13 = asUInt(UInt<4>(0hb)) @[chiselv/src/ALU.scala 20:19]
        node _T_14 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
        node _T_15 = eq(_T_13, _T_14) @[chiselv/src/ALU.scala 20:19]
        node _T_16 = or(_T_12, _T_15) @[chiselv/src/ALU.scala 20:19]
        when _T_16 : @[chiselv/src/ALU.scala 20:19]
          node _out_T_4 = asSInt(io.a) @[chiselv/src/ALU.scala 25:32]
          node _out_T_5 = bits(io.b, 4, 0) @[chiselv/src/ALU.scala 25:46]
          node _out_T_6 = dshr(_out_T_4, _out_T_5) @[chiselv/src/ALU.scala 25:39]
          node _out_T_7 = asUInt(_out_T_6) @[chiselv/src/ALU.scala 25:58]
          connect out, _out_T_7 @[chiselv/src/ALU.scala 25:23]
        else :
          node _T_17 = asUInt(UInt<4>(0h8)) @[chiselv/src/ALU.scala 20:19]
          node _T_18 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
          node _T_19 = eq(_T_17, _T_18) @[chiselv/src/ALU.scala 20:19]
          node _T_20 = asUInt(UInt<4>(0h9)) @[chiselv/src/ALU.scala 20:19]
          node _T_21 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
          node _T_22 = eq(_T_20, _T_21) @[chiselv/src/ALU.scala 20:19]
          node _T_23 = or(_T_19, _T_22) @[chiselv/src/ALU.scala 20:19]
          when _T_23 : @[chiselv/src/ALU.scala 20:19]
            node _out_T_8 = bits(io.b, 4, 0) @[chiselv/src/ALU.scala 26:38]
            node _out_T_9 = dshr(io.a, _out_T_8) @[chiselv/src/ALU.scala 26:31]
            connect out, _out_T_9 @[chiselv/src/ALU.scala 26:23]
          else :
            node _T_24 = asUInt(UInt<3>(0h6)) @[chiselv/src/ALU.scala 20:19]
            node _T_25 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
            node _T_26 = eq(_T_24, _T_25) @[chiselv/src/ALU.scala 20:19]
            node _T_27 = asUInt(UInt<3>(0h7)) @[chiselv/src/ALU.scala 20:19]
            node _T_28 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
            node _T_29 = eq(_T_27, _T_28) @[chiselv/src/ALU.scala 20:19]
            node _T_30 = or(_T_26, _T_29) @[chiselv/src/ALU.scala 20:19]
            when _T_30 : @[chiselv/src/ALU.scala 20:19]
              node _out_T_10 = bits(io.b, 4, 0) @[chiselv/src/ALU.scala 27:38]
              node _out_T_11 = dshl(io.a, _out_T_10) @[chiselv/src/ALU.scala 27:31]
              connect out, _out_T_11 @[chiselv/src/ALU.scala 27:23]
            else :
              node _T_31 = asUInt(UInt<4>(0hc)) @[chiselv/src/ALU.scala 20:19]
              node _T_32 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
              node _T_33 = eq(_T_31, _T_32) @[chiselv/src/ALU.scala 20:19]
              node _T_34 = asUInt(UInt<4>(0hd)) @[chiselv/src/ALU.scala 20:19]
              node _T_35 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
              node _T_36 = eq(_T_34, _T_35) @[chiselv/src/ALU.scala 20:19]
              node _T_37 = or(_T_33, _T_36) @[chiselv/src/ALU.scala 20:19]
              when _T_37 : @[chiselv/src/ALU.scala 20:19]
                node _out_T_12 = and(io.a, io.b) @[chiselv/src/ALU.scala 29:31]
                connect out, _out_T_12 @[chiselv/src/ALU.scala 29:23]
              else :
                node _T_38 = asUInt(UInt<4>(0he)) @[chiselv/src/ALU.scala 20:19]
                node _T_39 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
                node _T_40 = eq(_T_38, _T_39) @[chiselv/src/ALU.scala 20:19]
                node _T_41 = asUInt(UInt<4>(0hf)) @[chiselv/src/ALU.scala 20:19]
                node _T_42 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
                node _T_43 = eq(_T_41, _T_42) @[chiselv/src/ALU.scala 20:19]
                node _T_44 = or(_T_40, _T_43) @[chiselv/src/ALU.scala 20:19]
                when _T_44 : @[chiselv/src/ALU.scala 20:19]
                  node _out_T_13 = or(io.a, io.b) @[chiselv/src/ALU.scala 30:31]
                  connect out, _out_T_13 @[chiselv/src/ALU.scala 30:23]
                else :
                  node _T_45 = asUInt(UInt<5>(0h10)) @[chiselv/src/ALU.scala 20:19]
                  node _T_46 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
                  node _T_47 = eq(_T_45, _T_46) @[chiselv/src/ALU.scala 20:19]
                  node _T_48 = asUInt(UInt<5>(0h11)) @[chiselv/src/ALU.scala 20:19]
                  node _T_49 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
                  node _T_50 = eq(_T_48, _T_49) @[chiselv/src/ALU.scala 20:19]
                  node _T_51 = or(_T_47, _T_50) @[chiselv/src/ALU.scala 20:19]
                  when _T_51 : @[chiselv/src/ALU.scala 20:19]
                    node _out_T_14 = xor(io.a, io.b) @[chiselv/src/ALU.scala 31:31]
                    connect out, _out_T_14 @[chiselv/src/ALU.scala 31:23]
                  else :
                    node _T_52 = asUInt(UInt<5>(0h12)) @[chiselv/src/ALU.scala 20:19]
                    node _T_53 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
                    node _T_54 = eq(_T_52, _T_53) @[chiselv/src/ALU.scala 20:19]
                    node _T_55 = asUInt(UInt<5>(0h13)) @[chiselv/src/ALU.scala 20:19]
                    node _T_56 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
                    node _T_57 = eq(_T_55, _T_56) @[chiselv/src/ALU.scala 20:19]
                    node _T_58 = or(_T_54, _T_57) @[chiselv/src/ALU.scala 20:19]
                    when _T_58 : @[chiselv/src/ALU.scala 20:19]
                      node _out_T_15 = asSInt(io.a) @[chiselv/src/ALU.scala 33:37]
                      node _out_T_16 = asSInt(io.b) @[chiselv/src/ALU.scala 33:51]
                      node _out_T_17 = lt(_out_T_15, _out_T_16) @[chiselv/src/ALU.scala 33:44]
                      node _out_T_18 = mux(_out_T_17, UInt<1>(0h1), UInt<1>(0h0)) @[chiselv/src/ALU.scala 33:31]
                      connect out, _out_T_18 @[chiselv/src/ALU.scala 33:25]
                    else :
                      node _T_59 = asUInt(UInt<5>(0h14)) @[chiselv/src/ALU.scala 20:19]
                      node _T_60 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
                      node _T_61 = eq(_T_59, _T_60) @[chiselv/src/ALU.scala 20:19]
                      node _T_62 = asUInt(UInt<5>(0h15)) @[chiselv/src/ALU.scala 20:19]
                      node _T_63 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
                      node _T_64 = eq(_T_62, _T_63) @[chiselv/src/ALU.scala 20:19]
                      node _T_65 = or(_T_61, _T_64) @[chiselv/src/ALU.scala 20:19]
                      when _T_65 : @[chiselv/src/ALU.scala 20:19]
                        node _out_T_19 = lt(io.a, io.b) @[chiselv/src/ALU.scala 34:37]
                        node _out_T_20 = mux(_out_T_19, UInt<1>(0h1), UInt<1>(0h0)) @[chiselv/src/ALU.scala 34:31]
                        connect out, _out_T_20 @[chiselv/src/ALU.scala 34:25]
                      else :
                        node _T_66 = asUInt(UInt<6>(0h30)) @[chiselv/src/ALU.scala 20:19]
                        node _T_67 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
                        node _T_68 = eq(_T_66, _T_67) @[chiselv/src/ALU.scala 20:19]
                        when _T_68 : @[chiselv/src/ALU.scala 20:19]
                          node _out_T_21 = eq(io.a, io.b) @[chiselv/src/ALU.scala 36:30]
                          node _out_T_22 = mux(_out_T_21, UInt<1>(0h1), UInt<1>(0h0)) @[chiselv/src/ALU.scala 36:24]
                          connect out, _out_T_22 @[chiselv/src/ALU.scala 36:18]
                        else :
                          node _T_69 = asUInt(UInt<6>(0h31)) @[chiselv/src/ALU.scala 20:19]
                          node _T_70 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
                          node _T_71 = eq(_T_69, _T_70) @[chiselv/src/ALU.scala 20:19]
                          when _T_71 : @[chiselv/src/ALU.scala 20:19]
                            node _out_T_23 = neq(io.a, io.b) @[chiselv/src/ALU.scala 37:30]
                            node _out_T_24 = mux(_out_T_23, UInt<1>(0h1), UInt<1>(0h0)) @[chiselv/src/ALU.scala 37:24]
                            connect out, _out_T_24 @[chiselv/src/ALU.scala 37:18]
                          else :
                            node _T_72 = asUInt(UInt<6>(0h32)) @[chiselv/src/ALU.scala 20:19]
                            node _T_73 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
                            node _T_74 = eq(_T_72, _T_73) @[chiselv/src/ALU.scala 20:19]
                            when _T_74 : @[chiselv/src/ALU.scala 20:19]
                              node _out_T_25 = asSInt(io.a) @[chiselv/src/ALU.scala 38:30]
                              node _out_T_26 = asSInt(io.b) @[chiselv/src/ALU.scala 38:45]
                              node _out_T_27 = geq(_out_T_25, _out_T_26) @[chiselv/src/ALU.scala 38:37]
                              node _out_T_28 = mux(_out_T_27, UInt<1>(0h1), UInt<1>(0h0)) @[chiselv/src/ALU.scala 38:24]
                              connect out, _out_T_28 @[chiselv/src/ALU.scala 38:18]
                            else :
                              node _T_75 = asUInt(UInt<6>(0h33)) @[chiselv/src/ALU.scala 20:19]
                              node _T_76 = asUInt(io.inst) @[chiselv/src/ALU.scala 20:19]
                              node _T_77 = eq(_T_75, _T_76) @[chiselv/src/ALU.scala 20:19]
                              when _T_77 : @[chiselv/src/ALU.scala 20:19]
                                node _out_T_29 = geq(io.a, io.b) @[chiselv/src/ALU.scala 39:30]
                                node _out_T_30 = mux(_out_T_29, UInt<1>(0h1), UInt<1>(0h0)) @[chiselv/src/ALU.scala 39:24]
                                connect out, _out_T_30 @[chiselv/src/ALU.scala 39:18]
    connect io.x, out @[chiselv/src/ALU.scala 42:8]

  module Decoder : @[chiselv/src/Decoder.scala 23:7]
    input clock : Clock @[chiselv/src/Decoder.scala 23:7]
    input reset : Reset @[chiselv/src/Decoder.scala 23:7]
    output io : { flip op : UInt<32>, inst : UInt<6>, rd : UInt<5>, rs1 : UInt<5>, rs2 : UInt<5>, imm : SInt<32>, toALU : UInt<1>, branch : UInt<1>, use_imm : UInt<1>, jump : UInt<1>, is_load : UInt<1>, is_store : UInt<1>} @[chiselv/src/Decoder.scala 24:14]

    node _signals_T = and(io.op, UInt<32>(0hfe00707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_1 = eq(UInt<6>(0h33), _signals_T) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_2 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_3 = eq(UInt<5>(0h13), _signals_T_2) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_4 = and(io.op, UInt<32>(0hfe00707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_5 = eq(UInt<31>(0h40000033), _signals_T_4) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_6 = and(io.op, UInt<7>(0h7f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_7 = eq(UInt<6>(0h37), _signals_T_6) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_8 = and(io.op, UInt<7>(0h7f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_9 = eq(UInt<5>(0h17), _signals_T_8) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_10 = and(io.op, UInt<32>(0hfe00707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_11 = eq(UInt<13>(0h1033), _signals_T_10) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_12 = and(io.op, UInt<32>(0hfe00707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_13 = eq(UInt<13>(0h1013), _signals_T_12) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_14 = and(io.op, UInt<32>(0hfe00707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_15 = eq(UInt<15>(0h5033), _signals_T_14) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_16 = and(io.op, UInt<32>(0hfe00707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_17 = eq(UInt<15>(0h5013), _signals_T_16) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_18 = and(io.op, UInt<32>(0hfe00707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_19 = eq(UInt<31>(0h40005033), _signals_T_18) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_20 = and(io.op, UInt<32>(0hfe00707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_21 = eq(UInt<31>(0h40005013), _signals_T_20) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_22 = and(io.op, UInt<32>(0hfe00707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_23 = eq(UInt<15>(0h4033), _signals_T_22) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_24 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_25 = eq(UInt<15>(0h4013), _signals_T_24) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_26 = and(io.op, UInt<32>(0hfe00707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_27 = eq(UInt<15>(0h6033), _signals_T_26) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_28 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_29 = eq(UInt<15>(0h6013), _signals_T_28) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_30 = and(io.op, UInt<32>(0hfe00707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_31 = eq(UInt<15>(0h7033), _signals_T_30) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_32 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_33 = eq(UInt<15>(0h7013), _signals_T_32) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_34 = and(io.op, UInt<32>(0hfe00707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_35 = eq(UInt<14>(0h2033), _signals_T_34) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_36 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_37 = eq(UInt<14>(0h2013), _signals_T_36) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_38 = and(io.op, UInt<32>(0hfe00707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_39 = eq(UInt<14>(0h3033), _signals_T_38) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_40 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_41 = eq(UInt<14>(0h3013), _signals_T_40) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_42 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_43 = eq(UInt<7>(0h63), _signals_T_42) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_44 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_45 = eq(UInt<13>(0h1063), _signals_T_44) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_46 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_47 = eq(UInt<15>(0h4063), _signals_T_46) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_48 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_49 = eq(UInt<15>(0h5063), _signals_T_48) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_50 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_51 = eq(UInt<15>(0h6063), _signals_T_50) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_52 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_53 = eq(UInt<15>(0h7063), _signals_T_52) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_54 = and(io.op, UInt<7>(0h7f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_55 = eq(UInt<7>(0h6f), _signals_T_54) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_56 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_57 = eq(UInt<7>(0h67), _signals_T_56) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_58 = and(io.op, UInt<32>(0hf00fffff)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_59 = eq(UInt<4>(0hf), _signals_T_58) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_60 = and(io.op, UInt<32>(0hffffffff)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_61 = eq(UInt<10>(0h20f), _signals_T_60) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_62 = and(io.op, UInt<32>(0hffffffff)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_63 = eq(UInt<7>(0h73), _signals_T_62) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_64 = and(io.op, UInt<32>(0hffffffff)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_65 = eq(UInt<21>(0h100073), _signals_T_64) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_66 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_67 = eq(UInt<13>(0h1073), _signals_T_66) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_68 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_69 = eq(UInt<14>(0h2073), _signals_T_68) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_70 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_71 = eq(UInt<14>(0h3073), _signals_T_70) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_72 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_73 = eq(UInt<15>(0h5073), _signals_T_72) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_74 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_75 = eq(UInt<15>(0h6073), _signals_T_74) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_76 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_77 = eq(UInt<15>(0h7073), _signals_T_76) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_78 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_79 = eq(UInt<2>(0h3), _signals_T_78) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_80 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_81 = eq(UInt<13>(0h1003), _signals_T_80) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_82 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_83 = eq(UInt<15>(0h4003), _signals_T_82) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_84 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_85 = eq(UInt<15>(0h5003), _signals_T_84) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_86 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_87 = eq(UInt<14>(0h2003), _signals_T_86) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_88 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_89 = eq(UInt<6>(0h23), _signals_T_88) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_90 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_91 = eq(UInt<13>(0h1023), _signals_T_90) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_92 = and(io.op, UInt<15>(0h707f)) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_93 = eq(UInt<14>(0h2023), _signals_T_92) @[src/main/scala/chisel3/util/Lookup.scala 31:38]
    node _signals_T_94 = mux(_signals_T_93, UInt<2>(0h3), UInt<1>(0h0)) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_95 = mux(_signals_T_91, UInt<2>(0h3), _signals_T_94) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_96 = mux(_signals_T_89, UInt<2>(0h3), _signals_T_95) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_97 = mux(_signals_T_87, UInt<2>(0h2), _signals_T_96) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_98 = mux(_signals_T_85, UInt<2>(0h2), _signals_T_97) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_99 = mux(_signals_T_83, UInt<2>(0h2), _signals_T_98) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_100 = mux(_signals_T_81, UInt<2>(0h2), _signals_T_99) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_101 = mux(_signals_T_79, UInt<2>(0h2), _signals_T_100) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_102 = mux(_signals_T_77, UInt<2>(0h2), _signals_T_101) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_103 = mux(_signals_T_75, UInt<2>(0h2), _signals_T_102) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_104 = mux(_signals_T_73, UInt<2>(0h2), _signals_T_103) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_105 = mux(_signals_T_71, UInt<2>(0h2), _signals_T_104) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_106 = mux(_signals_T_69, UInt<2>(0h2), _signals_T_105) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_107 = mux(_signals_T_67, UInt<2>(0h2), _signals_T_106) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_108 = mux(_signals_T_65, UInt<2>(0h2), _signals_T_107) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_109 = mux(_signals_T_63, UInt<2>(0h2), _signals_T_108) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_110 = mux(_signals_T_61, UInt<2>(0h2), _signals_T_109) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_111 = mux(_signals_T_59, UInt<2>(0h2), _signals_T_110) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_112 = mux(_signals_T_57, UInt<2>(0h2), _signals_T_111) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_113 = mux(_signals_T_55, UInt<3>(0h6), _signals_T_112) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_114 = mux(_signals_T_53, UInt<3>(0h4), _signals_T_113) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_115 = mux(_signals_T_51, UInt<3>(0h4), _signals_T_114) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_116 = mux(_signals_T_49, UInt<3>(0h4), _signals_T_115) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_117 = mux(_signals_T_47, UInt<3>(0h4), _signals_T_116) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_118 = mux(_signals_T_45, UInt<3>(0h4), _signals_T_117) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_119 = mux(_signals_T_43, UInt<3>(0h4), _signals_T_118) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_120 = mux(_signals_T_41, UInt<2>(0h2), _signals_T_119) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_121 = mux(_signals_T_39, UInt<1>(0h1), _signals_T_120) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_122 = mux(_signals_T_37, UInt<2>(0h2), _signals_T_121) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_123 = mux(_signals_T_35, UInt<1>(0h1), _signals_T_122) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_124 = mux(_signals_T_33, UInt<2>(0h2), _signals_T_123) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_125 = mux(_signals_T_31, UInt<1>(0h1), _signals_T_124) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_126 = mux(_signals_T_29, UInt<2>(0h2), _signals_T_125) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_127 = mux(_signals_T_27, UInt<1>(0h1), _signals_T_126) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_128 = mux(_signals_T_25, UInt<2>(0h2), _signals_T_127) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_129 = mux(_signals_T_23, UInt<1>(0h1), _signals_T_128) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_130 = mux(_signals_T_21, UInt<2>(0h2), _signals_T_129) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_131 = mux(_signals_T_19, UInt<1>(0h1), _signals_T_130) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_132 = mux(_signals_T_17, UInt<2>(0h2), _signals_T_131) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_133 = mux(_signals_T_15, UInt<1>(0h1), _signals_T_132) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_134 = mux(_signals_T_13, UInt<2>(0h2), _signals_T_133) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_135 = mux(_signals_T_11, UInt<1>(0h1), _signals_T_134) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_136 = mux(_signals_T_9, UInt<3>(0h5), _signals_T_135) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_137 = mux(_signals_T_7, UInt<3>(0h5), _signals_T_136) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_138 = mux(_signals_T_5, UInt<1>(0h1), _signals_T_137) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_139 = mux(_signals_T_3, UInt<2>(0h2), _signals_T_138) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node signals_0 = mux(_signals_T_1, UInt<1>(0h1), _signals_T_139) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_140 = mux(_signals_T_93, UInt<6>(0h2f), UInt<1>(0h0)) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_141 = mux(_signals_T_91, UInt<6>(0h2e), _signals_T_140) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_142 = mux(_signals_T_89, UInt<6>(0h2d), _signals_T_141) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_143 = mux(_signals_T_87, UInt<6>(0h2c), _signals_T_142) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_144 = mux(_signals_T_85, UInt<6>(0h2b), _signals_T_143) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_145 = mux(_signals_T_83, UInt<6>(0h2a), _signals_T_144) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_146 = mux(_signals_T_81, UInt<6>(0h29), _signals_T_145) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_147 = mux(_signals_T_79, UInt<6>(0h28), _signals_T_146) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_148 = mux(_signals_T_77, UInt<6>(0h27), _signals_T_147) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_149 = mux(_signals_T_75, UInt<6>(0h26), _signals_T_148) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_150 = mux(_signals_T_73, UInt<6>(0h25), _signals_T_149) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_151 = mux(_signals_T_71, UInt<6>(0h24), _signals_T_150) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_152 = mux(_signals_T_69, UInt<6>(0h23), _signals_T_151) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_153 = mux(_signals_T_67, UInt<6>(0h22), _signals_T_152) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_154 = mux(_signals_T_65, UInt<6>(0h21), _signals_T_153) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_155 = mux(_signals_T_63, UInt<6>(0h20), _signals_T_154) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_156 = mux(_signals_T_61, UInt<5>(0h1f), _signals_T_155) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_157 = mux(_signals_T_59, UInt<5>(0h1e), _signals_T_156) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_158 = mux(_signals_T_57, UInt<5>(0h1d), _signals_T_157) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_159 = mux(_signals_T_55, UInt<5>(0h1c), _signals_T_158) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_160 = mux(_signals_T_53, UInt<5>(0h1b), _signals_T_159) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_161 = mux(_signals_T_51, UInt<5>(0h1a), _signals_T_160) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_162 = mux(_signals_T_49, UInt<5>(0h19), _signals_T_161) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_163 = mux(_signals_T_47, UInt<5>(0h18), _signals_T_162) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_164 = mux(_signals_T_45, UInt<5>(0h17), _signals_T_163) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_165 = mux(_signals_T_43, UInt<5>(0h16), _signals_T_164) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_166 = mux(_signals_T_41, UInt<5>(0h15), _signals_T_165) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_167 = mux(_signals_T_39, UInt<5>(0h14), _signals_T_166) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_168 = mux(_signals_T_37, UInt<5>(0h13), _signals_T_167) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_169 = mux(_signals_T_35, UInt<5>(0h12), _signals_T_168) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_170 = mux(_signals_T_33, UInt<4>(0hd), _signals_T_169) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_171 = mux(_signals_T_31, UInt<4>(0hc), _signals_T_170) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_172 = mux(_signals_T_29, UInt<4>(0hf), _signals_T_171) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_173 = mux(_signals_T_27, UInt<4>(0he), _signals_T_172) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_174 = mux(_signals_T_25, UInt<5>(0h11), _signals_T_173) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_175 = mux(_signals_T_23, UInt<5>(0h10), _signals_T_174) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_176 = mux(_signals_T_21, UInt<4>(0hb), _signals_T_175) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_177 = mux(_signals_T_19, UInt<4>(0ha), _signals_T_176) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_178 = mux(_signals_T_17, UInt<4>(0h9), _signals_T_177) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_179 = mux(_signals_T_15, UInt<4>(0h8), _signals_T_178) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_180 = mux(_signals_T_13, UInt<3>(0h7), _signals_T_179) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_181 = mux(_signals_T_11, UInt<3>(0h6), _signals_T_180) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_182 = mux(_signals_T_9, UInt<3>(0h5), _signals_T_181) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_183 = mux(_signals_T_7, UInt<3>(0h4), _signals_T_182) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_184 = mux(_signals_T_5, UInt<2>(0h3), _signals_T_183) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_185 = mux(_signals_T_3, UInt<2>(0h2), _signals_T_184) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node signals_1 = mux(_signals_T_1, UInt<1>(0h1), _signals_T_185) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_186 = mux(_signals_T_93, UInt<1>(0h0), UInt<1>(0h0)) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_187 = mux(_signals_T_91, UInt<1>(0h0), _signals_T_186) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_188 = mux(_signals_T_89, UInt<1>(0h0), _signals_T_187) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_189 = mux(_signals_T_87, UInt<1>(0h0), _signals_T_188) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_190 = mux(_signals_T_85, UInt<1>(0h0), _signals_T_189) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_191 = mux(_signals_T_83, UInt<1>(0h0), _signals_T_190) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_192 = mux(_signals_T_81, UInt<1>(0h0), _signals_T_191) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_193 = mux(_signals_T_79, UInt<1>(0h0), _signals_T_192) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_194 = mux(_signals_T_77, UInt<1>(0h0), _signals_T_193) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_195 = mux(_signals_T_75, UInt<1>(0h0), _signals_T_194) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_196 = mux(_signals_T_73, UInt<1>(0h0), _signals_T_195) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_197 = mux(_signals_T_71, UInt<1>(0h0), _signals_T_196) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_198 = mux(_signals_T_69, UInt<1>(0h0), _signals_T_197) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_199 = mux(_signals_T_67, UInt<1>(0h0), _signals_T_198) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_200 = mux(_signals_T_65, UInt<1>(0h0), _signals_T_199) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_201 = mux(_signals_T_63, UInt<1>(0h0), _signals_T_200) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_202 = mux(_signals_T_61, UInt<1>(0h0), _signals_T_201) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_203 = mux(_signals_T_59, UInt<1>(0h0), _signals_T_202) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_204 = mux(_signals_T_57, UInt<1>(0h0), _signals_T_203) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_205 = mux(_signals_T_55, UInt<1>(0h0), _signals_T_204) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_206 = mux(_signals_T_53, UInt<1>(0h0), _signals_T_205) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_207 = mux(_signals_T_51, UInt<1>(0h0), _signals_T_206) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_208 = mux(_signals_T_49, UInt<1>(0h0), _signals_T_207) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_209 = mux(_signals_T_47, UInt<1>(0h0), _signals_T_208) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_210 = mux(_signals_T_45, UInt<1>(0h0), _signals_T_209) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_211 = mux(_signals_T_43, UInt<1>(0h0), _signals_T_210) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_212 = mux(_signals_T_41, UInt<1>(0h1), _signals_T_211) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_213 = mux(_signals_T_39, UInt<1>(0h1), _signals_T_212) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_214 = mux(_signals_T_37, UInt<1>(0h1), _signals_T_213) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_215 = mux(_signals_T_35, UInt<1>(0h1), _signals_T_214) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_216 = mux(_signals_T_33, UInt<1>(0h1), _signals_T_215) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_217 = mux(_signals_T_31, UInt<1>(0h1), _signals_T_216) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_218 = mux(_signals_T_29, UInt<1>(0h1), _signals_T_217) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_219 = mux(_signals_T_27, UInt<1>(0h1), _signals_T_218) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_220 = mux(_signals_T_25, UInt<1>(0h1), _signals_T_219) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_221 = mux(_signals_T_23, UInt<1>(0h1), _signals_T_220) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_222 = mux(_signals_T_21, UInt<1>(0h1), _signals_T_221) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_223 = mux(_signals_T_19, UInt<1>(0h1), _signals_T_222) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_224 = mux(_signals_T_17, UInt<1>(0h1), _signals_T_223) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_225 = mux(_signals_T_15, UInt<1>(0h1), _signals_T_224) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_226 = mux(_signals_T_13, UInt<1>(0h1), _signals_T_225) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_227 = mux(_signals_T_11, UInt<1>(0h1), _signals_T_226) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_228 = mux(_signals_T_9, UInt<1>(0h0), _signals_T_227) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_229 = mux(_signals_T_7, UInt<1>(0h0), _signals_T_228) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_230 = mux(_signals_T_5, UInt<1>(0h1), _signals_T_229) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_231 = mux(_signals_T_3, UInt<1>(0h1), _signals_T_230) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node signals_2 = mux(_signals_T_1, UInt<1>(0h1), _signals_T_231) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_232 = mux(_signals_T_93, UInt<1>(0h0), UInt<1>(0h0)) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_233 = mux(_signals_T_91, UInt<1>(0h0), _signals_T_232) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_234 = mux(_signals_T_89, UInt<1>(0h0), _signals_T_233) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_235 = mux(_signals_T_87, UInt<1>(0h0), _signals_T_234) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_236 = mux(_signals_T_85, UInt<1>(0h0), _signals_T_235) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_237 = mux(_signals_T_83, UInt<1>(0h0), _signals_T_236) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_238 = mux(_signals_T_81, UInt<1>(0h0), _signals_T_237) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_239 = mux(_signals_T_79, UInt<1>(0h0), _signals_T_238) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_240 = mux(_signals_T_77, UInt<1>(0h0), _signals_T_239) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_241 = mux(_signals_T_75, UInt<1>(0h0), _signals_T_240) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_242 = mux(_signals_T_73, UInt<1>(0h0), _signals_T_241) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_243 = mux(_signals_T_71, UInt<1>(0h0), _signals_T_242) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_244 = mux(_signals_T_69, UInt<1>(0h0), _signals_T_243) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_245 = mux(_signals_T_67, UInt<1>(0h0), _signals_T_244) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_246 = mux(_signals_T_65, UInt<1>(0h0), _signals_T_245) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_247 = mux(_signals_T_63, UInt<1>(0h0), _signals_T_246) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_248 = mux(_signals_T_61, UInt<1>(0h0), _signals_T_247) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_249 = mux(_signals_T_59, UInt<1>(0h0), _signals_T_248) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_250 = mux(_signals_T_57, UInt<1>(0h0), _signals_T_249) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_251 = mux(_signals_T_55, UInt<1>(0h0), _signals_T_250) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_252 = mux(_signals_T_53, UInt<1>(0h1), _signals_T_251) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_253 = mux(_signals_T_51, UInt<1>(0h1), _signals_T_252) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_254 = mux(_signals_T_49, UInt<1>(0h1), _signals_T_253) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_255 = mux(_signals_T_47, UInt<1>(0h1), _signals_T_254) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_256 = mux(_signals_T_45, UInt<1>(0h1), _signals_T_255) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_257 = mux(_signals_T_43, UInt<1>(0h1), _signals_T_256) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_258 = mux(_signals_T_41, UInt<1>(0h0), _signals_T_257) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_259 = mux(_signals_T_39, UInt<1>(0h0), _signals_T_258) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_260 = mux(_signals_T_37, UInt<1>(0h0), _signals_T_259) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_261 = mux(_signals_T_35, UInt<1>(0h0), _signals_T_260) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_262 = mux(_signals_T_33, UInt<1>(0h0), _signals_T_261) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_263 = mux(_signals_T_31, UInt<1>(0h0), _signals_T_262) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_264 = mux(_signals_T_29, UInt<1>(0h0), _signals_T_263) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_265 = mux(_signals_T_27, UInt<1>(0h0), _signals_T_264) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_266 = mux(_signals_T_25, UInt<1>(0h0), _signals_T_265) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_267 = mux(_signals_T_23, UInt<1>(0h0), _signals_T_266) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_268 = mux(_signals_T_21, UInt<1>(0h0), _signals_T_267) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_269 = mux(_signals_T_19, UInt<1>(0h0), _signals_T_268) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_270 = mux(_signals_T_17, UInt<1>(0h0), _signals_T_269) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_271 = mux(_signals_T_15, UInt<1>(0h0), _signals_T_270) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_272 = mux(_signals_T_13, UInt<1>(0h0), _signals_T_271) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_273 = mux(_signals_T_11, UInt<1>(0h0), _signals_T_272) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_274 = mux(_signals_T_9, UInt<1>(0h0), _signals_T_273) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_275 = mux(_signals_T_7, UInt<1>(0h0), _signals_T_274) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_276 = mux(_signals_T_5, UInt<1>(0h0), _signals_T_275) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_277 = mux(_signals_T_3, UInt<1>(0h0), _signals_T_276) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node signals_3 = mux(_signals_T_1, UInt<1>(0h0), _signals_T_277) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_278 = mux(_signals_T_93, UInt<1>(0h1), UInt<1>(0h0)) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_279 = mux(_signals_T_91, UInt<1>(0h1), _signals_T_278) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_280 = mux(_signals_T_89, UInt<1>(0h1), _signals_T_279) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_281 = mux(_signals_T_87, UInt<1>(0h1), _signals_T_280) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_282 = mux(_signals_T_85, UInt<1>(0h1), _signals_T_281) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_283 = mux(_signals_T_83, UInt<1>(0h1), _signals_T_282) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_284 = mux(_signals_T_81, UInt<1>(0h1), _signals_T_283) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_285 = mux(_signals_T_79, UInt<1>(0h1), _signals_T_284) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_286 = mux(_signals_T_77, UInt<1>(0h1), _signals_T_285) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_287 = mux(_signals_T_75, UInt<1>(0h1), _signals_T_286) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_288 = mux(_signals_T_73, UInt<1>(0h1), _signals_T_287) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_289 = mux(_signals_T_71, UInt<1>(0h0), _signals_T_288) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_290 = mux(_signals_T_69, UInt<1>(0h0), _signals_T_289) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_291 = mux(_signals_T_67, UInt<1>(0h0), _signals_T_290) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_292 = mux(_signals_T_65, UInt<1>(0h0), _signals_T_291) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_293 = mux(_signals_T_63, UInt<1>(0h0), _signals_T_292) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_294 = mux(_signals_T_61, UInt<1>(0h1), _signals_T_293) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_295 = mux(_signals_T_59, UInt<1>(0h0), _signals_T_294) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_296 = mux(_signals_T_57, UInt<1>(0h1), _signals_T_295) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_297 = mux(_signals_T_55, UInt<1>(0h1), _signals_T_296) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_298 = mux(_signals_T_53, UInt<1>(0h1), _signals_T_297) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_299 = mux(_signals_T_51, UInt<1>(0h1), _signals_T_298) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_300 = mux(_signals_T_49, UInt<1>(0h1), _signals_T_299) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_301 = mux(_signals_T_47, UInt<1>(0h1), _signals_T_300) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_302 = mux(_signals_T_45, UInt<1>(0h1), _signals_T_301) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_303 = mux(_signals_T_43, UInt<1>(0h1), _signals_T_302) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_304 = mux(_signals_T_41, UInt<1>(0h1), _signals_T_303) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_305 = mux(_signals_T_39, UInt<1>(0h0), _signals_T_304) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_306 = mux(_signals_T_37, UInt<1>(0h1), _signals_T_305) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_307 = mux(_signals_T_35, UInt<1>(0h0), _signals_T_306) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_308 = mux(_signals_T_33, UInt<1>(0h1), _signals_T_307) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_309 = mux(_signals_T_31, UInt<1>(0h0), _signals_T_308) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_310 = mux(_signals_T_29, UInt<1>(0h1), _signals_T_309) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_311 = mux(_signals_T_27, UInt<1>(0h0), _signals_T_310) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_312 = mux(_signals_T_25, UInt<1>(0h1), _signals_T_311) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_313 = mux(_signals_T_23, UInt<1>(0h0), _signals_T_312) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_314 = mux(_signals_T_21, UInt<1>(0h1), _signals_T_313) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_315 = mux(_signals_T_19, UInt<1>(0h0), _signals_T_314) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_316 = mux(_signals_T_17, UInt<1>(0h1), _signals_T_315) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_317 = mux(_signals_T_15, UInt<1>(0h0), _signals_T_316) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_318 = mux(_signals_T_13, UInt<1>(0h1), _signals_T_317) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_319 = mux(_signals_T_11, UInt<1>(0h0), _signals_T_318) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_320 = mux(_signals_T_9, UInt<1>(0h1), _signals_T_319) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_321 = mux(_signals_T_7, UInt<1>(0h1), _signals_T_320) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_322 = mux(_signals_T_5, UInt<1>(0h0), _signals_T_321) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_323 = mux(_signals_T_3, UInt<1>(0h1), _signals_T_322) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node signals_4 = mux(_signals_T_1, UInt<1>(0h0), _signals_T_323) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_324 = mux(_signals_T_93, UInt<1>(0h0), UInt<1>(0h0)) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_325 = mux(_signals_T_91, UInt<1>(0h0), _signals_T_324) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_326 = mux(_signals_T_89, UInt<1>(0h0), _signals_T_325) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_327 = mux(_signals_T_87, UInt<1>(0h0), _signals_T_326) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_328 = mux(_signals_T_85, UInt<1>(0h0), _signals_T_327) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_329 = mux(_signals_T_83, UInt<1>(0h0), _signals_T_328) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_330 = mux(_signals_T_81, UInt<1>(0h0), _signals_T_329) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_331 = mux(_signals_T_79, UInt<1>(0h0), _signals_T_330) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_332 = mux(_signals_T_77, UInt<1>(0h0), _signals_T_331) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_333 = mux(_signals_T_75, UInt<1>(0h0), _signals_T_332) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_334 = mux(_signals_T_73, UInt<1>(0h0), _signals_T_333) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_335 = mux(_signals_T_71, UInt<1>(0h0), _signals_T_334) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_336 = mux(_signals_T_69, UInt<1>(0h0), _signals_T_335) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_337 = mux(_signals_T_67, UInt<1>(0h0), _signals_T_336) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_338 = mux(_signals_T_65, UInt<1>(0h0), _signals_T_337) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_339 = mux(_signals_T_63, UInt<1>(0h0), _signals_T_338) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_340 = mux(_signals_T_61, UInt<1>(0h0), _signals_T_339) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_341 = mux(_signals_T_59, UInt<1>(0h0), _signals_T_340) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_342 = mux(_signals_T_57, UInt<1>(0h1), _signals_T_341) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_343 = mux(_signals_T_55, UInt<1>(0h1), _signals_T_342) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_344 = mux(_signals_T_53, UInt<1>(0h0), _signals_T_343) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_345 = mux(_signals_T_51, UInt<1>(0h0), _signals_T_344) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_346 = mux(_signals_T_49, UInt<1>(0h0), _signals_T_345) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_347 = mux(_signals_T_47, UInt<1>(0h0), _signals_T_346) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_348 = mux(_signals_T_45, UInt<1>(0h0), _signals_T_347) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_349 = mux(_signals_T_43, UInt<1>(0h0), _signals_T_348) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_350 = mux(_signals_T_41, UInt<1>(0h0), _signals_T_349) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_351 = mux(_signals_T_39, UInt<1>(0h0), _signals_T_350) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_352 = mux(_signals_T_37, UInt<1>(0h0), _signals_T_351) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_353 = mux(_signals_T_35, UInt<1>(0h0), _signals_T_352) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_354 = mux(_signals_T_33, UInt<1>(0h0), _signals_T_353) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_355 = mux(_signals_T_31, UInt<1>(0h0), _signals_T_354) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_356 = mux(_signals_T_29, UInt<1>(0h0), _signals_T_355) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_357 = mux(_signals_T_27, UInt<1>(0h0), _signals_T_356) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_358 = mux(_signals_T_25, UInt<1>(0h0), _signals_T_357) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_359 = mux(_signals_T_23, UInt<1>(0h0), _signals_T_358) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_360 = mux(_signals_T_21, UInt<1>(0h0), _signals_T_359) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_361 = mux(_signals_T_19, UInt<1>(0h0), _signals_T_360) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_362 = mux(_signals_T_17, UInt<1>(0h0), _signals_T_361) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_363 = mux(_signals_T_15, UInt<1>(0h0), _signals_T_362) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_364 = mux(_signals_T_13, UInt<1>(0h0), _signals_T_363) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_365 = mux(_signals_T_11, UInt<1>(0h0), _signals_T_364) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_366 = mux(_signals_T_9, UInt<1>(0h0), _signals_T_365) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_367 = mux(_signals_T_7, UInt<1>(0h0), _signals_T_366) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_368 = mux(_signals_T_5, UInt<1>(0h0), _signals_T_367) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_369 = mux(_signals_T_3, UInt<1>(0h0), _signals_T_368) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node signals_5 = mux(_signals_T_1, UInt<1>(0h0), _signals_T_369) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_370 = mux(_signals_T_93, UInt<1>(0h0), UInt<1>(0h0)) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_371 = mux(_signals_T_91, UInt<1>(0h0), _signals_T_370) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_372 = mux(_signals_T_89, UInt<1>(0h0), _signals_T_371) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_373 = mux(_signals_T_87, UInt<1>(0h1), _signals_T_372) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_374 = mux(_signals_T_85, UInt<1>(0h1), _signals_T_373) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_375 = mux(_signals_T_83, UInt<1>(0h1), _signals_T_374) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_376 = mux(_signals_T_81, UInt<1>(0h1), _signals_T_375) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_377 = mux(_signals_T_79, UInt<1>(0h1), _signals_T_376) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_378 = mux(_signals_T_77, UInt<1>(0h0), _signals_T_377) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_379 = mux(_signals_T_75, UInt<1>(0h0), _signals_T_378) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_380 = mux(_signals_T_73, UInt<1>(0h0), _signals_T_379) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_381 = mux(_signals_T_71, UInt<1>(0h0), _signals_T_380) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_382 = mux(_signals_T_69, UInt<1>(0h0), _signals_T_381) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_383 = mux(_signals_T_67, UInt<1>(0h0), _signals_T_382) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_384 = mux(_signals_T_65, UInt<1>(0h0), _signals_T_383) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_385 = mux(_signals_T_63, UInt<1>(0h0), _signals_T_384) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_386 = mux(_signals_T_61, UInt<1>(0h0), _signals_T_385) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_387 = mux(_signals_T_59, UInt<1>(0h0), _signals_T_386) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_388 = mux(_signals_T_57, UInt<1>(0h0), _signals_T_387) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_389 = mux(_signals_T_55, UInt<1>(0h0), _signals_T_388) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_390 = mux(_signals_T_53, UInt<1>(0h0), _signals_T_389) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_391 = mux(_signals_T_51, UInt<1>(0h0), _signals_T_390) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_392 = mux(_signals_T_49, UInt<1>(0h0), _signals_T_391) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_393 = mux(_signals_T_47, UInt<1>(0h0), _signals_T_392) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_394 = mux(_signals_T_45, UInt<1>(0h0), _signals_T_393) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_395 = mux(_signals_T_43, UInt<1>(0h0), _signals_T_394) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_396 = mux(_signals_T_41, UInt<1>(0h0), _signals_T_395) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_397 = mux(_signals_T_39, UInt<1>(0h0), _signals_T_396) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_398 = mux(_signals_T_37, UInt<1>(0h0), _signals_T_397) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_399 = mux(_signals_T_35, UInt<1>(0h0), _signals_T_398) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_400 = mux(_signals_T_33, UInt<1>(0h0), _signals_T_399) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_401 = mux(_signals_T_31, UInt<1>(0h0), _signals_T_400) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_402 = mux(_signals_T_29, UInt<1>(0h0), _signals_T_401) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_403 = mux(_signals_T_27, UInt<1>(0h0), _signals_T_402) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_404 = mux(_signals_T_25, UInt<1>(0h0), _signals_T_403) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_405 = mux(_signals_T_23, UInt<1>(0h0), _signals_T_404) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_406 = mux(_signals_T_21, UInt<1>(0h0), _signals_T_405) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_407 = mux(_signals_T_19, UInt<1>(0h0), _signals_T_406) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_408 = mux(_signals_T_17, UInt<1>(0h0), _signals_T_407) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_409 = mux(_signals_T_15, UInt<1>(0h0), _signals_T_408) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_410 = mux(_signals_T_13, UInt<1>(0h0), _signals_T_409) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_411 = mux(_signals_T_11, UInt<1>(0h0), _signals_T_410) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_412 = mux(_signals_T_9, UInt<1>(0h0), _signals_T_411) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_413 = mux(_signals_T_7, UInt<1>(0h0), _signals_T_412) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_414 = mux(_signals_T_5, UInt<1>(0h0), _signals_T_413) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_415 = mux(_signals_T_3, UInt<1>(0h0), _signals_T_414) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node signals_6 = mux(_signals_T_1, UInt<1>(0h0), _signals_T_415) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_416 = mux(_signals_T_93, UInt<1>(0h1), UInt<1>(0h0)) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_417 = mux(_signals_T_91, UInt<1>(0h1), _signals_T_416) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_418 = mux(_signals_T_89, UInt<1>(0h1), _signals_T_417) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_419 = mux(_signals_T_87, UInt<1>(0h0), _signals_T_418) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_420 = mux(_signals_T_85, UInt<1>(0h0), _signals_T_419) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_421 = mux(_signals_T_83, UInt<1>(0h0), _signals_T_420) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_422 = mux(_signals_T_81, UInt<1>(0h0), _signals_T_421) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_423 = mux(_signals_T_79, UInt<1>(0h0), _signals_T_422) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_424 = mux(_signals_T_77, UInt<1>(0h0), _signals_T_423) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_425 = mux(_signals_T_75, UInt<1>(0h0), _signals_T_424) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_426 = mux(_signals_T_73, UInt<1>(0h0), _signals_T_425) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_427 = mux(_signals_T_71, UInt<1>(0h0), _signals_T_426) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_428 = mux(_signals_T_69, UInt<1>(0h0), _signals_T_427) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_429 = mux(_signals_T_67, UInt<1>(0h0), _signals_T_428) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_430 = mux(_signals_T_65, UInt<1>(0h0), _signals_T_429) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_431 = mux(_signals_T_63, UInt<1>(0h0), _signals_T_430) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_432 = mux(_signals_T_61, UInt<1>(0h0), _signals_T_431) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_433 = mux(_signals_T_59, UInt<1>(0h0), _signals_T_432) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_434 = mux(_signals_T_57, UInt<1>(0h0), _signals_T_433) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_435 = mux(_signals_T_55, UInt<1>(0h0), _signals_T_434) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_436 = mux(_signals_T_53, UInt<1>(0h0), _signals_T_435) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_437 = mux(_signals_T_51, UInt<1>(0h0), _signals_T_436) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_438 = mux(_signals_T_49, UInt<1>(0h0), _signals_T_437) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_439 = mux(_signals_T_47, UInt<1>(0h0), _signals_T_438) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_440 = mux(_signals_T_45, UInt<1>(0h0), _signals_T_439) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_441 = mux(_signals_T_43, UInt<1>(0h0), _signals_T_440) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_442 = mux(_signals_T_41, UInt<1>(0h0), _signals_T_441) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_443 = mux(_signals_T_39, UInt<1>(0h0), _signals_T_442) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_444 = mux(_signals_T_37, UInt<1>(0h0), _signals_T_443) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_445 = mux(_signals_T_35, UInt<1>(0h0), _signals_T_444) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_446 = mux(_signals_T_33, UInt<1>(0h0), _signals_T_445) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_447 = mux(_signals_T_31, UInt<1>(0h0), _signals_T_446) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_448 = mux(_signals_T_29, UInt<1>(0h0), _signals_T_447) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_449 = mux(_signals_T_27, UInt<1>(0h0), _signals_T_448) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_450 = mux(_signals_T_25, UInt<1>(0h0), _signals_T_449) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_451 = mux(_signals_T_23, UInt<1>(0h0), _signals_T_450) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_452 = mux(_signals_T_21, UInt<1>(0h0), _signals_T_451) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_453 = mux(_signals_T_19, UInt<1>(0h0), _signals_T_452) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_454 = mux(_signals_T_17, UInt<1>(0h0), _signals_T_453) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_455 = mux(_signals_T_15, UInt<1>(0h0), _signals_T_454) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_456 = mux(_signals_T_13, UInt<1>(0h0), _signals_T_455) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_457 = mux(_signals_T_11, UInt<1>(0h0), _signals_T_456) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_458 = mux(_signals_T_9, UInt<1>(0h0), _signals_T_457) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_459 = mux(_signals_T_7, UInt<1>(0h0), _signals_T_458) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_460 = mux(_signals_T_5, UInt<1>(0h0), _signals_T_459) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node _signals_T_461 = mux(_signals_T_3, UInt<1>(0h0), _signals_T_460) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    node signals_7 = mux(_signals_T_1, UInt<1>(0h0), _signals_T_461) @[src/main/scala/chisel3/util/Lookup.scala 34:39]
    connect io.rd, UInt<1>(0h0) @[chiselv/src/Decoder.scala 94:15]
    connect io.rs1, UInt<1>(0h0) @[chiselv/src/Decoder.scala 95:15]
    connect io.rs2, UInt<1>(0h0) @[chiselv/src/Decoder.scala 96:15]
    connect io.imm, asSInt(UInt<1>(0h0)) @[chiselv/src/Decoder.scala 97:15]
    connect io.inst, signals_1 @[chiselv/src/Decoder.scala 98:15]
    connect io.toALU, signals_2 @[chiselv/src/Decoder.scala 99:15]
    connect io.branch, signals_3 @[chiselv/src/Decoder.scala 100:15]
    connect io.use_imm, signals_4 @[chiselv/src/Decoder.scala 101:15]
    connect io.jump, signals_5 @[chiselv/src/Decoder.scala 102:15]
    connect io.is_load, signals_6 @[chiselv/src/Decoder.scala 103:15]
    connect io.is_store, signals_7 @[chiselv/src/Decoder.scala 104:15]
    node _T = asUInt(UInt<1>(0h1)) @[chiselv/src/Decoder.scala 106:22]
    node _T_1 = asUInt(signals_0) @[chiselv/src/Decoder.scala 106:22]
    node _T_2 = eq(_T, _T_1) @[chiselv/src/Decoder.scala 106:22]
    when _T_2 : @[chiselv/src/Decoder.scala 106:22]
      node _io_rd_T = bits(io.op, 11, 7) @[chiselv/src/Decoder.scala 108:22]
      connect io.rd, _io_rd_T @[chiselv/src/Decoder.scala 108:14]
      node _io_rs1_T = bits(io.op, 19, 15) @[chiselv/src/Decoder.scala 109:22]
      connect io.rs1, _io_rs1_T @[chiselv/src/Decoder.scala 109:14]
      node _io_rs2_T = bits(io.op, 24, 20) @[chiselv/src/Decoder.scala 110:22]
      connect io.rs2, _io_rs2_T @[chiselv/src/Decoder.scala 110:14]
    else :
      node _T_3 = asUInt(UInt<2>(0h2)) @[chiselv/src/Decoder.scala 106:22]
      node _T_4 = asUInt(signals_0) @[chiselv/src/Decoder.scala 106:22]
      node _T_5 = eq(_T_3, _T_4) @[chiselv/src/Decoder.scala 106:22]
      when _T_5 : @[chiselv/src/Decoder.scala 106:22]
        node _io_rd_T_1 = bits(io.op, 11, 7) @[chiselv/src/Decoder.scala 113:22]
        connect io.rd, _io_rd_T_1 @[chiselv/src/Decoder.scala 113:14]
        node _io_rs1_T_1 = bits(io.op, 19, 15) @[chiselv/src/Decoder.scala 114:22]
        connect io.rs1, _io_rs1_T_1 @[chiselv/src/Decoder.scala 114:14]
        node _io_imm_T = bits(io.op, 31, 31) @[chiselv/src/Decoder.scala 148:37]
        node _io_imm_T_1 = mux(_io_imm_T, UInt<20>(0hfffff), UInt<20>(0h0)) @[chiselv/src/Decoder.scala 148:28]
        node _io_imm_T_2 = bits(io.op, 31, 20) @[chiselv/src/Decoder.scala 148:48]
        node _io_imm_T_3 = cat(_io_imm_T_1, _io_imm_T_2) @[chiselv/src/Decoder.scala 148:23]
        node _io_imm_T_4 = asSInt(_io_imm_T_3) @[chiselv/src/Decoder.scala 148:58]
        connect io.imm, _io_imm_T_4 @[chiselv/src/Decoder.scala 115:14]
      else :
        node _T_6 = asUInt(UInt<2>(0h3)) @[chiselv/src/Decoder.scala 106:22]
        node _T_7 = asUInt(signals_0) @[chiselv/src/Decoder.scala 106:22]
        node _T_8 = eq(_T_6, _T_7) @[chiselv/src/Decoder.scala 106:22]
        when _T_8 : @[chiselv/src/Decoder.scala 106:22]
          node _io_rs1_T_2 = bits(io.op, 19, 15) @[chiselv/src/Decoder.scala 118:22]
          connect io.rs1, _io_rs1_T_2 @[chiselv/src/Decoder.scala 118:14]
          node _io_rs2_T_1 = bits(io.op, 24, 20) @[chiselv/src/Decoder.scala 119:22]
          connect io.rs2, _io_rs2_T_1 @[chiselv/src/Decoder.scala 119:14]
          node _io_imm_T_5 = bits(io.op, 31, 31) @[chiselv/src/Decoder.scala 149:37]
          node _io_imm_T_6 = mux(_io_imm_T_5, UInt<20>(0hfffff), UInt<20>(0h0)) @[chiselv/src/Decoder.scala 149:28]
          node _io_imm_T_7 = bits(io.op, 31, 25) @[chiselv/src/Decoder.scala 149:48]
          node _io_imm_T_8 = bits(io.op, 11, 7) @[chiselv/src/Decoder.scala 149:62]
          node io_imm_hi = cat(_io_imm_T_6, _io_imm_T_7) @[chiselv/src/Decoder.scala 149:23]
          node _io_imm_T_9 = cat(io_imm_hi, _io_imm_T_8) @[chiselv/src/Decoder.scala 149:23]
          node _io_imm_T_10 = asSInt(_io_imm_T_9) @[chiselv/src/Decoder.scala 149:71]
          connect io.imm, _io_imm_T_10 @[chiselv/src/Decoder.scala 120:14]
        else :
          node _T_9 = asUInt(UInt<3>(0h4)) @[chiselv/src/Decoder.scala 106:22]
          node _T_10 = asUInt(signals_0) @[chiselv/src/Decoder.scala 106:22]
          node _T_11 = eq(_T_9, _T_10) @[chiselv/src/Decoder.scala 106:22]
          when _T_11 : @[chiselv/src/Decoder.scala 106:22]
            node _io_rs1_T_3 = bits(io.op, 19, 15) @[chiselv/src/Decoder.scala 123:22]
            connect io.rs1, _io_rs1_T_3 @[chiselv/src/Decoder.scala 123:14]
            node _io_rs2_T_2 = bits(io.op, 24, 20) @[chiselv/src/Decoder.scala 124:22]
            connect io.rs2, _io_rs2_T_2 @[chiselv/src/Decoder.scala 124:14]
            node _io_imm_T_11 = bits(io.op, 31, 31) @[chiselv/src/Decoder.scala 150:37]
            node _io_imm_T_12 = mux(_io_imm_T_11, UInt<19>(0h7ffff), UInt<19>(0h0)) @[chiselv/src/Decoder.scala 150:28]
            node _io_imm_T_13 = bits(io.op, 31, 31) @[chiselv/src/Decoder.scala 150:48]
            node _io_imm_T_14 = bits(io.op, 7, 7) @[chiselv/src/Decoder.scala 150:58]
            node _io_imm_T_15 = bits(io.op, 30, 25) @[chiselv/src/Decoder.scala 150:67]
            node _io_imm_T_16 = bits(io.op, 11, 8) @[chiselv/src/Decoder.scala 150:81]
            node io_imm_lo_hi = cat(_io_imm_T_15, _io_imm_T_16) @[chiselv/src/Decoder.scala 150:23]
            node io_imm_lo = cat(io_imm_lo_hi, UInt<1>(0h0)) @[chiselv/src/Decoder.scala 150:23]
            node io_imm_hi_hi = cat(_io_imm_T_12, _io_imm_T_13) @[chiselv/src/Decoder.scala 150:23]
            node io_imm_hi_1 = cat(io_imm_hi_hi, _io_imm_T_14) @[chiselv/src/Decoder.scala 150:23]
            node _io_imm_T_17 = cat(io_imm_hi_1, io_imm_lo) @[chiselv/src/Decoder.scala 150:23]
            node _io_imm_T_18 = asSInt(_io_imm_T_17) @[chiselv/src/Decoder.scala 150:100]
            connect io.imm, _io_imm_T_18 @[chiselv/src/Decoder.scala 125:14]
          else :
            node _T_12 = asUInt(UInt<3>(0h5)) @[chiselv/src/Decoder.scala 106:22]
            node _T_13 = asUInt(signals_0) @[chiselv/src/Decoder.scala 106:22]
            node _T_14 = eq(_T_12, _T_13) @[chiselv/src/Decoder.scala 106:22]
            when _T_14 : @[chiselv/src/Decoder.scala 106:22]
              node _io_rd_T_2 = bits(io.op, 11, 7) @[chiselv/src/Decoder.scala 128:22]
              connect io.rd, _io_rd_T_2 @[chiselv/src/Decoder.scala 128:14]
              node _io_imm_T_19 = bits(io.op, 31, 12) @[chiselv/src/Decoder.scala 151:28]
              node _io_imm_T_20 = mux(UInt<1>(0h0), UInt<12>(0hfff), UInt<12>(0h0)) @[chiselv/src/Decoder.scala 151:42]
              node _io_imm_T_21 = cat(_io_imm_T_19, _io_imm_T_20) @[chiselv/src/Decoder.scala 151:23]
              node _io_imm_T_22 = asSInt(_io_imm_T_21) @[chiselv/src/Decoder.scala 151:53]
              connect io.imm, _io_imm_T_22 @[chiselv/src/Decoder.scala 129:14]
            else :
              node _T_15 = asUInt(UInt<3>(0h6)) @[chiselv/src/Decoder.scala 106:22]
              node _T_16 = asUInt(signals_0) @[chiselv/src/Decoder.scala 106:22]
              node _T_17 = eq(_T_15, _T_16) @[chiselv/src/Decoder.scala 106:22]
              when _T_17 : @[chiselv/src/Decoder.scala 106:22]
                node _io_rd_T_3 = bits(io.op, 11, 7) @[chiselv/src/Decoder.scala 132:22]
                connect io.rd, _io_rd_T_3 @[chiselv/src/Decoder.scala 132:14]
                node _io_imm_T_23 = bits(io.op, 31, 31) @[chiselv/src/Decoder.scala 153:24]
                node _io_imm_T_24 = mux(_io_imm_T_23, UInt<11>(0h7ff), UInt<11>(0h0)) @[chiselv/src/Decoder.scala 153:15]
                node _io_imm_T_25 = bits(io.op, 31, 31) @[chiselv/src/Decoder.scala 153:35]
                node _io_imm_T_26 = bits(io.op, 19, 12) @[chiselv/src/Decoder.scala 153:45]
                node _io_imm_T_27 = bits(io.op, 20, 20) @[chiselv/src/Decoder.scala 153:59]
                node _io_imm_T_28 = bits(io.op, 30, 25) @[chiselv/src/Decoder.scala 153:69]
                node _io_imm_T_29 = bits(io.op, 24, 21) @[chiselv/src/Decoder.scala 153:83]
                node io_imm_lo_hi_1 = cat(_io_imm_T_28, _io_imm_T_29) @[chiselv/src/Decoder.scala 153:10]
                node io_imm_lo_1 = cat(io_imm_lo_hi_1, UInt<1>(0h0)) @[chiselv/src/Decoder.scala 153:10]
                node io_imm_hi_lo = cat(_io_imm_T_26, _io_imm_T_27) @[chiselv/src/Decoder.scala 153:10]
                node io_imm_hi_hi_1 = cat(_io_imm_T_24, _io_imm_T_25) @[chiselv/src/Decoder.scala 153:10]
                node io_imm_hi_2 = cat(io_imm_hi_hi_1, io_imm_hi_lo) @[chiselv/src/Decoder.scala 153:10]
                node _io_imm_T_30 = cat(io_imm_hi_2, io_imm_lo_1) @[chiselv/src/Decoder.scala 153:10]
                node _io_imm_T_31 = asSInt(_io_imm_T_30) @[chiselv/src/Decoder.scala 153:103]
                connect io.imm, _io_imm_T_31 @[chiselv/src/Decoder.scala 133:14]


  module MemoryIOManager : @[chiselv/src/MemoryIOManager.scala 43:7]
    input clock : Clock @[chiselv/src/MemoryIOManager.scala 43:7]
    input reset : Reset @[chiselv/src/MemoryIOManager.scala 43:7]
    output io : { MemoryIOPort : { flip writeRequest : UInt<1>, flip readRequest : UInt<1>, flip readAddr : UInt<32>, readData : UInt<32>, flip writeAddr : UInt<32>, flip writeData : UInt<32>, flip writeMask : UInt<4>, flip dataSize : UInt<2>}, flip GPIO0Port : { flip dataIn : UInt<32>, valueOut : UInt<32>, directionOut : UInt<32>, flip writeValue : UInt<1>, flip writeDirection : UInt<1>, stall : UInt<1>}, flip Timer0Port : { flip dataIn : UInt<32>, dataOut : UInt<32>, flip writeEnable : UInt<1>, stall : UInt<1>}, flip UART0Port : { rxQueue : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, flip txQueue : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, rxEmpty : UInt<1>, txEmpty : UInt<1>, rxFull : UInt<1>, txFull : UInt<1>, flip clockDivisor : { valid : UInt<1>, bits : UInt<8>}}, flip DataMemPort : { flip readAddress : UInt<16>, readData : UInt<32>, flip writeAddress : UInt<16>, flip writeData : UInt<32>, flip writeMask : UInt<4>, flip dataSize : UInt<2>, flip writeEnable : UInt<1>}, flip SysconPort : { flip Address : UInt<12>, DataOut : UInt<32>}, stall : UInt<1>} @[chiselv/src/MemoryIOManager.scala 44:14]

    wire dataOut : UInt<32> @[chiselv/src/MemoryIOManager.scala 54:33]
    connect dataOut, UInt<32>(0h0) @[chiselv/src/MemoryIOManager.scala 54:33]
    connect io.GPIO0Port.dataIn, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 59:31]
    connect io.GPIO0Port.writeValue, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 60:31]
    connect io.GPIO0Port.writeDirection, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 61:31]
    connect io.Timer0Port.dataIn, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 63:29]
    connect io.Timer0Port.writeEnable, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 64:29]
    connect io.UART0Port.txQueue.valid, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 66:35]
    connect io.UART0Port.txQueue.bits, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 67:35]
    connect io.UART0Port.rxQueue.ready, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 68:35]
    connect io.UART0Port.clockDivisor.bits, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 69:35]
    connect io.UART0Port.clockDivisor.valid, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 70:35]
    connect io.DataMemPort.writeEnable, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 72:31]
    connect io.DataMemPort.writeData, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 73:31]
    connect io.DataMemPort.readAddress, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 74:31]
    connect io.DataMemPort.writeAddress, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 75:31]
    connect io.DataMemPort.dataSize, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 76:31]
    connect io.DataMemPort.writeMask, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 77:31]
    connect io.SysconPort.Address, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 79:25]
    wire stallLatency : UInt<4> @[chiselv/src/MemoryIOManager.scala 82:33]
    connect stallLatency, UInt<4>(0h0) @[chiselv/src/MemoryIOManager.scala 82:33]
    wire stallEnable : UInt<1> @[chiselv/src/MemoryIOManager.scala 83:33]
    connect stallEnable, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 83:33]
    regreset DACK : UInt<2>, clock, reset, UInt<2>(0h0) @[chiselv/src/MemoryIOManager.scala 84:29]
    node _DACK_T = gt(DACK, UInt<1>(0h0)) @[chiselv/src/MemoryIOManager.scala 86:10]
    node _DACK_T_1 = sub(DACK, UInt<1>(0h1)) @[chiselv/src/MemoryIOManager.scala 87:10]
    node _DACK_T_2 = tail(_DACK_T_1, 1) @[chiselv/src/MemoryIOManager.scala 87:10]
    node _DACK_T_3 = or(io.MemoryIOPort.readRequest, io.MemoryIOPort.writeRequest) @[chiselv/src/MemoryIOManager.scala 88:37]
    node _DACK_T_4 = mux(_DACK_T_3, stallLatency, UInt<1>(0h0)) @[chiselv/src/MemoryIOManager.scala 88:8]
    node _DACK_T_5 = mux(_DACK_T, _DACK_T_2, _DACK_T_4) @[chiselv/src/MemoryIOManager.scala 85:14]
    connect DACK, _DACK_T_5 @[chiselv/src/MemoryIOManager.scala 85:8]
    node _io_stall_T = or(io.MemoryIOPort.readRequest, io.MemoryIOPort.writeRequest) @[chiselv/src/MemoryIOManager.scala 90:44]
    node _io_stall_T_1 = neq(DACK, UInt<1>(0h1)) @[chiselv/src/MemoryIOManager.scala 90:85]
    node _io_stall_T_2 = and(_io_stall_T, _io_stall_T_1) @[chiselv/src/MemoryIOManager.scala 90:77]
    node _io_stall_T_3 = and(_io_stall_T_2, stallEnable) @[chiselv/src/MemoryIOManager.scala 90:93]
    connect io.stall, _io_stall_T_3 @[chiselv/src/MemoryIOManager.scala 90:12]
    node _T = bits(io.MemoryIOPort.readAddr, 31, 12) @[chiselv/src/MemoryIOManager.scala 93:19]
    node _T_1 = eq(_T, UInt<1>(0h1)) @[chiselv/src/MemoryIOManager.scala 93:28]
    node _T_2 = and(_T_1, io.MemoryIOPort.readRequest) @[chiselv/src/MemoryIOManager.scala 93:44]
    when _T_2 : @[chiselv/src/MemoryIOManager.scala 93:76]
      node _io_SysconPort_Address_T = bits(io.MemoryIOPort.readAddr, 11, 0) @[chiselv/src/MemoryIOManager.scala 94:41]
      connect io.SysconPort.Address, _io_SysconPort_Address_T @[chiselv/src/MemoryIOManager.scala 94:27]
      connect dataOut, io.SysconPort.DataOut @[chiselv/src/MemoryIOManager.scala 95:27]
    node _T_3 = bits(io.MemoryIOPort.readAddr, 31, 12) @[chiselv/src/MemoryIOManager.scala 99:19]
    node _T_4 = eq(_T_3, UInt<18>(0h30000)) @[chiselv/src/MemoryIOManager.scala 99:28]
    node _T_5 = bits(io.MemoryIOPort.writeAddr, 31, 12) @[chiselv/src/MemoryIOManager.scala 99:59]
    node _T_6 = eq(_T_5, UInt<18>(0h30000)) @[chiselv/src/MemoryIOManager.scala 99:68]
    node _T_7 = or(_T_4, _T_6) @[chiselv/src/MemoryIOManager.scala 99:44]
    when _T_7 : @[chiselv/src/MemoryIOManager.scala 99:85]
      when io.MemoryIOPort.readRequest : @[chiselv/src/MemoryIOManager.scala 101:39]
        node _T_8 = bits(io.MemoryIOPort.readAddr, 7, 0) @[chiselv/src/MemoryIOManager.scala 102:23]
        node _T_9 = eq(_T_8, UInt<3>(0h4)) @[chiselv/src/MemoryIOManager.scala 102:30]
        when _T_9 : @[chiselv/src/MemoryIOManager.scala 102:42]
          when io.UART0Port.rxQueue.valid : @[chiselv/src/MemoryIOManager.scala 104:42]
            connect io.UART0Port.rxQueue.ready, UInt<1>(0h1) @[chiselv/src/MemoryIOManager.scala 105:38]
            connect dataOut, io.UART0Port.rxQueue.bits @[chiselv/src/MemoryIOManager.scala 106:38]
        else :
          node _T_10 = bits(io.MemoryIOPort.readAddr, 7, 0) @[chiselv/src/MemoryIOManager.scala 110:30]
          node _T_11 = eq(_T_10, UInt<4>(0hc)) @[chiselv/src/MemoryIOManager.scala 110:37]
          when _T_11 : @[chiselv/src/MemoryIOManager.scala 110:49]
            node dataOut_lo = cat(io.UART0Port.txEmpty, io.UART0Port.rxEmpty) @[chiselv/src/MemoryIOManager.scala 111:25]
            node dataOut_hi = cat(io.UART0Port.txFull, io.UART0Port.rxFull) @[chiselv/src/MemoryIOManager.scala 111:25]
            node _dataOut_T = cat(dataOut_hi, dataOut_lo) @[chiselv/src/MemoryIOManager.scala 111:25]
            connect dataOut, _dataOut_T @[chiselv/src/MemoryIOManager.scala 111:19]
          else :
            connect dataOut, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 114:28]
      when io.MemoryIOPort.writeRequest : @[chiselv/src/MemoryIOManager.scala 117:40]
        node _T_12 = bits(io.MemoryIOPort.writeAddr, 7, 0) @[chiselv/src/MemoryIOManager.scala 118:24]
        node _T_13 = eq(_T_12, UInt<1>(0h0)) @[chiselv/src/MemoryIOManager.scala 118:31]
        when _T_13 : @[chiselv/src/MemoryIOManager.scala 118:43]
          connect io.UART0Port.txQueue.valid, UInt<1>(0h1) @[chiselv/src/MemoryIOManager.scala 120:36]
          node _io_UART0Port_txQueue_bits_T = bits(io.MemoryIOPort.writeData, 7, 0) @[chiselv/src/MemoryIOManager.scala 121:64]
          connect io.UART0Port.txQueue.bits, _io_UART0Port_txQueue_bits_T @[chiselv/src/MemoryIOManager.scala 121:36]
        else :
          node _T_14 = bits(io.MemoryIOPort.writeAddr, 7, 0) @[chiselv/src/MemoryIOManager.scala 124:31]
          node _T_15 = eq(_T_14, UInt<5>(0h10)) @[chiselv/src/MemoryIOManager.scala 124:38]
          when _T_15 : @[chiselv/src/MemoryIOManager.scala 124:50]
            connect io.UART0Port.clockDivisor.valid, UInt<1>(0h1) @[chiselv/src/MemoryIOManager.scala 125:43]
            node _io_UART0Port_clockDivisor_bits_T = bits(io.MemoryIOPort.writeData, 7, 0) @[chiselv/src/MemoryIOManager.scala 126:71]
            connect io.UART0Port.clockDivisor.bits, _io_UART0Port_clockDivisor_bits_T @[chiselv/src/MemoryIOManager.scala 126:43]
    node _T_16 = bits(io.MemoryIOPort.readAddr, 31, 12) @[chiselv/src/MemoryIOManager.scala 132:19]
    node _T_17 = eq(_T_16, UInt<18>(0h30001)) @[chiselv/src/MemoryIOManager.scala 132:28]
    node _T_18 = bits(io.MemoryIOPort.writeAddr, 31, 12) @[chiselv/src/MemoryIOManager.scala 132:59]
    node _T_19 = eq(_T_18, UInt<18>(0h30001)) @[chiselv/src/MemoryIOManager.scala 132:68]
    node _T_20 = or(_T_17, _T_19) @[chiselv/src/MemoryIOManager.scala 132:44]
    when _T_20 : @[chiselv/src/MemoryIOManager.scala 132:85]
      when io.MemoryIOPort.readRequest : @[chiselv/src/MemoryIOManager.scala 134:39]
        node _T_21 = bits(io.MemoryIOPort.readAddr, 7, 0) @[chiselv/src/MemoryIOManager.scala 136:23]
        node _T_22 = eq(_T_21, UInt<1>(0h0)) @[chiselv/src/MemoryIOManager.scala 136:30]
        when _T_22 : @[chiselv/src/MemoryIOManager.scala 136:42]
          connect dataOut, io.GPIO0Port.directionOut @[chiselv/src/MemoryIOManager.scala 137:17]
        else :
          node _T_23 = bits(io.MemoryIOPort.readAddr, 7, 0) @[chiselv/src/MemoryIOManager.scala 140:30]
          node _T_24 = eq(_T_23, UInt<3>(0h4)) @[chiselv/src/MemoryIOManager.scala 140:37]
          when _T_24 : @[chiselv/src/MemoryIOManager.scala 140:49]
            connect dataOut, io.GPIO0Port.valueOut @[chiselv/src/MemoryIOManager.scala 141:19]
          else :
            connect dataOut, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 143:28]
      when io.MemoryIOPort.writeRequest : @[chiselv/src/MemoryIOManager.scala 146:40]
        node _T_25 = bits(io.MemoryIOPort.writeAddr, 7, 0) @[chiselv/src/MemoryIOManager.scala 148:24]
        node _T_26 = eq(_T_25, UInt<1>(0h0)) @[chiselv/src/MemoryIOManager.scala 148:31]
        when _T_26 : @[chiselv/src/MemoryIOManager.scala 148:43]
          connect io.GPIO0Port.writeDirection, io.MemoryIOPort.writeRequest @[chiselv/src/MemoryIOManager.scala 149:37]
        else :
          node _T_27 = bits(io.MemoryIOPort.writeAddr, 7, 0) @[chiselv/src/MemoryIOManager.scala 152:31]
          node _T_28 = eq(_T_27, UInt<3>(0h4)) @[chiselv/src/MemoryIOManager.scala 152:38]
          when _T_28 : @[chiselv/src/MemoryIOManager.scala 152:50]
            connect io.GPIO0Port.writeValue, io.MemoryIOPort.writeRequest @[chiselv/src/MemoryIOManager.scala 153:35]
        connect io.GPIO0Port.dataIn, io.MemoryIOPort.writeData @[chiselv/src/MemoryIOManager.scala 155:27]
    node _T_29 = bits(io.MemoryIOPort.readAddr, 31, 12) @[chiselv/src/MemoryIOManager.scala 161:19]
    node _T_30 = eq(_T_29, UInt<18>(0h30002)) @[chiselv/src/MemoryIOManager.scala 161:28]
    node _T_31 = bits(io.MemoryIOPort.writeAddr, 31, 12) @[chiselv/src/MemoryIOManager.scala 161:59]
    node _T_32 = eq(_T_31, UInt<18>(0h30002)) @[chiselv/src/MemoryIOManager.scala 161:68]
    node _T_33 = or(_T_30, _T_32) @[chiselv/src/MemoryIOManager.scala 161:44]
    when _T_33 : @[chiselv/src/MemoryIOManager.scala 161:85]
      connect dataOut, UInt<1>(0h0) @[chiselv/src/MemoryIOManager.scala 162:13]
    node _T_34 = bits(io.MemoryIOPort.readAddr, 31, 12) @[chiselv/src/MemoryIOManager.scala 166:19]
    node _T_35 = eq(_T_34, UInt<18>(0h30003)) @[chiselv/src/MemoryIOManager.scala 166:28]
    node _T_36 = bits(io.MemoryIOPort.writeAddr, 31, 12) @[chiselv/src/MemoryIOManager.scala 166:59]
    node _T_37 = eq(_T_36, UInt<18>(0h30003)) @[chiselv/src/MemoryIOManager.scala 166:68]
    node _T_38 = or(_T_35, _T_37) @[chiselv/src/MemoryIOManager.scala 166:44]
    when _T_38 : @[chiselv/src/MemoryIOManager.scala 166:85]
      when io.MemoryIOPort.writeRequest : @[chiselv/src/MemoryIOManager.scala 167:40]
        connect io.Timer0Port.writeEnable, io.MemoryIOPort.writeRequest @[chiselv/src/MemoryIOManager.scala 168:33]
        connect io.Timer0Port.dataIn, io.MemoryIOPort.writeData @[chiselv/src/MemoryIOManager.scala 169:33]
      when io.MemoryIOPort.readRequest : @[chiselv/src/MemoryIOManager.scala 171:39]
        connect dataOut, io.Timer0Port.dataOut @[chiselv/src/MemoryIOManager.scala 172:15]
    node _T_39 = bits(io.MemoryIOPort.readAddr, 31, 28) @[chiselv/src/MemoryIOManager.scala 177:19]
    node _T_40 = eq(_T_39, UInt<4>(0h8)) @[chiselv/src/MemoryIOManager.scala 177:28]
    node _T_41 = bits(io.MemoryIOPort.writeAddr, 31, 28) @[chiselv/src/MemoryIOManager.scala 177:53]
    node _T_42 = eq(_T_41, UInt<4>(0h8)) @[chiselv/src/MemoryIOManager.scala 177:62]
    node _T_43 = or(_T_40, _T_42) @[chiselv/src/MemoryIOManager.scala 177:38]
    when _T_43 : @[chiselv/src/MemoryIOManager.scala 177:73]
      connect stallLatency, UInt<1>(0h1) @[chiselv/src/MemoryIOManager.scala 179:32]
      connect stallEnable, UInt<1>(0h1) @[chiselv/src/MemoryIOManager.scala 180:32]
      node _io_DataMemPort_readAddress_T = mux(UInt<1>(0h0), UInt<4>(0hf), UInt<4>(0h0)) @[chiselv/src/MemoryIOManager.scala 181:43]
      node _io_DataMemPort_readAddress_T_1 = bits(io.MemoryIOPort.readAddr, 27, 0) @[chiselv/src/MemoryIOManager.scala 181:64]
      node _io_DataMemPort_readAddress_T_2 = cat(_io_DataMemPort_readAddress_T, _io_DataMemPort_readAddress_T_1) @[chiselv/src/MemoryIOManager.scala 181:38]
      connect io.DataMemPort.readAddress, _io_DataMemPort_readAddress_T_2 @[chiselv/src/MemoryIOManager.scala 181:32]
      node _T_44 = eq(UInt<2>(0h3), io.MemoryIOPort.dataSize) @[chiselv/src/MemoryIOManager.scala 183:38]
      when _T_44 : @[chiselv/src/MemoryIOManager.scala 183:38]
        connect dataOut, io.DataMemPort.readData @[chiselv/src/MemoryIOManager.scala 184:23]
      else :
        node _T_45 = eq(UInt<2>(0h2), io.MemoryIOPort.dataSize) @[chiselv/src/MemoryIOManager.scala 183:38]
        when _T_45 : @[chiselv/src/MemoryIOManager.scala 183:38]
          node _T_46 = bits(io.DataMemPort.readAddress, 1, 1) @[chiselv/src/MemoryIOManager.scala 186:42]
          node _T_47 = eq(UInt<1>(0h1), _T_46) @[chiselv/src/MemoryIOManager.scala 186:54]
          when _T_47 : @[chiselv/src/MemoryIOManager.scala 186:54]
            node _dataOut_T_1 = mux(UInt<1>(0h0), UInt<16>(0hffff), UInt<16>(0h0)) @[chiselv/src/MemoryIOManager.scala 187:38]
            node _dataOut_T_2 = bits(io.DataMemPort.readData, 31, 16) @[chiselv/src/MemoryIOManager.scala 187:72]
            node _dataOut_T_3 = cat(_dataOut_T_1, _dataOut_T_2) @[chiselv/src/MemoryIOManager.scala 187:33]
            connect dataOut, _dataOut_T_3 @[chiselv/src/MemoryIOManager.scala 187:27]
          else :
            node _T_48 = eq(UInt<1>(0h0), _T_46) @[chiselv/src/MemoryIOManager.scala 186:54]
            when _T_48 : @[chiselv/src/MemoryIOManager.scala 186:54]
              node _dataOut_T_4 = mux(UInt<1>(0h0), UInt<16>(0hffff), UInt<16>(0h0)) @[chiselv/src/MemoryIOManager.scala 188:38]
              node _dataOut_T_5 = bits(io.DataMemPort.readData, 15, 0) @[chiselv/src/MemoryIOManager.scala 188:72]
              node _dataOut_T_6 = cat(_dataOut_T_4, _dataOut_T_5) @[chiselv/src/MemoryIOManager.scala 188:33]
              connect dataOut, _dataOut_T_6 @[chiselv/src/MemoryIOManager.scala 188:27]
        else :
          node _T_49 = eq(UInt<1>(0h1), io.MemoryIOPort.dataSize) @[chiselv/src/MemoryIOManager.scala 183:38]
          when _T_49 : @[chiselv/src/MemoryIOManager.scala 183:38]
            node _T_50 = bits(io.DataMemPort.readAddress, 1, 0) @[chiselv/src/MemoryIOManager.scala 192:42]
            node _T_51 = eq(UInt<2>(0h3), _T_50) @[chiselv/src/MemoryIOManager.scala 192:50]
            when _T_51 : @[chiselv/src/MemoryIOManager.scala 192:50]
              node _dataOut_T_7 = mux(UInt<1>(0h0), UInt<24>(0hffffff), UInt<24>(0h0)) @[chiselv/src/MemoryIOManager.scala 193:38]
              node _dataOut_T_8 = bits(io.DataMemPort.readData, 31, 24) @[chiselv/src/MemoryIOManager.scala 193:72]
              node _dataOut_T_9 = cat(_dataOut_T_7, _dataOut_T_8) @[chiselv/src/MemoryIOManager.scala 193:33]
              connect dataOut, _dataOut_T_9 @[chiselv/src/MemoryIOManager.scala 193:27]
            else :
              node _T_52 = eq(UInt<2>(0h2), _T_50) @[chiselv/src/MemoryIOManager.scala 192:50]
              when _T_52 : @[chiselv/src/MemoryIOManager.scala 192:50]
                node _dataOut_T_10 = mux(UInt<1>(0h0), UInt<24>(0hffffff), UInt<24>(0h0)) @[chiselv/src/MemoryIOManager.scala 194:38]
                node _dataOut_T_11 = bits(io.DataMemPort.readData, 23, 16) @[chiselv/src/MemoryIOManager.scala 194:72]
                node _dataOut_T_12 = cat(_dataOut_T_10, _dataOut_T_11) @[chiselv/src/MemoryIOManager.scala 194:33]
                connect dataOut, _dataOut_T_12 @[chiselv/src/MemoryIOManager.scala 194:27]
              else :
                node _T_53 = eq(UInt<1>(0h1), _T_50) @[chiselv/src/MemoryIOManager.scala 192:50]
                when _T_53 : @[chiselv/src/MemoryIOManager.scala 192:50]
                  node _dataOut_T_13 = mux(UInt<1>(0h0), UInt<24>(0hffffff), UInt<24>(0h0)) @[chiselv/src/MemoryIOManager.scala 195:38]
                  node _dataOut_T_14 = bits(io.DataMemPort.readData, 15, 8) @[chiselv/src/MemoryIOManager.scala 195:72]
                  node _dataOut_T_15 = cat(_dataOut_T_13, _dataOut_T_14) @[chiselv/src/MemoryIOManager.scala 195:33]
                  connect dataOut, _dataOut_T_15 @[chiselv/src/MemoryIOManager.scala 195:27]
                else :
                  node _T_54 = eq(UInt<1>(0h0), _T_50) @[chiselv/src/MemoryIOManager.scala 192:50]
                  when _T_54 : @[chiselv/src/MemoryIOManager.scala 192:50]
                    node _dataOut_T_16 = mux(UInt<1>(0h0), UInt<24>(0hffffff), UInt<24>(0h0)) @[chiselv/src/MemoryIOManager.scala 196:38]
                    node _dataOut_T_17 = bits(io.DataMemPort.readData, 7, 0) @[chiselv/src/MemoryIOManager.scala 196:72]
                    node _dataOut_T_18 = cat(_dataOut_T_16, _dataOut_T_17) @[chiselv/src/MemoryIOManager.scala 196:33]
                    connect dataOut, _dataOut_T_18 @[chiselv/src/MemoryIOManager.scala 196:27]
      when io.MemoryIOPort.writeRequest : @[chiselv/src/MemoryIOManager.scala 201:40]
        node _T_55 = eq(io.stall, UInt<1>(0h0)) @[chiselv/src/MemoryIOManager.scala 202:12]
        when _T_55 : @[chiselv/src/MemoryIOManager.scala 202:23]
          wire dataToWrite : UInt<32> @[chiselv/src/MemoryIOManager.scala 203:38]
          connect dataToWrite, UInt<32>(0h0) @[chiselv/src/MemoryIOManager.scala 203:38]
          wire writeMask : UInt<4> @[chiselv/src/MemoryIOManager.scala 204:38]
          connect writeMask, UInt<4>(0h0) @[chiselv/src/MemoryIOManager.scala 204:38]
          node _io_DataMemPort_writeAddress_T = mux(UInt<1>(0h0), UInt<4>(0hf), UInt<4>(0h0)) @[chiselv/src/MemoryIOManager.scala 206:48]
          node _io_DataMemPort_writeAddress_T_1 = bits(io.MemoryIOPort.writeAddr, 27, 0) @[chiselv/src/MemoryIOManager.scala 206:70]
          node _io_DataMemPort_writeAddress_T_2 = cat(_io_DataMemPort_writeAddress_T, _io_DataMemPort_writeAddress_T_1) @[chiselv/src/MemoryIOManager.scala 206:43]
          connect io.DataMemPort.writeAddress, _io_DataMemPort_writeAddress_T_2 @[chiselv/src/MemoryIOManager.scala 206:37]
          connect io.DataMemPort.writeEnable, io.MemoryIOPort.writeRequest @[chiselv/src/MemoryIOManager.scala 207:37]
          node _T_56 = eq(UInt<2>(0h3), io.MemoryIOPort.dataSize) @[chiselv/src/MemoryIOManager.scala 209:42]
          when _T_56 : @[chiselv/src/MemoryIOManager.scala 209:42]
            connect dataToWrite, io.MemoryIOPort.writeData @[chiselv/src/MemoryIOManager.scala 211:25]
            connect writeMask, UInt<4>(0hf) @[chiselv/src/MemoryIOManager.scala 212:25]
          else :
            node _T_57 = eq(UInt<2>(0h2), io.MemoryIOPort.dataSize) @[chiselv/src/MemoryIOManager.scala 209:42]
            when _T_57 : @[chiselv/src/MemoryIOManager.scala 209:42]
              node _T_58 = bits(io.DataMemPort.writeAddress, 1, 1) @[chiselv/src/MemoryIOManager.scala 215:47]
              node _T_59 = eq(UInt<1>(0h1), _T_58) @[chiselv/src/MemoryIOManager.scala 215:59]
              when _T_59 : @[chiselv/src/MemoryIOManager.scala 215:59]
                node _dataToWrite_T = bits(io.MemoryIOPort.writeData, 15, 0) @[chiselv/src/MemoryIOManager.scala 217:61]
                node _dataToWrite_T_1 = mux(UInt<1>(0h0), UInt<16>(0hffff), UInt<16>(0h0)) @[chiselv/src/MemoryIOManager.scala 217:81]
                node _dataToWrite_T_2 = cat(_dataToWrite_T, _dataToWrite_T_1) @[chiselv/src/MemoryIOManager.scala 217:35]
                connect dataToWrite, _dataToWrite_T_2 @[chiselv/src/MemoryIOManager.scala 217:29]
                connect writeMask, UInt<4>(0hc) @[chiselv/src/MemoryIOManager.scala 218:29]
              else :
                node _T_60 = eq(UInt<1>(0h0), _T_58) @[chiselv/src/MemoryIOManager.scala 215:59]
                when _T_60 : @[chiselv/src/MemoryIOManager.scala 215:59]
                  node _dataToWrite_T_3 = mux(UInt<1>(0h0), UInt<16>(0hffff), UInt<16>(0h0)) @[chiselv/src/MemoryIOManager.scala 221:40]
                  node _dataToWrite_T_4 = bits(io.MemoryIOPort.writeData, 15, 0) @[chiselv/src/MemoryIOManager.scala 221:76]
                  node _dataToWrite_T_5 = cat(_dataToWrite_T_3, _dataToWrite_T_4) @[chiselv/src/MemoryIOManager.scala 221:35]
                  connect dataToWrite, _dataToWrite_T_5 @[chiselv/src/MemoryIOManager.scala 221:29]
                  connect writeMask, UInt<2>(0h3) @[chiselv/src/MemoryIOManager.scala 222:29]
            else :
              node _T_61 = eq(UInt<1>(0h1), io.MemoryIOPort.dataSize) @[chiselv/src/MemoryIOManager.scala 209:42]
              when _T_61 : @[chiselv/src/MemoryIOManager.scala 209:42]
                node _T_62 = bits(io.DataMemPort.writeAddress, 1, 0) @[chiselv/src/MemoryIOManager.scala 227:47]
                node _T_63 = eq(UInt<2>(0h3), _T_62) @[chiselv/src/MemoryIOManager.scala 227:55]
                when _T_63 : @[chiselv/src/MemoryIOManager.scala 227:55]
                  node _dataToWrite_T_6 = bits(io.MemoryIOPort.writeData, 7, 0) @[chiselv/src/MemoryIOManager.scala 229:61]
                  node _dataToWrite_T_7 = mux(UInt<1>(0h0), UInt<24>(0hffffff), UInt<24>(0h0)) @[chiselv/src/MemoryIOManager.scala 229:80]
                  node _dataToWrite_T_8 = cat(_dataToWrite_T_6, _dataToWrite_T_7) @[chiselv/src/MemoryIOManager.scala 229:35]
                  connect dataToWrite, _dataToWrite_T_8 @[chiselv/src/MemoryIOManager.scala 229:29]
                  connect writeMask, UInt<4>(0h8) @[chiselv/src/MemoryIOManager.scala 230:29]
                else :
                  node _T_64 = eq(UInt<2>(0h2), _T_62) @[chiselv/src/MemoryIOManager.scala 227:55]
                  when _T_64 : @[chiselv/src/MemoryIOManager.scala 227:55]
                    node _dataToWrite_T_9 = mux(UInt<1>(0h0), UInt<8>(0hff), UInt<8>(0h0)) @[chiselv/src/MemoryIOManager.scala 233:40]
                    node _dataToWrite_T_10 = bits(io.MemoryIOPort.writeData, 7, 0) @[chiselv/src/MemoryIOManager.scala 233:75]
                    node _dataToWrite_T_11 = mux(UInt<1>(0h0), UInt<16>(0hffff), UInt<16>(0h0)) @[chiselv/src/MemoryIOManager.scala 233:94]
                    node dataToWrite_hi = cat(_dataToWrite_T_9, _dataToWrite_T_10) @[chiselv/src/MemoryIOManager.scala 233:35]
                    node _dataToWrite_T_12 = cat(dataToWrite_hi, _dataToWrite_T_11) @[chiselv/src/MemoryIOManager.scala 233:35]
                    connect dataToWrite, _dataToWrite_T_12 @[chiselv/src/MemoryIOManager.scala 233:29]
                    connect writeMask, UInt<3>(0h4) @[chiselv/src/MemoryIOManager.scala 234:29]
                  else :
                    node _T_65 = eq(UInt<1>(0h1), _T_62) @[chiselv/src/MemoryIOManager.scala 227:55]
                    when _T_65 : @[chiselv/src/MemoryIOManager.scala 227:55]
                      node _dataToWrite_T_13 = mux(UInt<1>(0h0), UInt<16>(0hffff), UInt<16>(0h0)) @[chiselv/src/MemoryIOManager.scala 237:40]
                      node _dataToWrite_T_14 = bits(io.MemoryIOPort.writeData, 7, 0) @[chiselv/src/MemoryIOManager.scala 237:76]
                      node _dataToWrite_T_15 = mux(UInt<1>(0h0), UInt<8>(0hff), UInt<8>(0h0)) @[chiselv/src/MemoryIOManager.scala 237:95]
                      node dataToWrite_hi_1 = cat(_dataToWrite_T_13, _dataToWrite_T_14) @[chiselv/src/MemoryIOManager.scala 237:35]
                      node _dataToWrite_T_16 = cat(dataToWrite_hi_1, _dataToWrite_T_15) @[chiselv/src/MemoryIOManager.scala 237:35]
                      connect dataToWrite, _dataToWrite_T_16 @[chiselv/src/MemoryIOManager.scala 237:29]
                      connect writeMask, UInt<2>(0h2) @[chiselv/src/MemoryIOManager.scala 238:29]
                    else :
                      node _T_66 = eq(UInt<1>(0h0), _T_62) @[chiselv/src/MemoryIOManager.scala 227:55]
                      when _T_66 : @[chiselv/src/MemoryIOManager.scala 227:55]
                        node _dataToWrite_T_17 = mux(UInt<1>(0h0), UInt<24>(0hffffff), UInt<24>(0h0)) @[chiselv/src/MemoryIOManager.scala 241:40]
                        node _dataToWrite_T_18 = bits(io.MemoryIOPort.writeData, 7, 0) @[chiselv/src/MemoryIOManager.scala 241:76]
                        node _dataToWrite_T_19 = cat(_dataToWrite_T_17, _dataToWrite_T_18) @[chiselv/src/MemoryIOManager.scala 241:35]
                        connect dataToWrite, _dataToWrite_T_19 @[chiselv/src/MemoryIOManager.scala 241:29]
                        connect writeMask, UInt<1>(0h1) @[chiselv/src/MemoryIOManager.scala 242:29]
          node _dataIn_T = bits(writeMask, 3, 3) @[chiselv/src/MemoryIOManager.scala 249:24]
          node _dataIn_T_1 = bits(dataToWrite, 31, 24) @[chiselv/src/MemoryIOManager.scala 249:40]
          node _dataIn_T_2 = bits(io.DataMemPort.readData, 31, 24) @[chiselv/src/MemoryIOManager.scala 249:83]
          node _dataIn_T_3 = mux(_dataIn_T, _dataIn_T_1, _dataIn_T_2) @[chiselv/src/MemoryIOManager.scala 249:14]
          node _dataIn_T_4 = bits(writeMask, 2, 2) @[chiselv/src/MemoryIOManager.scala 250:24]
          node _dataIn_T_5 = bits(dataToWrite, 23, 16) @[chiselv/src/MemoryIOManager.scala 250:40]
          node _dataIn_T_6 = bits(io.DataMemPort.readData, 23, 16) @[chiselv/src/MemoryIOManager.scala 250:83]
          node _dataIn_T_7 = mux(_dataIn_T_4, _dataIn_T_5, _dataIn_T_6) @[chiselv/src/MemoryIOManager.scala 250:14]
          node _dataIn_T_8 = bits(writeMask, 1, 1) @[chiselv/src/MemoryIOManager.scala 251:24]
          node _dataIn_T_9 = bits(dataToWrite, 15, 8) @[chiselv/src/MemoryIOManager.scala 251:40]
          node _dataIn_T_10 = bits(io.DataMemPort.readData, 15, 8) @[chiselv/src/MemoryIOManager.scala 251:83]
          node _dataIn_T_11 = mux(_dataIn_T_8, _dataIn_T_9, _dataIn_T_10) @[chiselv/src/MemoryIOManager.scala 251:14]
          node _dataIn_T_12 = bits(writeMask, 0, 0) @[chiselv/src/MemoryIOManager.scala 252:24]
          node _dataIn_T_13 = bits(dataToWrite, 7, 0) @[chiselv/src/MemoryIOManager.scala 252:40]
          node _dataIn_T_14 = bits(io.DataMemPort.readData, 7, 0) @[chiselv/src/MemoryIOManager.scala 252:83]
          node _dataIn_T_15 = mux(_dataIn_T_12, _dataIn_T_13, _dataIn_T_14) @[chiselv/src/MemoryIOManager.scala 252:14]
          node dataIn_lo = cat(_dataIn_T_11, _dataIn_T_15) @[chiselv/src/MemoryIOManager.scala 248:25]
          node dataIn_hi = cat(_dataIn_T_3, _dataIn_T_7) @[chiselv/src/MemoryIOManager.scala 248:25]
          node dataIn = cat(dataIn_hi, dataIn_lo) @[chiselv/src/MemoryIOManager.scala 248:25]
          connect io.DataMemPort.writeData, dataIn @[chiselv/src/MemoryIOManager.scala 254:34]
          connect dataOut, dataIn @[chiselv/src/MemoryIOManager.scala 255:34]
    connect io.MemoryIOPort.readData, dataOut @[chiselv/src/MemoryIOManager.scala 260:28]

  module GPIO : @[chiselv/src/GPIO.scala 22:7]
    input clock : Clock @[chiselv/src/GPIO.scala 22:7]
    input reset : Reset @[chiselv/src/GPIO.scala 22:7]
    output io : { GPIOPort : { flip dataIn : UInt<32>, valueOut : UInt<32>, directionOut : UInt<32>, flip writeValue : UInt<1>, flip writeDirection : UInt<1>, stall : UInt<1>}, externalPort : { flip in : UInt<8>, out : UInt<8>, directionOut : UInt<8>}} @[chiselv/src/GPIO.scala 31:14]

    regreset GPIO : UInt<32>, clock, reset, UInt<32>(0h0) @[chiselv/src/GPIO.scala 36:26]
    regreset direction : UInt<32>, clock, reset, UInt<32>(0h0) @[chiselv/src/GPIO.scala 37:26]
    connect io.GPIOPort.stall, UInt<1>(0h0) @[chiselv/src/GPIO.scala 39:28]
    connect io.GPIOPort.directionOut, direction @[chiselv/src/GPIO.scala 40:28]
    connect io.externalPort.out, GPIO @[chiselv/src/GPIO.scala 48:28]
    connect io.GPIOPort.valueOut, io.externalPort.out @[chiselv/src/GPIO.scala 49:28]
    connect io.externalPort.directionOut, direction @[chiselv/src/GPIO.scala 50:28]
    when io.GPIOPort.writeValue : @[chiselv/src/GPIO.scala 64:32]
      connect GPIO, io.GPIOPort.dataIn @[chiselv/src/GPIO.scala 65:10]
    when io.GPIOPort.writeDirection : @[chiselv/src/GPIO.scala 67:36]
      connect direction, io.GPIOPort.dataIn @[chiselv/src/GPIO.scala 68:15]


  module Timer : @[chiselv/src/Timer.scala 13:7]
    input clock : Clock @[chiselv/src/Timer.scala 13:7]
    input reset : Reset @[chiselv/src/Timer.scala 13:7]
    output io : { flip dataIn : UInt<32>, dataOut : UInt<32>, flip writeEnable : UInt<1>, stall : UInt<1>} @[chiselv/src/Timer.scala 14:14]

    regreset counter : UInt<32>, clock, reset, UInt<32>(0h0) @[chiselv/src/Timer.scala 16:24]
    when io.writeEnable : @[chiselv/src/Timer.scala 18:24]
      connect counter, io.dataIn @[chiselv/src/Timer.scala 19:13]
    else :
      regreset counterWrap_c_value : UInt<10>, clock, reset, UInt<10>(0h0) @[src/main/scala/chisel3/util/Counter.scala 61:40]
      wire counterWrap : UInt<1> @[src/main/scala/chisel3/util/Counter.scala 117:24]
      connect counterWrap, UInt<1>(0h0) @[src/main/scala/chisel3/util/Counter.scala 117:24]
      when UInt<1>(0h1) : @[src/main/scala/chisel3/util/Counter.scala 118:16]
        node counterWrap_wrap_wrap = eq(counterWrap_c_value, UInt<10>(0h3e7)) @[src/main/scala/chisel3/util/Counter.scala 73:24]
        node _counterWrap_wrap_value_T = add(counterWrap_c_value, UInt<1>(0h1)) @[src/main/scala/chisel3/util/Counter.scala 77:24]
        node _counterWrap_wrap_value_T_1 = tail(_counterWrap_wrap_value_T, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
        connect counterWrap_c_value, _counterWrap_wrap_value_T_1 @[src/main/scala/chisel3/util/Counter.scala 77:15]
        when counterWrap_wrap_wrap : @[src/main/scala/chisel3/util/Counter.scala 87:20]
          connect counterWrap_c_value, UInt<1>(0h0) @[src/main/scala/chisel3/util/Counter.scala 87:28]
        connect counterWrap, counterWrap_wrap_wrap @[src/main/scala/chisel3/util/Counter.scala 118:23]
      when counterWrap : @[chiselv/src/Timer.scala 23:23]
        node _counter_T = add(counter, UInt<1>(0h1)) @[chiselv/src/Timer.scala 24:26]
        node _counter_T_1 = tail(_counter_T, 1) @[chiselv/src/Timer.scala 24:26]
        connect counter, _counter_T_1 @[chiselv/src/Timer.scala 24:15]
    connect io.dataOut, counter @[chiselv/src/Timer.scala 27:14]
    connect io.stall, UInt<1>(0h0) @[chiselv/src/Timer.scala 28:14]

  module RVFICPUWrapper : @[chiselv/src/RVFI_Wrapper.scala 33:7]
    input clock : Clock @[chiselv/src/RVFI_Wrapper.scala 33:7]
    input reset : Reset @[chiselv/src/RVFI_Wrapper.scala 33:7]
    output io : { GPIO0External : { flip in : UInt<8>, out : UInt<8>, directionOut : UInt<8>}, flip UART0Port : { rxQueue : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, flip txQueue : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, rxEmpty : UInt<1>, txEmpty : UInt<1>, rxFull : UInt<1>, txFull : UInt<1>, flip clockDivisor : { valid : UInt<1>, bits : UInt<8>}}, flip SysconPort : { flip Address : UInt<12>, DataOut : UInt<32>}, flip instructionMemPort : { flip readAddr : UInt<16>, readData : UInt<32>, ready : UInt<1>}, flip dataMemPort : { flip readAddress : UInt<16>, readData : UInt<32>, flip writeAddress : UInt<16>, flip writeData : UInt<32>, flip writeMask : UInt<4>, flip dataSize : UInt<2>, flip writeEnable : UInt<1>}} @[chiselv/src/CPUSingleCycle.scala 17:14]
    output rvfi : { valid : UInt<1>, order : UInt<64>, insn : UInt<32>, trap : UInt<1>, halt : UInt<1>, intr : UInt<1>, ixl : UInt<2>, mode : UInt<2>, rs1_addr : UInt<5>, rs1_rdata : UInt<32>, rs2_addr : UInt<5>, rs2_rdata : UInt<32>, rd_addr : UInt<5>, rd_wdata : UInt<32>, pc_rdata : UInt<32>, pc_wdata : UInt<32>, mem_addr : UInt<32>, mem_rmask : UInt<4>, mem_wmask : UInt<4>, mem_rdata : UInt<32>, mem_wdata : UInt<32>} @[chiselv/src/RVFI_Wrapper.scala 50:16]

    wire stall : UInt<1> @[chiselv/src/CPUSingleCycle.scala 25:26]
    connect stall, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 25:26]
    inst registerBank of RegisterBank @[chiselv/src/CPUSingleCycle.scala 28:28]
    connect registerBank.clock, clock
    connect registerBank.reset, reset
    connect registerBank.io.writeEnable, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 29:31]
    connect registerBank.io.regwr_data, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 30:31]
    connect registerBank.io.stall, stall @[chiselv/src/CPUSingleCycle.scala 31:31]
    inst PC of ProgramCounter @[chiselv/src/CPUSingleCycle.scala 34:18]
    connect PC.clock, clock
    connect PC.reset, reset
    connect PC.io.writeEnable, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 35:21]
    connect PC.io.dataIn, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 36:21]
    connect PC.io.writeAdd, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 37:21]
    inst ALU of ALU @[chiselv/src/CPUSingleCycle.scala 40:19]
    connect ALU.clock, clock
    connect ALU.reset, reset
    connect ALU.io.inst, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 41:15]
    connect ALU.io.a, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 42:15]
    connect ALU.io.b, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 43:15]
    inst decoder of Decoder @[chiselv/src/CPUSingleCycle.scala 46:23]
    connect decoder.clock, clock
    connect decoder.reset, reset
    connect decoder.io.op, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 47:17]
    inst memoryIOManager of MemoryIOManager @[chiselv/src/CPUSingleCycle.scala 50:31]
    connect memoryIOManager.clock, clock
    connect memoryIOManager.reset, reset
    connect memoryIOManager.io.MemoryIOPort.readRequest, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 51:48]
    connect memoryIOManager.io.MemoryIOPort.writeRequest, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 52:48]
    connect memoryIOManager.io.MemoryIOPort.readAddr, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 53:48]
    connect memoryIOManager.io.MemoryIOPort.writeAddr, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 54:48]
    connect memoryIOManager.io.MemoryIOPort.writeData, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 55:48]
    connect memoryIOManager.io.MemoryIOPort.dataSize, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 56:48]
    connect memoryIOManager.io.MemoryIOPort.writeMask, UInt<1>(0h0) @[chiselv/src/CPUSingleCycle.scala 57:48]
    connect memoryIOManager.io.DataMemPort, io.dataMemPort @[chiselv/src/CPUSingleCycle.scala 59:34]
    connect memoryIOManager.io.UART0Port, io.UART0Port @[chiselv/src/CPUSingleCycle.scala 60:32]
    connect memoryIOManager.io.SysconPort, io.SysconPort @[chiselv/src/CPUSingleCycle.scala 61:33]
    inst GPIO0 of GPIO @[chiselv/src/CPUSingleCycle.scala 64:21]
    connect GPIO0.clock, clock
    connect GPIO0.reset, reset
    connect memoryIOManager.io.GPIO0Port, GPIO0.io.GPIOPort @[chiselv/src/CPUSingleCycle.scala 65:32]
    connect io.GPIO0External.directionOut, GPIO0.io.externalPort.directionOut @[chiselv/src/CPUSingleCycle.scala 67:27]
    connect io.GPIO0External.out, GPIO0.io.externalPort.out @[chiselv/src/CPUSingleCycle.scala 67:27]
    connect GPIO0.io.externalPort.in, io.GPIO0External.in @[chiselv/src/CPUSingleCycle.scala 67:27]
    inst timer0 of Timer @[chiselv/src/CPUSingleCycle.scala 71:22]
    connect timer0.clock, clock
    connect timer0.reset, reset
    connect memoryIOManager.io.Timer0Port, timer0.io @[chiselv/src/CPUSingleCycle.scala 72:33]
    connect stall, memoryIOManager.io.stall @[chiselv/src/CPUSingleCycle.scala 76:9]
    node _T = eq(stall, UInt<1>(0h0)) @[chiselv/src/CPUSingleCycle.scala 77:8]
    when _T : @[chiselv/src/CPUSingleCycle.scala 77:16]
      connect PC.io.writeEnable, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 79:23]
      connect PC.io.dataIn, PC.io.PC4 @[chiselv/src/CPUSingleCycle.scala 80:23]
    when io.instructionMemPort.ready : @[chiselv/src/CPUSingleCycle.scala 84:37]
      connect io.instructionMemPort.readAddr, PC.io.PC @[chiselv/src/CPUSingleCycle.scala 85:36]
    else :
      invalidate io.instructionMemPort.readAddr @[chiselv/src/CPUSingleCycle.scala 87:36]
    connect decoder.io.op, io.instructionMemPort.readData @[chiselv/src/CPUSingleCycle.scala 91:17]
    connect registerBank.io.regwr_addr, decoder.io.rd @[chiselv/src/CPUSingleCycle.scala 94:30]
    connect registerBank.io.rs1_addr, decoder.io.rs1 @[chiselv/src/CPUSingleCycle.scala 95:30]
    connect registerBank.io.rs2_addr, decoder.io.rs2 @[chiselv/src/CPUSingleCycle.scala 96:30]
    when decoder.io.toALU : @[chiselv/src/CPUSingleCycle.scala 101:26]
      connect ALU.io.inst, decoder.io.inst @[chiselv/src/CPUSingleCycle.scala 102:17]
      connect ALU.io.a, registerBank.io.rs1 @[chiselv/src/CPUSingleCycle.scala 103:17]
      node _ALU_io_b_T = asUInt(decoder.io.imm) @[chiselv/src/CPUSingleCycle.scala 106:22]
      node _ALU_io_b_T_1 = mux(decoder.io.use_imm, _ALU_io_b_T, registerBank.io.rs2) @[chiselv/src/CPUSingleCycle.scala 104:20]
      connect ALU.io.b, _ALU_io_b_T_1 @[chiselv/src/CPUSingleCycle.scala 104:14]
      connect registerBank.io.writeEnable, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 110:33]
      connect registerBank.io.regwr_data, ALU.io.x @[chiselv/src/CPUSingleCycle.scala 111:33]
    when decoder.io.branch : @[chiselv/src/CPUSingleCycle.scala 115:27]
      connect ALU.io.a, registerBank.io.rs1 @[chiselv/src/CPUSingleCycle.scala 116:14]
      connect ALU.io.b, registerBank.io.rs2 @[chiselv/src/CPUSingleCycle.scala 117:14]
      node _T_1 = asUInt(UInt<5>(0h16)) @[chiselv/src/CPUSingleCycle.scala 118:29]
      node _T_2 = asUInt(decoder.io.inst) @[chiselv/src/CPUSingleCycle.scala 118:29]
      node _T_3 = eq(_T_1, _T_2) @[chiselv/src/CPUSingleCycle.scala 118:29]
      when _T_3 : @[chiselv/src/CPUSingleCycle.scala 118:29]
        connect ALU.io.inst, UInt<6>(0h30) @[chiselv/src/CPUSingleCycle.scala 119:28]
      else :
        node _T_4 = asUInt(UInt<5>(0h17)) @[chiselv/src/CPUSingleCycle.scala 118:29]
        node _T_5 = asUInt(decoder.io.inst) @[chiselv/src/CPUSingleCycle.scala 118:29]
        node _T_6 = eq(_T_4, _T_5) @[chiselv/src/CPUSingleCycle.scala 118:29]
        when _T_6 : @[chiselv/src/CPUSingleCycle.scala 118:29]
          connect ALU.io.inst, UInt<6>(0h31) @[chiselv/src/CPUSingleCycle.scala 120:28]
        else :
          node _T_7 = asUInt(UInt<5>(0h18)) @[chiselv/src/CPUSingleCycle.scala 118:29]
          node _T_8 = asUInt(decoder.io.inst) @[chiselv/src/CPUSingleCycle.scala 118:29]
          node _T_9 = eq(_T_7, _T_8) @[chiselv/src/CPUSingleCycle.scala 118:29]
          when _T_9 : @[chiselv/src/CPUSingleCycle.scala 118:29]
            connect ALU.io.inst, UInt<5>(0h12) @[chiselv/src/CPUSingleCycle.scala 121:28]
          else :
            node _T_10 = asUInt(UInt<5>(0h19)) @[chiselv/src/CPUSingleCycle.scala 118:29]
            node _T_11 = asUInt(decoder.io.inst) @[chiselv/src/CPUSingleCycle.scala 118:29]
            node _T_12 = eq(_T_10, _T_11) @[chiselv/src/CPUSingleCycle.scala 118:29]
            when _T_12 : @[chiselv/src/CPUSingleCycle.scala 118:29]
              connect ALU.io.inst, UInt<6>(0h32) @[chiselv/src/CPUSingleCycle.scala 122:28]
            else :
              node _T_13 = asUInt(UInt<5>(0h1a)) @[chiselv/src/CPUSingleCycle.scala 118:29]
              node _T_14 = asUInt(decoder.io.inst) @[chiselv/src/CPUSingleCycle.scala 118:29]
              node _T_15 = eq(_T_13, _T_14) @[chiselv/src/CPUSingleCycle.scala 118:29]
              when _T_15 : @[chiselv/src/CPUSingleCycle.scala 118:29]
                connect ALU.io.inst, UInt<5>(0h14) @[chiselv/src/CPUSingleCycle.scala 123:28]
              else :
                node _T_16 = asUInt(UInt<5>(0h1b)) @[chiselv/src/CPUSingleCycle.scala 118:29]
                node _T_17 = asUInt(decoder.io.inst) @[chiselv/src/CPUSingleCycle.scala 118:29]
                node _T_18 = eq(_T_16, _T_17) @[chiselv/src/CPUSingleCycle.scala 118:29]
                when _T_18 : @[chiselv/src/CPUSingleCycle.scala 118:29]
                  connect ALU.io.inst, UInt<6>(0h33) @[chiselv/src/CPUSingleCycle.scala 124:28]
      node _T_19 = eq(ALU.io.x, UInt<1>(0h1)) @[chiselv/src/CPUSingleCycle.scala 126:19]
      when _T_19 : @[chiselv/src/CPUSingleCycle.scala 126:28]
        connect PC.io.writeEnable, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 127:25]
        connect PC.io.writeAdd, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 128:25]
        node _PC_io_dataIn_T = asUInt(decoder.io.imm) @[chiselv/src/CPUSingleCycle.scala 129:43]
        connect PC.io.dataIn, _PC_io_dataIn_T @[chiselv/src/CPUSingleCycle.scala 129:25]
    when decoder.io.jump : @[chiselv/src/CPUSingleCycle.scala 134:25]
      connect registerBank.io.writeEnable, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 136:33]
      connect ALU.io.inst, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 138:32]
      connect ALU.io.a, PC.io.PC @[chiselv/src/CPUSingleCycle.scala 139:32]
      connect ALU.io.b, UInt<3>(0h4) @[chiselv/src/CPUSingleCycle.scala 140:32]
      connect registerBank.io.regwr_data, ALU.io.x @[chiselv/src/CPUSingleCycle.scala 141:32]
      connect PC.io.writeEnable, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 143:23]
      node _T_20 = eq(decoder.io.inst, UInt<5>(0h1c)) @[chiselv/src/CPUSingleCycle.scala 144:26]
      when _T_20 : @[chiselv/src/CPUSingleCycle.scala 144:35]
        connect PC.io.writeAdd, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 146:22]
        node _PC_io_dataIn_T_1 = asUInt(decoder.io.imm) @[chiselv/src/CPUSingleCycle.scala 147:40]
        connect PC.io.dataIn, _PC_io_dataIn_T_1 @[chiselv/src/CPUSingleCycle.scala 147:22]
      node _T_21 = eq(decoder.io.inst, UInt<5>(0h1d)) @[chiselv/src/CPUSingleCycle.scala 149:26]
      when _T_21 : @[chiselv/src/CPUSingleCycle.scala 149:36]
        node _PC_io_dataIn_T_2 = asUInt(decoder.io.imm) @[chiselv/src/CPUSingleCycle.scala 152:47]
        node _PC_io_dataIn_T_3 = add(registerBank.io.rs1, _PC_io_dataIn_T_2) @[chiselv/src/CPUSingleCycle.scala 152:30]
        node _PC_io_dataIn_T_4 = tail(_PC_io_dataIn_T_3, 1) @[chiselv/src/CPUSingleCycle.scala 152:30]
        node _PC_io_dataIn_T_5 = bits(_PC_io_dataIn_T_4, 31, 1) @[chiselv/src/CPUSingleCycle.scala 152:54]
        node _PC_io_dataIn_T_6 = cat(_PC_io_dataIn_T_5, UInt<1>(0h0)) @[chiselv/src/CPUSingleCycle.scala 151:26]
        connect PC.io.dataIn, _PC_io_dataIn_T_6 @[chiselv/src/CPUSingleCycle.scala 151:20]
    node _T_22 = eq(decoder.io.inst, UInt<3>(0h4)) @[chiselv/src/CPUSingleCycle.scala 159:24]
    when _T_22 : @[chiselv/src/CPUSingleCycle.scala 159:33]
      connect registerBank.io.writeEnable, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 160:33]
      node _registerBank_io_regwr_data_T = asUInt(decoder.io.imm) @[chiselv/src/CPUSingleCycle.scala 161:51]
      connect registerBank.io.regwr_data, _registerBank_io_regwr_data_T @[chiselv/src/CPUSingleCycle.scala 161:33]
    node _T_23 = eq(decoder.io.inst, UInt<3>(0h5)) @[chiselv/src/CPUSingleCycle.scala 165:24]
    when _T_23 : @[chiselv/src/CPUSingleCycle.scala 165:35]
      connect registerBank.io.writeEnable, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 166:33]
      connect ALU.io.inst, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 167:33]
      connect ALU.io.a, PC.io.PC @[chiselv/src/CPUSingleCycle.scala 168:33]
      node _ALU_io_b_T_2 = asUInt(decoder.io.imm) @[chiselv/src/CPUSingleCycle.scala 170:22]
      connect ALU.io.b, _ALU_io_b_T_2 @[chiselv/src/CPUSingleCycle.scala 169:14]
      connect registerBank.io.regwr_data, ALU.io.x @[chiselv/src/CPUSingleCycle.scala 171:32]
    node _T_24 = or(decoder.io.is_load, decoder.io.is_store) @[chiselv/src/CPUSingleCycle.scala 175:27]
    when _T_24 : @[chiselv/src/CPUSingleCycle.scala 175:51]
      connect ALU.io.inst, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 177:17]
      connect ALU.io.a, registerBank.io.rs1 @[chiselv/src/CPUSingleCycle.scala 178:17]
      node _ALU_io_b_T_3 = asUInt(decoder.io.imm) @[chiselv/src/CPUSingleCycle.scala 179:35]
      connect ALU.io.b, _ALU_io_b_T_3 @[chiselv/src/CPUSingleCycle.scala 179:17]
      connect memoryIOManager.io.MemoryIOPort.writeAddr, ALU.io.x @[chiselv/src/CPUSingleCycle.scala 181:47]
      connect memoryIOManager.io.MemoryIOPort.readAddr, ALU.io.x @[chiselv/src/CPUSingleCycle.scala 182:47]
    when decoder.io.is_load : @[chiselv/src/CPUSingleCycle.scala 185:28]
      wire dataSize : UInt<2> @[chiselv/src/CPUSingleCycle.scala 186:31]
      connect dataSize, UInt<2>(0h0) @[chiselv/src/CPUSingleCycle.scala 186:31]
      wire dataOut : UInt<32> @[chiselv/src/CPUSingleCycle.scala 187:31]
      connect dataOut, UInt<32>(0h0) @[chiselv/src/CPUSingleCycle.scala 187:31]
      node _T_25 = eq(decoder.io.inst, UInt<6>(0h2c)) @[chiselv/src/CPUSingleCycle.scala 190:26]
      when _T_25 : @[chiselv/src/CPUSingleCycle.scala 190:34]
        connect dataSize, UInt<2>(0h3) @[chiselv/src/CPUSingleCycle.scala 191:16]
        connect dataOut, memoryIOManager.io.MemoryIOPort.readData @[chiselv/src/CPUSingleCycle.scala 192:16]
      node _T_26 = eq(decoder.io.inst, UInt<6>(0h29)) @[chiselv/src/CPUSingleCycle.scala 195:26]
      when _T_26 : @[chiselv/src/CPUSingleCycle.scala 195:34]
        connect dataSize, UInt<2>(0h2) @[chiselv/src/CPUSingleCycle.scala 196:16]
        node _dataOut_T = bits(memoryIOManager.io.MemoryIOPort.readData, 15, 15) @[chiselv/src/CPUSingleCycle.scala 198:58]
        node _dataOut_T_1 = mux(_dataOut_T, UInt<16>(0hffff), UInt<16>(0h0)) @[chiselv/src/CPUSingleCycle.scala 198:13]
        node _dataOut_T_2 = bits(memoryIOManager.io.MemoryIOPort.readData, 15, 0) @[chiselv/src/CPUSingleCycle.scala 199:49]
        node _dataOut_T_3 = cat(_dataOut_T_1, _dataOut_T_2) @[chiselv/src/CPUSingleCycle.scala 197:21]
        connect dataOut, _dataOut_T_3 @[chiselv/src/CPUSingleCycle.scala 197:15]
      node _T_27 = eq(decoder.io.inst, UInt<6>(0h2b)) @[chiselv/src/CPUSingleCycle.scala 203:26]
      when _T_27 : @[chiselv/src/CPUSingleCycle.scala 203:35]
        connect dataSize, UInt<2>(0h2) @[chiselv/src/CPUSingleCycle.scala 204:16]
        node _dataOut_T_4 = mux(UInt<1>(0h0), UInt<16>(0hffff), UInt<16>(0h0)) @[chiselv/src/CPUSingleCycle.scala 205:27]
        node _dataOut_T_5 = bits(memoryIOManager.io.MemoryIOPort.readData, 15, 0) @[chiselv/src/CPUSingleCycle.scala 205:78]
        node _dataOut_T_6 = cat(_dataOut_T_4, _dataOut_T_5) @[chiselv/src/CPUSingleCycle.scala 205:22]
        connect dataOut, _dataOut_T_6 @[chiselv/src/CPUSingleCycle.scala 205:16]
      node _T_28 = eq(decoder.io.inst, UInt<6>(0h28)) @[chiselv/src/CPUSingleCycle.scala 208:26]
      when _T_28 : @[chiselv/src/CPUSingleCycle.scala 208:34]
        connect dataSize, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 209:16]
        node _dataOut_T_7 = bits(memoryIOManager.io.MemoryIOPort.readData, 7, 7) @[chiselv/src/CPUSingleCycle.scala 211:58]
        node _dataOut_T_8 = mux(_dataOut_T_7, UInt<24>(0hffffff), UInt<24>(0h0)) @[chiselv/src/CPUSingleCycle.scala 211:13]
        node _dataOut_T_9 = bits(memoryIOManager.io.MemoryIOPort.readData, 7, 0) @[chiselv/src/CPUSingleCycle.scala 212:49]
        node _dataOut_T_10 = cat(_dataOut_T_8, _dataOut_T_9) @[chiselv/src/CPUSingleCycle.scala 210:21]
        connect dataOut, _dataOut_T_10 @[chiselv/src/CPUSingleCycle.scala 210:15]
      node _T_29 = eq(decoder.io.inst, UInt<6>(0h2a)) @[chiselv/src/CPUSingleCycle.scala 216:26]
      when _T_29 : @[chiselv/src/CPUSingleCycle.scala 216:35]
        connect dataSize, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 217:16]
        node _dataOut_T_11 = mux(UInt<1>(0h0), UInt<24>(0hffffff), UInt<24>(0h0)) @[chiselv/src/CPUSingleCycle.scala 218:27]
        node _dataOut_T_12 = bits(memoryIOManager.io.MemoryIOPort.readData, 7, 0) @[chiselv/src/CPUSingleCycle.scala 218:78]
        node _dataOut_T_13 = cat(_dataOut_T_11, _dataOut_T_12) @[chiselv/src/CPUSingleCycle.scala 218:22]
        connect dataOut, _dataOut_T_13 @[chiselv/src/CPUSingleCycle.scala 218:16]
      connect memoryIOManager.io.MemoryIOPort.readRequest, decoder.io.is_load @[chiselv/src/CPUSingleCycle.scala 220:49]
      connect memoryIOManager.io.MemoryIOPort.dataSize, dataSize @[chiselv/src/CPUSingleCycle.scala 221:49]
      connect registerBank.io.writeEnable, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 222:49]
      connect registerBank.io.regwr_data, dataOut @[chiselv/src/CPUSingleCycle.scala 223:49]
    when decoder.io.is_store : @[chiselv/src/CPUSingleCycle.scala 226:29]
      connect memoryIOManager.io.MemoryIOPort.writeRequest, decoder.io.is_store @[chiselv/src/CPUSingleCycle.scala 228:50]
      wire dataOut_1 : UInt<32> @[chiselv/src/CPUSingleCycle.scala 231:31]
      connect dataOut_1, UInt<32>(0h0) @[chiselv/src/CPUSingleCycle.scala 231:31]
      wire dataSize_1 : UInt<2> @[chiselv/src/CPUSingleCycle.scala 232:31]
      connect dataSize_1, UInt<2>(0h0) @[chiselv/src/CPUSingleCycle.scala 232:31]
      node _T_30 = eq(decoder.io.inst, UInt<6>(0h2f)) @[chiselv/src/CPUSingleCycle.scala 235:26]
      when _T_30 : @[chiselv/src/CPUSingleCycle.scala 235:34]
        connect dataOut_1, registerBank.io.rs2 @[chiselv/src/CPUSingleCycle.scala 236:16]
        connect dataSize_1, UInt<2>(0h3) @[chiselv/src/CPUSingleCycle.scala 237:16]
      node _T_31 = eq(decoder.io.inst, UInt<6>(0h2e)) @[chiselv/src/CPUSingleCycle.scala 240:26]
      when _T_31 : @[chiselv/src/CPUSingleCycle.scala 240:34]
        node _dataOut_T_14 = mux(UInt<1>(0h0), UInt<16>(0hffff), UInt<16>(0h0)) @[chiselv/src/CPUSingleCycle.scala 241:27]
        node _dataOut_T_15 = bits(registerBank.io.rs2, 15, 0) @[chiselv/src/CPUSingleCycle.scala 241:57]
        node _dataOut_T_16 = cat(_dataOut_T_14, _dataOut_T_15) @[chiselv/src/CPUSingleCycle.scala 241:22]
        connect dataOut_1, _dataOut_T_16 @[chiselv/src/CPUSingleCycle.scala 241:16]
        connect dataSize_1, UInt<2>(0h2) @[chiselv/src/CPUSingleCycle.scala 242:16]
      node _T_32 = eq(decoder.io.inst, UInt<6>(0h2d)) @[chiselv/src/CPUSingleCycle.scala 245:26]
      when _T_32 : @[chiselv/src/CPUSingleCycle.scala 245:34]
        node _dataOut_T_17 = mux(UInt<1>(0h0), UInt<24>(0hffffff), UInt<24>(0h0)) @[chiselv/src/CPUSingleCycle.scala 246:27]
        node _dataOut_T_18 = bits(registerBank.io.rs2, 7, 0) @[chiselv/src/CPUSingleCycle.scala 246:57]
        node _dataOut_T_19 = cat(_dataOut_T_17, _dataOut_T_18) @[chiselv/src/CPUSingleCycle.scala 246:22]
        connect dataOut_1, _dataOut_T_19 @[chiselv/src/CPUSingleCycle.scala 246:16]
        connect dataSize_1, UInt<1>(0h1) @[chiselv/src/CPUSingleCycle.scala 247:16]
      connect memoryIOManager.io.MemoryIOPort.dataSize, dataSize_1 @[chiselv/src/CPUSingleCycle.scala 249:47]
      connect memoryIOManager.io.MemoryIOPort.writeData, dataOut_1 @[chiselv/src/CPUSingleCycle.scala 250:47]
    regreset rvfi_valid : UInt<1>, clock, reset, UInt<1>(0h0) @[chiselv/src/RVFI_Wrapper.scala 53:27]
    regreset rvfi_order : UInt<64>, clock, reset, UInt<64>(0h0) @[chiselv/src/RVFI_Wrapper.scala 54:27]
    regreset rvfi_insn : UInt<32>, clock, reset, UInt<32>(0h0) @[chiselv/src/RVFI_Wrapper.scala 55:27]
    regreset rvfi_halt : UInt<1>, clock, reset, UInt<1>(0h0) @[chiselv/src/RVFI_Wrapper.scala 57:26]
    regreset rvfi_intr : UInt<1>, clock, reset, UInt<1>(0h0) @[chiselv/src/RVFI_Wrapper.scala 59:26]
    regreset rvfi_mode : UInt<2>, clock, reset, UInt<2>(0h3) @[chiselv/src/RVFI_Wrapper.scala 60:26]
    wire rvfi_mem_size_mask : UInt<2> @[chiselv/src/RVFI_Wrapper.scala 62:39]
    connect rvfi_mem_size_mask, UInt<2>(0h0) @[chiselv/src/RVFI_Wrapper.scala 62:39]
    node _T_33 = eq(UInt<1>(0h1), memoryIOManager.io.DataMemPort.dataSize) @[chiselv/src/RVFI_Wrapper.scala 63:51]
    when _T_33 : @[chiselv/src/RVFI_Wrapper.scala 63:51]
      connect rvfi_mem_size_mask, UInt<1>(0h1) @[chiselv/src/RVFI_Wrapper.scala 64:32]
    else :
      node _T_34 = eq(UInt<2>(0h2), memoryIOManager.io.DataMemPort.dataSize) @[chiselv/src/RVFI_Wrapper.scala 63:51]
      when _T_34 : @[chiselv/src/RVFI_Wrapper.scala 63:51]
        connect rvfi_mem_size_mask, UInt<2>(0h3) @[chiselv/src/RVFI_Wrapper.scala 65:32]
      else :
        node _T_35 = eq(UInt<2>(0h3), memoryIOManager.io.DataMemPort.dataSize) @[chiselv/src/RVFI_Wrapper.scala 63:51]
        when _T_35 : @[chiselv/src/RVFI_Wrapper.scala 63:51]
          connect rvfi_mem_size_mask, UInt<4>(0hf) @[chiselv/src/RVFI_Wrapper.scala 66:32]
    node _rvfi_valid_T = asUInt(reset) @[chiselv/src/RVFI_Wrapper.scala 70:24]
    node _rvfi_valid_T_1 = eq(_rvfi_valid_T, UInt<1>(0h0)) @[chiselv/src/RVFI_Wrapper.scala 70:17]
    node _rvfi_valid_T_2 = eq(stall, UInt<1>(0h0)) @[chiselv/src/RVFI_Wrapper.scala 70:34]
    node _rvfi_valid_T_3 = and(_rvfi_valid_T_1, _rvfi_valid_T_2) @[chiselv/src/RVFI_Wrapper.scala 70:31]
    connect rvfi_valid, _rvfi_valid_T_3 @[chiselv/src/RVFI_Wrapper.scala 70:14]
    when rvfi_valid : @[chiselv/src/RVFI_Wrapper.scala 71:20]
      node _rvfi_order_T = add(rvfi_order, UInt<1>(0h1)) @[chiselv/src/RVFI_Wrapper.scala 72:30]
      node _rvfi_order_T_1 = tail(_rvfi_order_T, 1) @[chiselv/src/RVFI_Wrapper.scala 72:30]
      connect rvfi_order, _rvfi_order_T_1 @[chiselv/src/RVFI_Wrapper.scala 72:16]
    connect rvfi.valid, rvfi_valid @[chiselv/src/RVFI_Wrapper.scala 74:14]
    connect rvfi.order, rvfi_order @[chiselv/src/RVFI_Wrapper.scala 75:14]
    connect rvfi.insn, decoder.io.op @[chiselv/src/RVFI_Wrapper.scala 76:14]
    connect rvfi.rs1_addr, registerBank.io.rs1_addr @[chiselv/src/RVFI_Wrapper.scala 78:18]
    connect rvfi.rs1_rdata, registerBank.io.rs1 @[chiselv/src/RVFI_Wrapper.scala 79:18]
    connect rvfi.rs2_addr, registerBank.io.rs2_addr @[chiselv/src/RVFI_Wrapper.scala 80:18]
    connect rvfi.rs2_rdata, registerBank.io.rs2 @[chiselv/src/RVFI_Wrapper.scala 81:18]
    connect rvfi.rd_addr, registerBank.io.regwr_addr @[chiselv/src/RVFI_Wrapper.scala 82:18]
    connect rvfi.rd_wdata, registerBank.io.regwr_data @[chiselv/src/RVFI_Wrapper.scala 83:18]
    connect rvfi.pc_rdata, PC.io.PC @[chiselv/src/RVFI_Wrapper.scala 85:17]
    node _rvfi_pc_wdata_T = asSInt(PC.io.PC) @[chiselv/src/RVFI_Wrapper.scala 88:15]
    node _rvfi_pc_wdata_T_1 = asSInt(PC.io.dataIn) @[chiselv/src/RVFI_Wrapper.scala 88:37]
    node _rvfi_pc_wdata_T_2 = add(_rvfi_pc_wdata_T, _rvfi_pc_wdata_T_1) @[chiselv/src/RVFI_Wrapper.scala 88:22]
    node _rvfi_pc_wdata_T_3 = tail(_rvfi_pc_wdata_T_2, 1) @[chiselv/src/RVFI_Wrapper.scala 88:22]
    node _rvfi_pc_wdata_T_4 = asSInt(_rvfi_pc_wdata_T_3) @[chiselv/src/RVFI_Wrapper.scala 88:22]
    node _rvfi_pc_wdata_T_5 = asUInt(_rvfi_pc_wdata_T_4) @[chiselv/src/RVFI_Wrapper.scala 88:45]
    node _rvfi_pc_wdata_T_6 = mux(PC.io.writeAdd, _rvfi_pc_wdata_T_5, PC.io.PC4) @[chiselv/src/RVFI_Wrapper.scala 86:23]
    connect rvfi.pc_wdata, _rvfi_pc_wdata_T_6 @[chiselv/src/RVFI_Wrapper.scala 86:17]
    node _rvfi_mem_addr_T = or(decoder.io.is_load, decoder.io.is_store) @[chiselv/src/RVFI_Wrapper.scala 92:44]
    node _rvfi_mem_addr_T_1 = mux(_rvfi_mem_addr_T, ALU.io.x, UInt<1>(0h0)) @[chiselv/src/RVFI_Wrapper.scala 92:24]
    connect rvfi.mem_addr, _rvfi_mem_addr_T_1 @[chiselv/src/RVFI_Wrapper.scala 92:18]
    node _rvfi_mem_rdata_T = mux(decoder.io.is_load, memoryIOManager.io.DataMemPort.readData, UInt<1>(0h0)) @[chiselv/src/RVFI_Wrapper.scala 93:24]
    connect rvfi.mem_rdata, _rvfi_mem_rdata_T @[chiselv/src/RVFI_Wrapper.scala 93:18]
    node _rvfi_mem_rmask_T = mux(decoder.io.is_load, rvfi_mem_size_mask, UInt<1>(0h0)) @[chiselv/src/RVFI_Wrapper.scala 94:24]
    connect rvfi.mem_rmask, _rvfi_mem_rmask_T @[chiselv/src/RVFI_Wrapper.scala 94:18]
    node _rvfi_mem_wdata_T = mux(decoder.io.is_store, memoryIOManager.io.DataMemPort.writeData, UInt<1>(0h0)) @[chiselv/src/RVFI_Wrapper.scala 96:24]
    connect rvfi.mem_wdata, _rvfi_mem_wdata_T @[chiselv/src/RVFI_Wrapper.scala 96:18]
    node _rvfi_mem_wmask_T = mux(decoder.io.is_store, rvfi_mem_size_mask, UInt<1>(0h0)) @[chiselv/src/RVFI_Wrapper.scala 97:24]
    connect rvfi.mem_wmask, _rvfi_mem_wmask_T @[chiselv/src/RVFI_Wrapper.scala 97:18]
    connect rvfi.mode, rvfi_mode @[chiselv/src/RVFI_Wrapper.scala 99:13]
    connect rvfi.trap, UInt<1>(0h0) @[chiselv/src/RVFI_Wrapper.scala 100:13]
    node _T_36 = eq(decoder.io.inst, UInt<1>(0h0)) @[chiselv/src/RVFI_Wrapper.scala 101:24]
    when _T_36 : @[chiselv/src/RVFI_Wrapper.scala 101:50]
      connect rvfi.trap, UInt<1>(0h1) @[chiselv/src/RVFI_Wrapper.scala 102:15]
    connect rvfi.halt, rvfi_halt @[chiselv/src/RVFI_Wrapper.scala 105:13]
    connect rvfi.intr, rvfi_intr @[chiselv/src/RVFI_Wrapper.scala 106:13]
    connect rvfi.ixl, UInt<1>(0h1) @[chiselv/src/RVFI_Wrapper.scala 107:13]

  module SimSOC : @[chiselv/src/SimSOC.scala 5:7]
    input clock : Clock @[chiselv/src/SimSOC.scala 5:7]
    input reset : Reset @[chiselv/src/SimSOC.scala 5:7]
    output io : { GPIO0External : { flip in : UInt<8>, out : UInt<8>, directionOut : UInt<8>}, UART0SerialPort : { flip rx : UInt<1>, tx : UInt<1>}, rvfi : { valid : UInt<1>, order : UInt<64>, insn : UInt<32>, trap : UInt<1>, halt : UInt<1>, intr : UInt<1>, ixl : UInt<2>, mode : UInt<2>, rs1_addr : UInt<5>, rs1_rdata : UInt<32>, rs2_addr : UInt<5>, rs2_rdata : UInt<32>, rd_addr : UInt<5>, rd_wdata : UInt<32>, pc_rdata : UInt<32>, pc_wdata : UInt<32>, mem_addr : UInt<32>, mem_rmask : UInt<4>, mem_wmask : UInt<4>, mem_rdata : UInt<32>, mem_wdata : UInt<32>}} @[chiselv/src/SimSOC.scala 15:14]

    inst instructionMemory of InstructionMemory @[chiselv/src/SimSOC.scala 22:33]
    connect instructionMemory.clock, clock
    connect instructionMemory.reset, reset
    connect instructionMemory.io.readAddr, UInt<1>(0h0) @[chiselv/src/SimSOC.scala 23:33]
    inst dataMemory of DualPortRAM @[chiselv/src/SimSOC.scala 26:26]
    connect dataMemory.clock, clock
    connect dataMemory.reset, reset
    connect dataMemory.io.writeEnable, UInt<1>(0h0) @[chiselv/src/SimSOC.scala 27:30]
    connect dataMemory.io.writeData, UInt<1>(0h0) @[chiselv/src/SimSOC.scala 28:30]
    connect dataMemory.io.readAddress, UInt<1>(0h0) @[chiselv/src/SimSOC.scala 29:30]
    connect dataMemory.io.writeAddress, UInt<1>(0h0) @[chiselv/src/SimSOC.scala 30:30]
    connect dataMemory.io.dataSize, UInt<1>(0h0) @[chiselv/src/SimSOC.scala 31:30]
    connect dataMemory.io.writeMask, UInt<1>(0h0) @[chiselv/src/SimSOC.scala 32:30]
    inst UART0 of Uart @[chiselv/src/SimSOC.scala 37:27]
    connect UART0.clock, clock
    connect UART0.reset, reset
    connect io.UART0SerialPort.tx, UART0.io.serialPort.tx @[chiselv/src/SimSOC.scala 38:23]
    connect UART0.io.serialPort.rx, io.UART0SerialPort.rx @[chiselv/src/SimSOC.scala 38:23]
    inst syscon of Syscon @[chiselv/src/SimSOC.scala 41:22]
    connect syscon.clock, clock
    connect syscon.reset, reset
    inst core of RVFICPUWrapper @[chiselv/src/SimSOC.scala 44:20]
    connect core.clock, clock
    connect core.reset, reset
    connect io.rvfi, core.rvfi @[chiselv/src/SimSOC.scala 56:13]
    connect core.io.instructionMemPort, instructionMemory.io @[chiselv/src/SimSOC.scala 59:30]
    connect core.io.dataMemPort, dataMemory.io @[chiselv/src/SimSOC.scala 60:23]
    connect core.io.UART0Port, UART0.io.dataPort @[chiselv/src/SimSOC.scala 61:21]
    connect core.io.SysconPort, syscon.io @[chiselv/src/SimSOC.scala 62:22]
    connect io.GPIO0External.directionOut, core.io.GPIO0External.directionOut @[chiselv/src/SimSOC.scala 64:27]
    connect io.GPIO0External.out, core.io.GPIO0External.out @[chiselv/src/SimSOC.scala 64:27]
    connect core.io.GPIO0External.in, io.GPIO0External.in @[chiselv/src/SimSOC.scala 64:27]

  module SimToplevel : @[chiselv/src/SimToplevel.scala 8:7]
    input clock : Clock @[chiselv/src/SimToplevel.scala 8:7]
    input reset : UInt<1> @[chiselv/src/SimToplevel.scala 8:7]
    output UART0 : { flip rx : UInt<1>, tx : UInt<1>} @[chiselv/src/SimToplevel.scala 14:18]
    output GPIO0 : { flip in : UInt<8>, out : UInt<8>, directionOut : UInt<8>} @[chiselv/src/SimToplevel.scala 14:18]
    output rvfi : { valid : UInt<1>, order : UInt<64>, insn : UInt<32>, trap : UInt<1>, halt : UInt<1>, intr : UInt<1>, ixl : UInt<2>, mode : UInt<2>, rs1_addr : UInt<5>, rs1_rdata : UInt<32>, rs2_addr : UInt<5>, rs2_rdata : UInt<32>, rd_addr : UInt<5>, rd_wdata : UInt<32>, pc_rdata : UInt<32>, pc_wdata : UInt<32>, mem_addr : UInt<32>, mem_rmask : UInt<4>, mem_wmask : UInt<4>, mem_rdata : UInt<32>, mem_wdata : UInt<32>} @[chiselv/src/SimToplevel.scala 14:18]

    inst SOC of SimSOC @[chiselv/src/SimToplevel.scala 21:11]
    connect SOC.clock, clock
    connect SOC.reset, reset
    connect GPIO0.directionOut, SOC.io.GPIO0External.directionOut @[chiselv/src/SimToplevel.scala 35:12]
    connect GPIO0.out, SOC.io.GPIO0External.out @[chiselv/src/SimToplevel.scala 35:12]
    connect SOC.io.GPIO0External.in, GPIO0.in @[chiselv/src/SimToplevel.scala 35:12]
    connect UART0.tx, SOC.io.UART0SerialPort.tx @[chiselv/src/SimToplevel.scala 36:12]
    connect SOC.io.UART0SerialPort.rx, UART0.rx @[chiselv/src/SimToplevel.scala 36:12]
    connect rvfi, SOC.io.rvfi @[chiselv/src/SimToplevel.scala 37:11]

