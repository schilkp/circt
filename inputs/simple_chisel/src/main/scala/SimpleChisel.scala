// Simple closed-loop pseudo-random ALU exercise.
//
// A 32-bit Fibonacci LFSR free-runs and derives two operands, an op-select,
// and a "latch" bit from its state each cycle. These feed a 3-stage pipelined
// ALU. When a result emerges from the pipeline with its companion latch bit
// set, that result is XOR-fed back into the top byte of the LFSR, perturbing
// the sequence. The top module is non-parametrized and exposes only the
// clock, reset, the ALU result, and the ALU valid (latch) signal.

package simplechisel

import chisel3._
import chisel3.util._

// ---------------------------------------------------------------------------
// ALU op codes (plain UInt constants; avoid ChiselEnum to keep the emitted
// FIRRTL free of enum annotations that firtool rejects without
// --disable-annotation-unknown).
// ---------------------------------------------------------------------------

object AluOp {
  val ADD = 0.U(3.W)
  val SUB = 1.U(3.W)
  val AND = 2.U(3.W)
  val OR  = 3.U(3.W)
  val XOR = 4.U(3.W)
  val SLL = 5.U(3.W)
}

// ---------------------------------------------------------------------------
// LFSR
// ---------------------------------------------------------------------------

// 32-bit Fibonacci LFSR with maximal-length taps {32, 22, 2, 1}. Shifts right
// by one each cycle; the bit shifted into the MSB is the XOR of the tapped
// state bits. When `feedback.valid` is asserted, `feedback.bits` (8 bits) is
// XORed into the top byte of the next state, perturbing the sequence without
// halting the shift.
//
// Each cycle the LFSR derives, combinationally from its current state:
//   a      = state[31:24]
//   b      = state[23:16]
//   op     = state[15:13]
//   latch  = state[12]
class Lfsr extends Module {
  val io = IO(new Bundle {
    val a        = Output(UInt(8.W))
    val b        = Output(UInt(8.W))
    val op       = Output(UInt(3.W))
    val latch    = Output(Bool())
    val feedback = Input(new Bundle {
      val valid = Bool()
      val bits  = UInt(8.W)
    })
  })

  // Non-zero seed; all-ones is the conventional maximal-length start state.
  val state = RegInit("hFFFFFFFF".U(32.W))

  // Taps 32,22,2,1 -> 0-indexed bit positions 31,21,1,0.
  val tap = state(31) ^ state(21) ^ state(1) ^ state(0)

  // Shift right by one; feedback bit enters the MSB.
  val shifted = Cat(state(30, 0), tap)

  // Optionally perturb the top byte with the latched ALU result.
  val nextState = Mux(io.feedback.valid,
                     shifted ^ Cat(io.feedback.bits, 0.U(24.W)),
                     shifted)
  state := nextState

  io.a     := state(31, 24)
  io.b     := state(23, 16)
  io.op    := state(15, 13)
  io.latch := state(12)
}

// ---------------------------------------------------------------------------
// Pipelined ALU (3 stages)
// ---------------------------------------------------------------------------

// 3-stage pipelined 8-bit ALU. Latency is 3 cycles. The `latch` companion bit
// is carried through the pipe alongside the data so the consumer knows which
// results are "marked" for feedback.
//
//   S1: latch inputs                       -> a1, b1, op1, lat1
//   S2: compute arith (ADD/SUB) and logic  -> a2, b2, op2, lat2,
//          (AND/OR/XOR) from a1,b1            arith2, logic2
//   S3: compute shift (a2 << b2[3:0]);       -> result_r3, lat_r3
//          final mux on op2 over
//          arith2 / logic2 / shift
class PipelinedAlu extends Module {
  val io = IO(new Bundle {
    val a     = Input(UInt(8.W))
    val b     = Input(UInt(8.W))
    val op    = Input(UInt(3.W))
    val latch = Input(Bool())

    val result = Output(UInt(8.W))
    val valid  = Output(Bool())
  })

  // ---- Stage 1: input registers -----------------------------------------
  val a1   = Reg(UInt(8.W))
  val b1   = Reg(UInt(8.W))
  val op1  = Reg(UInt(3.W))
  val lat1 = Reg(Bool())

  a1   := io.a
  b1   := io.b
  op1  := io.op
  lat1 := io.latch

  // ---- Stage 2: arithmetic + logic compute ------------------------------
  val a2     = Reg(UInt(8.W))
  val b2     = Reg(UInt(8.W))
  val op2    = Reg(UInt(3.W))
  val lat2   = Reg(Bool())
  val arith2 = Reg(UInt(8.W))
  val logic2 = Reg(UInt(8.W))

  val arith1 = Mux(op1 === AluOp.SUB, a1 - b1, a1 + b1)
  val logic1 = MuxLookup(op1, a1 & b1)(
    Seq(
      AluOp.AND -> (a1 & b1),
      AluOp.OR  -> (a1 | b1),
      AluOp.XOR -> (a1 ^ b1)
    )
  )

  a2     := a1
  b2     := b1
  op2    := op1
  lat2   := lat1
  arith2 := arith1
  logic2 := logic1

  // ---- Stage 3: shift compute + final mux --------------------------------
  val result_r3 = Reg(UInt(8.W))
  val lat_r3    = Reg(Bool())

  val shift3 = a2 << b2(3, 0)

  val muxed = MuxCase(
    arith2,
    Seq(
      (op2 === AluOp.AND || op2 === AluOp.OR || op2 === AluOp.XOR) -> logic2,
      (op2 === AluOp.SLL) -> shift3
    )
  )

  result_r3 := muxed
  lat_r3    := lat2

  io.result := result_r3
  io.valid  := lat_r3
}

// ---------------------------------------------------------------------------
// Top-level wrapper
// ---------------------------------------------------------------------------

// Non-parametrized top. Exposes explicit clock/reset and only the two ALU
// output signals (result + valid). The LFSR<->ALU feedback loop is internal.
class SimpleChiselTop extends RawModule {
  val io = IO(new Bundle {
    val clock     = Input(Clock())
    val reset     = Input(Bool())
    val aluResult = Output(UInt(8.W))
    val aluValid  = Output(Bool())
  })

  withClockAndReset(io.clock, io.reset) {
    val lfsr = Module(new Lfsr)
    val alu  = Module(new PipelinedAlu)

    // LFSR -> ALU pipeline inputs.
    alu.io.a     := lfsr.io.a
    alu.io.b     := lfsr.io.b
    alu.io.op    := lfsr.io.op
    alu.io.latch := lfsr.io.latch

    // ALU result -> LFSR feedback (XOR into top byte when valid).
    lfsr.io.feedback.valid := alu.io.valid
    lfsr.io.feedback.bits  := alu.io.result

    io.aluResult := alu.io.result
    io.aluValid  := alu.io.valid
  }
}

// ---------------------------------------------------------------------------
// Elaboration entry point
// ---------------------------------------------------------------------------

import _root_.circt.stage.ChiselStage

object SimpleChiselMain extends App {
  // Emits CHIRRTL (the Chisel-high FIRRTL dialect) to <moduleName>.fir in the
  // --target-dir. SystemVerilog is produced separately by `firtool` in the
  // Makefile so the JVM elaboration step has no dependency on firtool.
  ChiselStage.emitCHIRRTLFile(new SimpleChiselTop, args)
}
