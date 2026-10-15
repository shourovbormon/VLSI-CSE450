# VLSI-CSE450

A collection of **VHDL-based VLSI and Digital Logic Design laboratory projects** developed as part of the **CSE450** course at the University of Asia Pacific (UAP).

This repository demonstrates the design, implementation, hierarchical construction, simulation, and verification of digital circuits using **VHDL**. The projects follow a progressive approach, starting from the fundamental NAND gate and advancing to arithmetic circuits, sequential logic, registers, and an instruction-driven 8-bit CPU.

---

## 📚 Repository Overview

The repository contains four major projects:

| # | Project | Description |
|---|---|---|
| 1 | **NAND Gate → 1-Bit Full Adder** | Construction of a 1-bit full adder using NAND gates |
| 2 | **NAND Gate → 8-Bit Full Adder** | Construction of an 8-bit ripple-carry full adder using 1-bit full-adder modules |
| 3 | **NAND Gate → 8-Bit Register** | Hierarchical construction of an 8-bit register using NAND-based sequential components |
| 4 | **Mini 8-Bit Accumulator CPU — Set 8** | Design of a single-cycle 8-bit CPU using VHDL, with instruction decoding, an ALU, registers, program memory, and a testbench |

The projects demonstrate both **combinational and sequential digital circuit design**, component reuse, hierarchical modeling, instruction execution, and simulation-based verification.

---

# 🏗️ Overall Design Approach

The repository follows a bottom-up hierarchical design methodology. The first projects focus on constructing digital components from NAND gates, while the final project integrates fundamental logic and sequential components into a more complex CPU architecture.

### Overall design progression

```text
                         NAND Gate
                            │
              ┌─────────────┴─────────────┐
              │                           │
              ▼                           ▼
       Combinational Logic         Sequential Logic
              │                           │
              ▼                           ▼
        1-Bit Full Adder              SR Latch
              │                           │
              ▼                           ▼
        8-Bit Full Adder            D Flip-Flop
                                          │
                                          ▼
                                       2:1 MUX
                                          │
                                          ▼
                                     1-Bit Register
                                          │
                                          ▼
                                     8-Bit Register

                     Digital Logic Building Blocks
                                │
                                ▼
                        Mini 8-Bit CPU
                                │
          ┌─────────────────────┼─────────────────────┐
          │                     │                     │
          ▼                     ▼                     ▼
     Program ROM          Control Unit              ALU
          │                     │                     │
          └─────────────────────┴─────────────────────┘
                                │
                                ▼
                       ACC / R / Z Registers
                                │
                                ▼
                      8-Bit CPU Output (Q)
```

This progression demonstrates how basic logic functions can be combined into arithmetic circuits, storage elements, and finally an instruction-driven digital system.

---

# 📁 Projects

## 1️⃣ NAND Gate to 1-Bit Full Adder

This project develops a **1-bit full adder using NAND gates**. NAND is a universal gate that can be used to construct other fundamental Boolean logic functions.

### Inputs

- `A`
- `B`
- `Cin`

### Outputs

- `Sum`
- `Cout`

### Design hierarchy

```text
NAND Gate
    │
    ▼
NAND-Based XOR and Carry Logic
    │
    ▼
1-Bit Full Adder
```

The full adder performs binary addition of A, B, and carry-in. It generates the sum and carry-out required for multi-bit arithmetic.

The project includes VHDL source files and testbenches for verifying the NAND gate and full-adder functionality.

**Project folder:**

```text
01_NAND_Gate_to_1_Bit_Full_Adder/
```

---

## 2️⃣ NAND Gate to 8-Bit Full Adder

The second project extends the 1-bit full adder into an **8-bit ripple-carry full adder** by connecting eight full-adder modules in sequence.

### Design hierarchy

```text
NAND Gate
    │
    ▼
1-Bit Full Adder
    │
    ├── FA0
    ├── FA1
    ├── FA2
    ├── FA3
    ├── FA4
    ├── FA5
    ├── FA6
    └── FA7
         │
         ▼
    8-Bit Full Adder
```

The carry output of each full-adder stage is connected to the carry input of the next stage.

```text
Cin → FA0 → FA1 → FA2 → FA3 → FA4 → FA5 → FA6 → FA7 → Cout
```

This project demonstrates modular arithmetic design, component instantiation, and carry propagation through a multi-bit adder.

**Project folder:**

```text
02_NAND_Gate_to_8_Bit_Full_Adder/
```

---

