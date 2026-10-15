# Set8_CPU — Mini 8-bit Accumulator CPU
**Course:** CSE 450 — VLSI Lab  
**University:** University of Asia Pacific  
**Project:** Final Project — Spring 2026  
**Student ID:** 22201028  
**Assigned Instruction Set:** Set 8  
**Implementation Language:** VHDL  
**Simulation Tool:** Xilinx ISE  

---

## 1. Project Overview

This project implements a small single-cycle 8-bit CPU in VHDL. The CPU uses a Program Counter (PC), Program ROM, Control Unit, Arithmetic Logic Unit (ALU), Accumulator (ACC), Holding Register (R), and Zero Flag (Z).

The CPU fetches, decodes, and executes one instruction per clock cycle. All sequential state changes occur at the rising edge of the clock. The RESET signal is synchronous and active-high.

The design uses a modular and hierarchical approach. Basic logic gates are constructed using NAND gates, and the arithmetic unit uses NAND-based full-adder components. The complete CPU combines these components with instruction memory, control logic, and clocked registers.

## 2. Assigned Instruction Set

The last digit of Student ID 22201028 is 8. Therefore, the assigned instruction set is **Set 8**.

| Instruction | Opcode | Operation |
|---|---|---|
| LDI imm | `0001` | ACC ← imm |
| ADD imm | `0010` | ACC ← ACC + imm |
| SUB imm | `0011` | ACC ← ACC − imm (modulo 256) |
| STA | `1010` | R ← ACC; ACC remains unchanged |
| LDR | `1011` | ACC ← R |

The CPU implements the two mandatory instructions, LDI and ADD, along with the three Set 8 instructions: STA, LDR, and SUB.

### Instruction Format

Each instruction is 12 bits wide.

- Bits 11–8: 4-bit opcode
- Bits 7–0: 8-bit immediate operand

For STA and LDR, the operand is ignored.

## 3. Project Objectives

The objectives of this project are:

1. To design basic logic gates using NAND gates.
2. To implement a half adder and a full adder using structural VHDL.
3. To construct an 8-bit arithmetic unit supporting addition and subtraction.
4. To implement clocked registers with synchronous, active-high reset.
5. To design a 4-bit Program Counter and a 16-location, 12-bit Program ROM.
6. To implement a Control Unit that decodes the five assigned instructions.
7. To integrate the modules into a complete single-cycle CPU.
8. To verify the Set 8 program using a VHDL testbench and simulation waveforms.

## 4. Hardware Architecture

The main processing sequence is:

```text
Program Counter (PC)
        |
        v
    Program ROM
        |
        v
   Control Unit
        |
        v
  ALU / Data Selection
        |
        v
  ACC / R / Z Registers
```

The Program Counter selects an instruction from the ROM. The Control Unit decodes the opcode and generates control signals. The ALU calculates the addition or subtraction result, while the data-selection logic chooses between the immediate operand, ALU result, and R register value.

The ACC register stores the CPU's current result and is exposed through the output Q. The R register stores data for the STA and LDR instructions. The Z flag indicates whether the value written to ACC is zero.

## 5. Project Folder Structure

```text
Set8_CPU/
├── src/
│   ├── nand_gate.vhd
│   ├── not_gate.vhd
│   ├── and_gate.vhd
│   ├── or_gate.vhd
│   ├── xor_gate.vhd
│   ├── half_adder.vhd
│   ├── full_adder_nand.vhd
│   ├── alu_8bit.vhd
│   ├── program_counter.vhd
│   ├── program_rom.vhd
│   ├── control_unit.vhd
│   ├── acc_register.vhd
│   ├── r_register.vhd
│   ├── z_flag.vhd
│   └── cpu_top.vhd
├── testbench/
│   └── tb_cpu_top.vhd
└── report/
    └── waveforms/
```

### Module Descriptions

| Module | Description |
|---|---|
| `nand_gate.vhd` | Implements the universal NAND gate. |
| `not_gate.vhd` | Constructs a NOT gate using a NAND gate. |
| `and_gate.vhd` | Constructs an AND gate using NAND gates. |
| `or_gate.vhd` | Constructs an OR gate using NAND gates. |
| `xor_gate.vhd` | Implements XOR using four NAND gates. |
| `half_adder.vhd` | Adds two single-bit inputs and generates sum and carry. |
| `full_adder_nand.vhd` | Adds A, B, and carry-in using NAND-based logic. |
| `alu_8bit.vhd` | Performs 8-bit addition and subtraction. |
| `program_counter.vhd` | Holds the instruction address and increments after each instruction. |
| `program_rom.vhd` | Stores the Set 8 program in a 16-location ROM. |
| `control_unit.vhd` | Decodes opcodes and generates control signals. |
| `acc_register.vhd` | Stores the 8-bit accumulator value. |
| `r_register.vhd` | Stores an 8-bit value for STA and LDR. |
| `z_flag.vhd` | Stores the zero flag. |
| `cpu_top.vhd` | Connects all CPU modules. |
| `tb_cpu_top.vhd` | Generates clock and reset signals and verifies the program. |

