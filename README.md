# Synchronous-FIFO-Buffer
A robust, hardware-synthesizable Synchronous FIFO (First-In, First-Out) Buffer design implemented in Verilog. This repository contains the full digital design cycle: from human-readable Register-Transfer Level (RTL) code to functional simulation validation and gate-level logic synthesis using open-source EDA tools.

# 🚀 Key Architectural Features
- Single Clock Domain: Synchronous read and write operations driven by a single `clk` edge.
- Fully Parameterized: Easily adjust `DATA_WIDTH` (word size) and `DEPTH` (queue capacity) at the instantiation level.
- Optimized Status Tracking: Implements an N+1 pointer bit comparison strategy to eliminate the need for counter logic when resolving `full` and `empty` flag conditions.
- Overwrite Protection: Internal protection logic discards write attempts when the buffer is full and holds data output stable when empty.

# 🛠️ Toolchain & Requirements
This project is built entirely using open-source VLSI engineering tools:
* Simulation Compiler: Icarus verilog
* Waveform Viewer: GTKWave
* Logic Synthesis Engine: Yosys Open SYnthesis Suite
* Schematic Rendering: Graphviz & `xdot`