## 3️⃣ NAND Gate to 8-Bit Register

The third project focuses on sequential digital logic and the hierarchical construction of an **8-bit register** using NAND-based components.

### Design hierarchy

```text
NAND Gate
    │
    ▼
SR Latch
    │
    ▼
D Flip-Flop
    │
    ├── 2:1 MUX
    │
    ▼
1-Bit Register
    │
    ▼
8-Bit Register
```

The 1-bit register supports:

- Synchronous reset
- Data loading
- Data holding
- Clock-controlled data transfer

Eight 1-bit registers are combined to form the final 8-bit register.

The project demonstrates how basic storage elements can be combined into a larger sequential circuit.

**Project folder:**

```text
03_NAND_Gate_to_8_Bit_Register/
```

---

## 4️⃣ Mini 8-Bit Accumulator CPU — Set 8

The fourth project implements a **single-cycle 8-bit accumulator CPU in VHDL** as part of the CSE450 VLSI Lab final project.

The CPU uses a modular architecture consisting of a Program Counter (PC), Program ROM, Control Unit, Arithmetic Logic Unit (ALU), Accumulator (ACC), holding register (R), and Zero Flag (Z).

The CPU fetches, decodes, and executes one instruction per clock cycle. Sequential state changes occur on the rising edge of the clock, and the design uses a synchronous, active-high reset.

### Assigned instruction set

The student's ID is `22201028`. Since the last digit is 8, the assigned instruction set is **Set 8**.

The complete instruction set contains the two mandatory instructions, LDI and ADD, and the three assigned instructions, STA, LDR, and SUB.

| Instruction | Opcode | Operation |
|---|---|---|
| `LDI imm` | `0001` | ACC ← immediate operand |
| `ADD imm` | `0010` | ACC ← ACC + immediate operand |
| `SUB imm` | `0011` | ACC ← ACC − immediate operand, modulo 256 |
| `STA` | `1010` | R ← ACC; ACC remains unchanged |
| `LDR` | `1011` | ACC ← R |

### CPU architecture

```text
                 ┌──────────────────┐
                 │ Program Counter  │
                 │     PC (4-bit)   │
                 └────────┬─────────┘
                          │ Address
                          ▼
                 ┌──────────────────┐
                 │    Program ROM   │
                 │  16 × 12-bit     │
                 └────────┬─────────┘
                          │ Instruction
                          ▼
                 ┌──────────────────┐
                 │   Control Unit   │
                 │  Opcode Decoder  │
                 └────────┬─────────┘
                          │ Control Signals
                          ▼
                 ┌──────────────────┐
                 │    8-Bit ALU     │
                 │    ADD / SUB     │
                 └────────┬─────────┘
                          │ Arithmetic Result
                          ▼
                 ┌──────────────────┐
                 │   ACC / R / Z    │
                 │ State Registers  │
                 └────────┬─────────┘
                          │
                          ▼
                      CPU Output Q
```

### Major components

| Component | Purpose |
|---|---|
| `nand_gate.vhd` | Implements the universal NAND gate |
| `not_gate.vhd` | Constructs NOT logic from NAND |
| `and_gate.vhd` | Constructs AND logic from NAND |
| `or_gate.vhd` | Constructs OR logic from NAND |
| `xor_gate.vhd` | Implements XOR using four NAND gates |
| `half_adder.vhd` | Performs one-bit addition |
| `full_adder_nand.vhd` | Performs one-bit addition with carry-in |
| `alu_8bit.vhd` | Performs 8-bit addition and subtraction |
| `program_counter.vhd` | Holds the instruction address and advances sequentially |
| `program_rom.vhd` | Stores the assigned Set 8 program |
| `control_unit.vhd` | Decodes the opcode and generates control signals |
| `acc_register.vhd` | Stores the current 8-bit accumulator value |
| `r_register.vhd` | Stores a value for the STA and LDR instructions |
| `z_flag.vhd` | Stores the zero flag |
| `cpu_top.vhd` | Integrates the CPU components |
| `tb_cpu_top.vhd` | Tests the integrated CPU using a VHDL testbench |

### Program ROM

The Program ROM contains 16 locations, each holding a 12-bit instruction. The first eight locations contain the required Set 8 program. Unused addresses contain `0x000`, representing NOP.