## 6. Set 8 Program ROM

The following instructions are stored in the Program ROM.

| Address | Instruction | Encoded Word |
|---:|---|---|
| 0 | LDI 0x64 | `0x164` |
| 1 | STA | `0xA00` |
| 2 | SUB 0x14 | `0x314` |
| 3 | ADD 0x0A | `0x20A` |
| 4 | STA | `0xA00` |
| 5 | SUB 0x5A | `0x35A` |
| 6 | LDR | `0xB00` |
| 7 | SUB 0x60 | `0x360` |
| 8–15 | NOP | `0x000` |

The ROM output is selected combinationally using the current PC address.

## 7. Reset and Sequential Operation

RESET is synchronous and active-high. At a rising clock edge when RESET is asserted:

| Signal | Reset Value |
|---|---|
| PC | `0` |
| ACC / Q | `0x00` |
| R | `0x00` |
| Z | `1` |

During normal operation, the CPU executes the instruction selected by the current PC and updates the appropriate registers at the rising clock edge.

The Z flag is updated for LDI, ADD, SUB, and LDR. It remains unchanged during STA and NOP.

## 8. Compilation and Simulation

### Compilation Order

Compile the VHDL files in dependency order:

1. `nand_gate.vhd`
2. `not_gate.vhd`
3. `and_gate.vhd`
4. `or_gate.vhd`
5. `xor_gate.vhd`
6. `half_adder.vhd`
7. `full_adder_nand.vhd`
8. `alu_8bit.vhd`
9. `program_counter.vhd`
10. `program_rom.vhd`
11. `control_unit.vhd`
12. `acc_register.vhd`
13. `r_register.vhd`
14. `z_flag.vhd`
15. `cpu_top.vhd`
16. `tb_cpu_top.vhd`

### Simulation Procedure

1. Create or open the Xilinx ISE project.
2. Add all source files in the compilation order above.
3. Select `cpu_top` as the design top module for RTL inspection or synthesis.
4. Add `tb_cpu_top.vhd` and select it as the simulation top.
5. Run behavioral simulation.
6. Observe the clock, reset, PC, Q, R_OUT, and Z signals.
7. Compare the results with the expected Set 8 program trace.
8. Save the waveform screenshots in `report/waveforms/` using the filenames referenced below.

**Note:** The supplied testbench verifies the complete CPU program. Separate module-level truth-table screenshots require appropriate individual testbenches or equivalent module-specific simulations.

## 9. Simulation Results and Expected Outputs

The following values are expected after each rising edge, including the reset edge.

| Cycle | Instruction | ACC / Q | R_OUT | Z | Next PC |
|---:|---|---|---|---:|---:|
| 0 | RESET | `0x00` | `0x00` | 1 | 0 |
| 1 | LDI 0x64 | `0x64` | `0x00` | 0 | 1 |
| 2 | STA | `0x64` | `0x64` | 0 | 2 |
| 3 | SUB 0x14 | `0x50` | `0x64` | 0 | 3 |
| 4 | ADD 0x0A | `0x5A` | `0x64` | 0 | 4 |
| 5 | STA | `0x5A` | `0x5A` | 0 | 5 |
| 6 | SUB 0x5A | `0x00` | `0x5A` | 1 | 6 |
| 7 | LDR | `0x5A` | `0x5A` | 0 | 7 |
| 8 | SUB 0x60 | `0xFA` | `0x5A` | 0 | 8 |

### Expected Final State

- **ACC / Q:** `0xFA`
- **R_OUT:** `0x5A`
- **Z:** `0`
- **PC:** `8` (`1000` in binary)

The testbench should report `ALL SET 8 CPU TESTS PASSED` when all assertions succeed.

---

# 10. Screenshot Evidence

**Instructions for adding screenshots:** Save each screenshot using the filename shown in the corresponding section. Place the image in `report/waveforms/`. The Markdown image references below provide spaces for the screenshots and will display them when the image files are added.

Each screenshot should be readable, show the relevant signal names or schematic components, and include enough information to identify the functionality being demonstrated.

## 10.1 Project Hierarchy and Top-Level Architecture

**What to include:** The Xilinx ISE project hierarchy or RTL schematic showing the main CPU components and their connections.

**Suggested filename:** `00_cpu_hierarchy.png`

![CPU project hierarchy and top-level architecture](report/waveforms/00_cpu_hierarchy.png)

*Figure 1: Project hierarchy and top-level CPU architecture.*

