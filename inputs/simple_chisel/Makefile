# Makefile for the simple_chisel mock RTL project.
#
# Targets:
#   make            - build FIRRTL and SystemVerilog (default)
#   make firrtl     - elaborate Chisel -> FIRRTL
#   make sv         - FIRRTL -> SystemVerilog (via firtool)
#   make sim        - verilate + run the SystemVerilog testbench
#   make verilate   - verilate + build the C++ testbench (no run)
#   make clean      - remove generated outputs and sbt caches
#   make distclean  - also remove the downloaded sbt toolchain
#
# Environment overrides:
#   FIRTOOL  - path to the firtool binary (default: ../../build/bin/firtool)
#   SBT      - path to sbt launcher (default: auto; downloaded if absent)
#   VERILATOR - path to the verilator binary (default: from PATH)

SCALA_PKG   := simplechisel
TOP_MODULE  := SimpleChiselTop
SRC_DIR     := src/main/scala
BUILD_DIR   := build
FIRRTL_OUT  := $(BUILD_DIR)/$(TOP_MODULE).fir
SV_OUT      := $(BUILD_DIR)/$(TOP_MODULE).sv

# firtool binary: defaults to the local CIRCT build relative to this project.
FIRTOOL ?= ../../build/bin/firtool

# verilator binary: defaults to the one on the PATH.
VERILATOR ?= verilator

# Verilator produces the C++ model + executable in the build dir.
SIM_BIN    := $(BUILD_DIR)/V$(TOP_MODULE)
SIM_TB_SRC := top.cc
SIM_OUT    := expected_outputs.json

# sbt: prefer an sbt found on the PATH; otherwise fall back to a downloaded
# local copy managed by this Makefile.
SBT_VERSION := 1.10.7
SBT_LOCAL   := $(CURDIR)/tools/sbt/bin/sbt
SBT_TARBALL := sbt-$(SBT_VERSION).tgz
SBT_URL     := https://github.com/sbt/sbt/releases/download/v$(SBT_VERSION)/$(SBT_TARBALL)

ifeq ($(shell command -v sbt 2>/dev/null),)
SBT := $(SBT_LOCAL)
else
SBT := sbt
endif

.DEFAULT_GOAL := all
.PHONY: all firrtl sv sim verilate clean distclean check-sbt

all: firrtl sv

firrtl: $(FIRRTL_OUT)

sv: $(SV_OUT)

sim: verilate
	@echo "==> Running simulation..."
	rm -f $(SIM_OUT)
	./$(SIM_BIN)

# Verilate + compile the C++ testbench into the simulation executable.
verilate: $(SV_OUT) $(SIM_TB_SRC)
	@command -v $(VERILATOR) >/dev/null 2>&1 || { \
	  echo "ERROR: 'verilator' not found (VERILATOR=$(VERILATOR))." >&2; exit 1; }
	$(VERILATOR) \
	  --cc --exe --build --build-jobs $$(nproc) \
	  --Mdir "$(BUILD_DIR)" \
	  --top-module "$(TOP_MODULE)" $(SV_OUT) $(SIM_TB_SRC)
	@echo "==> Built:   $(SIM_BIN)"

# --- Download a local sbt if none is available on the PATH -------------------

$(SBT_LOCAL):
	@mkdir -p tools
	@echo "==> Downloading sbt $(SBT_VERSION)..."
	@cd tools && curl -L -O $(SBT_URL) && tar xzf $(SBT_TARBALL) && rm -f $(SBT_TARBALL)
	@touch $(SBT_LOCAL)

check-sbt:
	@command -v java >/dev/null 2>&1 || { \
	  echo "ERROR: 'java' is required but not found on PATH." >&2; exit 1; }
	@if [ "$(SBT)" = "$(SBT_LOCAL)" ] && [ ! -x "$(SBT_LOCAL)" ]; then \
	  echo "==> sbt not on PATH; building local sbt..."; \
	  $(MAKE) $(SBT_LOCAL); \
	fi

# --- Elaboration ------------------------------------------------------------

# Chisel emits <Top>.fir into --target-dir.
$(FIRRTL_OUT): $(wildcard $(SRC_DIR)/*.scala) build.sbt project/build.properties check-sbt
	@mkdir -p $(BUILD_DIR)
	$(SBT) "runMain $(SCALA_PKG).SimpleChiselMain --target-dir $(BUILD_DIR)"
	@if [ ! -f "$(FIRRTL_OUT)" ]; then \
	  echo "ERROR: expected FIRRTL file $(FIRRTL_OUT) not produced." >&2; \
	  echo "Files in $(BUILD_DIR):"; find $(BUILD_DIR) -maxdepth 1 -type f -print; \
	  exit 1; \
	fi
	@echo "==> FIRRTL:  $(FIRRTL_OUT)"

# Lower FIRRTL to SystemVerilog using the CIRCT firtool binary.
$(SV_OUT): $(FIRRTL_OUT)
	@mkdir -p $(BUILD_DIR)
	$(FIRTOOL) $(FIRRTL_OUT) --format=fir --disable-annotation-unknown --verilog -o $(SV_OUT)
	@echo "==> SV:      $(SV_OUT)"

clean:
	rm -rf $(BUILD_DIR) target project/target $(SIM_OUT)

distclean: clean
	rm -rf tools