| Address | Instruction | Encoded Word |
|---:|---|---|
| 0 | LDI `0x64` | `0x164` |
| 1 | STA | `0xA00` |
| 2 | SUB `0x14` | `0x314` |
| 3 | ADD `0x0A` | `0x20A` |
| 4 | STA | `0xA00` |
| 5 | SUB `0x5A` | `0x35A` |
| 6 | LDR | `0xB00` |
| 7 | SUB `0x60` | `0x360` |
| 8–15 | NOP | `0x000` |

### Expected final state

After executing the eight instructions, the expected register state is:

| Signal | Expected value |
|---|---|
| ACC / Q | `0xFA` |
| R | `0x5A` |
| Z | `0` |
| PC | `8` (`1000` in binary) |

The testbench verifies the reset state and the expected outputs after every instruction. The design is considered verified when the simulation results match the required Set 8 program and all testbench assertions pass.

### Repository folder

```text
Cpu_8_bit/
```

This project has its own README containing its implementation details, compilation order, simulation instructions, and screenshots. For the complete CPU source files and documentation, see the [`Cpu_8_bit` project folder](Cpu_8_bit/).

---

# 🧩 Major Components Across the Repository

The repository covers the following digital design components.

### Combinational Components

- NAND Gate
- NOT, AND, OR, and XOR Gates
- Half Adder
- NAND-Based Full Adder
- 8-Bit Ripple-Carry Full Adder
- 8-Bit ADD/SUB Arithmetic Unit
- Program ROM
- Instruction Decoder and Control Logic
- Data-Selection Logic

### Sequential Components

- NAND-Based SR Latch
- NAND-Based D Flip-Flop
- 2:1 Multiplexer
- 1-Bit Register
- 8-Bit Register
- 4-Bit Program Counter
- 8-Bit Accumulator
- 8-Bit Holding Register
- Zero Flag

---

# 🧪 Simulation & Verification

Simulation and waveform analysis are used to verify the behavior of the individual components and integrated systems.

### Basic Logic and Arithmetic Verification

The earlier projects cover:

- Testing all NAND gate input combinations
- Testing SR latch set, reset, hold, and invalid conditions
- Testing D flip-flop data capture
- Testing all 2:1 multiplexer select combinations
- Testing 1-bit register load, hold, and reset behavior
- Testing 8-bit register data storage
- Testing all 1-bit full-adder input combinations
- Testing 8-bit binary addition
- Verifying carry propagation through the 8-bit full adder

### CPU Verification

The `Cpu_8_bit` project focuses on:

- Verifying the Set 8 instruction words stored in ROM
- Checking Program Counter reset and sequential increment
- Testing the ADD and SUB operations
- Verifying LDI immediate loading
- Verifying STA and LDR register transfers
- Checking Zero Flag generation and hold behavior
- Checking synchronous, active-high reset
- Executing the complete eight-instruction program
- Comparing PC, ACC/Q, R, and Z with the expected results
- Reviewing the final CPU RTL schematic and simulation waveforms

The complete CPU testbench checks the integrated behavior of the design. Individual component truth-table verification requires corresponding module-level simulations or dedicated testbenches.

---

# 📂 Repository Structure

The main repository contains three standalone digital logic projects and the `Cpu_8_bit` sub-repository.

```text
VLSI-CSE450/
│
├── 01_NAND_Gate_to_1_Bit_Full_Adder/
│   ├── Nand_Gate.vhd
│   ├── Nand_Gate_tb.vhd
│   ├── Full_adder.vhd
│   ├── Full_adder_tb.vhd
│   └── README.md
│
├── 02_NAND_Gate_to_8_Bit_Full_Adder/
│   ├── Nand_Gate.vhd
│   ├── Nand_Gate_tb.vhd
│   ├── Full_adder.vhd
│   ├── Full_adder_tb.vhd
│   ├── Full_adder_8bit.vhd
│   ├── Full_adder_8bit_tb.vhd
│   └── README.md
│
├── 03_NAND_Gate_to_8_Bit_Register/
│   ├── Nand_Gate.vhd
│   ├── Nand_Gate_tb.vhd
│   ├── SR_Latch.vhd
│   ├── SR_Latch_tb.vhd
│   ├── D_Flip_Flop.vhd
│   ├── D_Flip_Flop_tb.vhd
│   ├── MUX_2to1.vhd
│   ├── MUX_2to1_tb.vhd
│   ├── register_1bit.vhd
│   ├── register_1bit_tb.vhd
│   ├── register_8bit.vhd
│   ├── register_8bit_tb.vhd
│   └── README.md
│
├── Cpu_8_bit/
│   ├── screenshots/
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
│   ├── cpu_top.vhd
│   ├── tb_cpu_top.vhd
│   └── README.md
│
└── README.md
```