## 10.2 NAND Gate Simulation

**What to include:** A waveform showing A, B, and Y for all four NAND input combinations.

**Suggested filename:** `01_nand_gate.png`

![NAND gate simulation](report/waveforms/01_nand_gate.png)

*Figure 2: NAND gate truth-table verification.*

## 10.3 NOT Gate Simulation

**What to include:** A waveform showing the input A and inverted output Y for both input values.

**Suggested filename:** `02_not_gate.png`

![NOT gate simulation](report/waveforms/02_not_gate.png)

*Figure 3: NOT gate truth-table verification.*

## 10.4 AND Gate Simulation

**What to include:** A waveform showing A, B, and Y for all four input combinations.

**Suggested filename:** `03_and_gate.png`

![AND gate simulation](report/waveforms/03_and_gate.png)

*Figure 4: AND gate truth-table verification.*

## 10.5 OR Gate Simulation

**What to include:** A waveform showing A, B, and Y for all four input combinations.

**Suggested filename:** `04_or_gate.png`

![OR gate simulation](report/waveforms/04_or_gate.png)

*Figure 5: OR gate truth-table verification.*

## 10.6 XOR Gate Simulation

**What to include:** A waveform showing A, B, and Y for all four input combinations.

**Suggested filename:** `05_xor_gate.png`

![XOR gate simulation](report/waveforms/05_xor_gate.png)

*Figure 6: XOR gate truth-table verification.*

## 10.7 Half Adder Simulation

**What to include:** A waveform showing A, B, SUM, and CARRY for all four input combinations.

**Suggested filename:** `06_half_adder.png`

![Half adder simulation](report/waveforms/06_half_adder.png)

*Figure 7: Half adder sum and carry verification.*

## 10.8 Full Adder Simulation

**What to include:** A waveform showing A, B, Cin, SUM, and Cout for all eight input combinations.

**Suggested filename:** `07_full_adder.png`

![Full adder simulation](report/waveforms/07_full_adder.png)

*Figure 8: Full adder sum and carry verification.*

## 10.9 ALU Addition Simulation

**What to include:** A waveform demonstrating 8-bit addition. Include the operands, operation selector, and ALU result.

**Suggested filename:** `08_alu_add.png`

![ALU addition simulation](report/waveforms/08_alu_add.png)

*Figure 9: Verification of 8-bit addition.*

## 10.10 ALU Subtraction Simulation

**What to include:** A waveform demonstrating subtraction, especially `0x5A - 0x60 = 0xFA`.

**Suggested filename:** `09_alu_sub.png`

![ALU subtraction simulation](report/waveforms/09_alu_sub.png)

*Figure 10: Verification of 8-bit subtraction and modulo-256 behavior.*

## 10.11 Program Counter Simulation

**What to include:** A waveform showing CLK, RESET, and PC. It should show PC resetting to zero and incrementing after successive rising clock edges.

**Suggested filename:** `10_program_counter.png`

![Program counter simulation](report/waveforms/10_program_counter.png)

*Figure 11: Program Counter reset and increment verification.*

## 10.12 Program ROM Verification

**What to include:** Evidence that the ROM outputs the eight required Set 8 instruction words at addresses 0–7. Also show that unused locations return `0x000`, if tested.

**Suggested filename:** `11_program_rom.png`

![Program ROM verification](report/waveforms/11_program_rom.png)

*Figure 12: Verification of Set 8 instruction memory.*

## 10.13 Control Unit Verification

**What to include:** Evidence of the decoded control signals for LDI, ADD, SUB, STA, and LDR. Include ACC_WE, R_WE, Z_WE, ALU_SEL, and ACC_SRC as applicable.

**Suggested filename:** `12_control_unit.png`

![Control Unit verification](report/waveforms/12_control_unit.png)

*Figure 13: Verification of instruction decoding and control-signal generation.*

## 10.14 ACC Register Verification

**What to include:** Evidence that ACC resets to zero, accepts new values when enabled, and retains its previous value when its write enable is inactive.

**Suggested filename:** `13_acc_register.png`

![ACC register verification](report/waveforms/13_acc_register.png)

*Figure 14: ACC register reset, write, and hold behavior.*

## 10.15 R Register Verification

**What to include:** Evidence that R resets to zero, stores the ACC value during STA, and retains its value during other instructions.

**Suggested filename:** `14_r_register.png`

![R register verification](report/waveforms/14_r_register.png)

*Figure 15: R register reset, write, and hold behavior.*

## 10.16 Z Flag Verification

**What to include:** Evidence that Z becomes 1 when an updated ACC value is zero, becomes 0 when the updated ACC value is nonzero, and remains unchanged when its write enable is inactive.

**Suggested filename:** `15_z_flag.png`

![Z flag verification](report/waveforms/15_z_flag.png)

