#include "VSimpleChiselTop.h"
#include "verilated.h"
#include <cstdint>
#include <fstream>
#include <iostream>
#include <vector>

#define N 100

void write_array(std::ofstream &out, const char *name, bool is_last,
                 std::vector<uint64_t> &vec) {
  out << "  \"" << name << "\": [";
  for (size_t i = 0; i < vec.size(); ++i) {
    out << vec[i];
    if (i != vec.size() - 1) {
      out << ", ";
    }
  }
  out << "]";
  if (!is_last) {
    out << ",";
  }
  out << std::endl;
}

int main(int argc, char **argv) {
  // Setup context, defaults, and parse command line
  Verilated::debug(0);
  const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
  contextp->commandArgs(argc, argv);
  contextp->assertOn(true);

  // Construct the Verilated model
  const std::unique_ptr<VSimpleChiselTop> topp{new VSimpleChiselTop{contextp.get(), ""}};

  // Store outs:
  std::vector<uint64_t> outputs_aluResult;
  std::vector<uint64_t> outputs_aluValid;

  // Reset (active-high): hold reset for a couple cycles, then deassert.
  topp->io_clock = 0;
  topp->io_reset = 1;
  topp->eval();
  for (int i = 0; i < 2; ++i) {
    topp->io_clock = 0;
    topp->eval();
    contextp->timeInc(1);
    topp->io_clock = 1;
    topp->eval();
    contextp->timeInc(1);
  }
  topp->io_reset = 0;

  // Simulate N cycles
  for (int i = 0; i < N; ++i) {
    topp->io_clock = 0;
    topp->eval();
    contextp->timeInc(1);

    topp->io_clock = 1;
    topp->eval();
    contextp->timeInc(1);

    // Sample registered outputs after the rising edge.
    outputs_aluResult.push_back(topp->io_aluResult);
    outputs_aluValid.push_back(topp->io_aluValid);
  }

  // Write outputs to file:
  std::ofstream outfile_outputs("expected_outputs.json");
  if (!outfile_outputs.is_open()) {
    std::cerr << "Error: Could not open expected_outputs.json for writing."
              << std::endl;
    return 1;
  }

  outfile_outputs << "{" << std::endl;
  write_array(outfile_outputs, "aluResult", false, outputs_aluResult);
  write_array(outfile_outputs, "aluValid", true, outputs_aluValid);
  outfile_outputs << "}" << std::endl;
  outfile_outputs.close();

  contextp->statsPrintSummary();

  return contextp->gotError() ? 1 : 0;
}