**Note:** The tree represents the intended logical organization. The `Cpu_8_bit` entry refers to the CPU project within the main repository; if it is maintained as a separate GitHub repository or Git submodule, it may appear as a repository link or submodule reference rather than as ordinary files when viewed on GitHub.

---

# 🛠️ Tools & Technologies

- **VHDL** — Hardware description language
- **Cadence software** — Used for the relevant earlier digital logic and sequential circuit laboratory projects, where applicable
- **Xilinx ISE Design Suite** — Used for the Mini 8-bit Accumulator CPU project
- **IEEE.STD_LOGIC_1164** — Standard logic signal types
- **IEEE.NUMERIC_STD** — Arithmetic operations in VHDL
- **Git** — Source-code version control
- **GitHub** — Repository hosting and collaboration
- **Structural VHDL Modeling** — Building circuits from component instances
- **Hierarchical Digital Logic Design** — Combining lower-level modules into larger circuits
- **Behavioral Simulation** — Verifying circuit operation over time
- **RTL Schematic Analysis** — Inspecting the generated hardware hierarchy
- **Waveform Analysis** — Checking signals and sequential timing

---

# 🎯 Learning Outcomes

Through these projects, I gained practical experience in:

- Designing digital circuits using VHDL
- Understanding NAND as a universal logic gate
- Constructing logic functions from NAND gates
- Applying structural and hierarchical VHDL modeling
- Instantiating and reusing components
- Designing combinational and sequential logic
- Building half adders and full adders
- Constructing multi-bit arithmetic circuits
- Understanding ripple-carry addition and carry propagation
- Designing latches, flip-flops, multiplexers, and registers
- Implementing a clocked Program Counter
- Representing instructions in a Program ROM
- Understanding opcode decoding and control signals
- Implementing an 8-bit ADD/SUB arithmetic unit
- Designing a single-cycle CPU architecture
- Implementing synchronous, active-high reset
- Maintaining state with ACC, R, and Z registers
- Creating VHDL testbenches
- Simulating digital circuits in the appropriate development environment
- Inspecting RTL schematics
- Analyzing waveforms and verifying expected results
- Organizing projects using Git and GitHub

---

# 📈 Project Progression

The repository demonstrates a progression from fundamental logic gates to a small instruction-driven processor.

```text
NAND Gate
    │
    ├───────────────────────────┐
    │                           │
    ▼                           ▼
1-Bit Full Adder             SR Latch
    │                           │
    ▼                           ▼
8-Bit Full Adder           D Flip-Flop
                                │
                                ▼
                             2:1 MUX
                                │
                                ▼
                           1-Bit Register
                                │
                                ▼
                           8-Bit Register
                                │
                                ▼
                    Digital Logic Components
                                │
                                ▼
                      Mini 8-Bit Accumulator CPU
                                │
              ┌─────────────────┼─────────────────┐
              │                 │                 │
              ▼                 ▼                 ▼
          Program ROM      Control Unit          ALU
              │                 │                 │
              └─────────────────┴─────────────────┘
                                │
                                ▼
                         ACC / R / Z Registers
                                │
                                ▼
                         CPU Output and State
```

The earlier projects focus on the construction of arithmetic and sequential building blocks. The final CPU project demonstrates how such components can be organized into a larger system that executes instructions stored in program memory.

---

# 📖 Course Information

**Course:** CSE450 — VLSI Lab  
**Institution:** University of Asia Pacific (UAP)  
**Area:** VLSI and Digital Logic Design  
**Implementation Language:** VHDL  
**Simulation Environments:** Cadence and Xilinx ISE, depending on the project

---

# 👨‍💻 Author

**Shourov Chandra Bormon**

Computer Science & Engineering  
**University of Asia Pacific (UAP)**

---

# 🎓 Academic Purpose

This repository was developed as part of the CSE450 VLSI laboratory coursework to gain practical experience in digital circuit design, VHDL-based implementation, hierarchical modeling, component instantiation, CPU architecture, simulation, and verification.

The projects demonstrate the process of building complex digital systems from reusable components, beginning with universal logic gates and progressing through arithmetic circuits, sequential storage elements, and a complete instruction-driven CPU.

---

⭐ **Explore the individual project folders to learn more about the VHDL implementations, RTL schematics, testbenches, simulation waveforms, and design methodology.**