*Figure 16: Verification of zero-flag behavior.*

## 10.17 Top-Level RTL Schematic

**What to include:** An RTL schematic of the integrated CPU, showing the PC, Program ROM, Control Unit, ALU, and register connections.

**Suggested filename:** `16_top_level_schematic.png`

![Top-level CPU RTL schematic](report/waveforms/16_top_level_schematic.png)

*Figure 17: RTL schematic of the integrated Set 8 CPU.*

## 10.18 Complete CPU Simulation Waveform

**What to include:** The complete behavioral simulation with CLK, RESET, PC, Q, R_OUT, and Z visible. The waveform should show the reset state and the execution of all eight instructions.

**Suggested filename:** `17_complete_cpu_waveform.png`

![Complete CPU simulation waveform](report/waveforms/17_complete_cpu_waveform.png)

*Figure 18: Complete Set 8 CPU simulation and program execution.*

## 10.19 LDI Instruction Verification

**What to include:** Evidence that the first instruction loads `0x64` into ACC, clears Z, and advances PC to 1.

**Suggested filename:** `18_ldi_verification.png`

![LDI instruction verification](report/waveforms/18_ldi_verification.png)

*Figure 19: Verification of LDI immediate loading.*

## 10.20 STA Instruction Verification

**What to include:** Evidence that STA copies ACC into R while ACC and Z remain unchanged. Ideally show both STA instructions in the program.

**Suggested filename:** `19_sta_verification.png`

![STA instruction verification](report/waveforms/19_sta_verification.png)

*Figure 20: Verification of STA register transfer.*

## 10.21 SUB Instruction Verification

**What to include:** Evidence that SUB correctly calculates `0x64 - 0x14 = 0x50`, `0x5A - 0x5A = 0x00`, and `0x5A - 0x60 = 0xFA`.

**Suggested filename:** `20_sub_verification.png`

![SUB instruction verification](report/waveforms/20_sub_verification.png)

*Figure 21: Verification of SUB operations, zero result, and modulo-256 subtraction.*

## 10.22 ADD Instruction Verification

**What to include:** Evidence that the ADD instruction calculates `0x50 + 0x0A = 0x5A`.

**Suggested filename:** `21_add_verification.png`

![ADD instruction verification](report/waveforms/21_add_verification.png)

*Figure 22: Verification of the ADD instruction.*

## 10.23 LDR Instruction Verification

**What to include:** Evidence that LDR loads `0x5A` from R into ACC, leaves R unchanged, and clears Z.

**Suggested filename:** `22_ldr_verification.png`

![LDR instruction verification](report/waveforms/22_ldr_verification.png)

*Figure 23: Verification of LDR register transfer.*

## 10.24 Testbench Assertion Results

**What to include:** The simulation transcript or console output showing that all testbench assertions completed without errors and the message `ALL SET 8 CPU TESTS PASSED` was reported.

**Suggested filename:** `23_testbench_pass.png`

![Testbench assertion results](report/waveforms/23_testbench_pass.png)

*Figure 24: Successful completion of the Set 8 CPU testbench.*

**Screenshot note:** The supplied `tb_cpu_top.vhd` tests the integrated CPU. The standalone module screenshots above require individual module simulations or dedicated testbenches; do not use the complete CPU waveform as evidence that every standalone truth table was independently tested.

---

## 11. Challenges Faced

The following section should be completed after implementation and simulation.

Possible areas to discuss, if they reflect your actual experience, include:

- Correctly connecting structural VHDL components and their ports.
- Handling logic-signal and vector widths.
- Implementing two's-complement subtraction with an 8-bit result.
- Ensuring synchronous reset has priority over register write enables.
- Correctly updating the ACC, R, and Z registers for each opcode.
- Verifying the PC, ROM contents, and output values at rising clock edges.
- Debugging simulation errors and incorrect waveform results.

**Actual challenges encountered:**  
[Write your own implementation and debugging experiences here.]

## 12. Conclusion

This project implements a modular, single-cycle 8-bit CPU in VHDL for the assigned Set 8 instruction set. The design incorporates NAND-based logic components, an arithmetic unit, a Program Counter, a Program ROM, an instruction Control Unit, and the ACC, R, and Z state registers.

The CPU is designed to execute LDI, ADD, SUB, STA, and LDR instructions with synchronous, active-high reset. The testbench checks the required program sequence and the resulting register states.

**Final verification status:** [Complete this section after running the simulation and reviewing the assertion output and waveform screenshots.]

**Expected final state after the eight Set 8 instructions:**

- ACC / Q = `0xFA`
- R_OUT = `0x5A`
- Z = `0`
- PC = `8`

The final report should include the actual screenshots obtained from Xilinx ISE, the final source code, any observed simulation results, challenges encountered, and the completed conclusion.

