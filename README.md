# VLSI-CSE450

A collection of **VHDL-based VLSI and Digital Logic Design laboratory projects** developed as part of the **CSE450** course.

This repository demonstrates the design, implementation, simulation, and hierarchical construction of digital circuits using **VHDL**. The projects are developed progressively, starting from the fundamental **NAND gate** and building more complex combinational and sequential circuits.

---

## 📚 Repository Overview

The repository contains three major projects:

| # | Project                          | Description                                                                           |
| - | -------------------------------- | ------------------------------------------------------------------------------------- |
| 1 | **NAND Gate → 1-Bit Full Adder** | Construction of a 1-bit Full Adder using NAND gates                                   |
| 2 | **NAND Gate → 8-Bit Full Adder** | Construction of an 8-bit ripple-carry Full Adder using 1-bit Full Adder modules       |
| 3 | **NAND Gate → 8-Bit Register**   | Hierarchical construction of an 8-bit register using NAND-based sequential components |

The projects demonstrate both **combinational** and **sequential** digital circuit design.

---

# 🏗️ Overall Design Approach

The projects follow a **bottom-up hierarchical design methodology**.

The fundamental building block is the NAND gate, which is then used to construct more complex digital components.

### Overall hierarchy

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
```

This approach demonstrates how complex digital systems can be created by combining and reusing smaller, tested modules.

---

# 📁 Projects

## 1️⃣ NAND Gate to 1-Bit Full Adder

The first project develops a **1-bit Full Adder using NAND gates**.

### Inputs

* `A`
* `B`
* `Cin`

### Outputs

* `Sum`
* `Cout`

### Hierarchy

```text
NAND Gate
    │
    ▼
NAND-based Logic
    │
    ▼
1-Bit Full Adder
```

The project includes VHDL source files and testbenches for verifying the NAND gate and Full Adder functionality.

📂 Project folder:

```text
01_NAND_Gate_to_1_Bit_Full_Adder/
```

---

## 2️⃣ NAND Gate to 8-Bit Full Adder

The second project extends the 1-bit Full Adder into an **8-bit Full Adder**.

Eight 1-bit Full Adders are connected together to create a **ripple-carry structure**.

### Hierarchy

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

The carry output of each stage is connected to the carry input of the next stage.

```text
Cin → FA0 → FA1 → FA2 → FA3 → FA4 → FA5 → FA6 → FA7 → Cout
```

📂 Project folder:

```text
02_NAND_Gate_to_8_Bit_Full_Adder/
```

---

## 3️⃣ NAND Gate to 8-Bit Register

The third project focuses on **sequential logic** and develops an 8-bit register hierarchically from a NAND gate.

### Hierarchy

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

* Synchronous reset
* Data loading
* Data holding
* Clock-controlled data transfer

Eight 1-bit registers are then combined to form the final 8-bit register.

📂 Project folder:

```text
03_NAND_Gate_to_8_Bit_Register/
```

---

# 🧩 Major Components

The following components are developed throughout the repository:

### Combinational Components

* NAND Gate
* NAND-based Full Adder
* 1-Bit Full Adder
* 8-Bit Ripple-Carry Full Adder

### Sequential Components

* NAND-based SR Latch
* NAND-based D Flip-Flop
* 2:1 Multiplexer
* 1-Bit Register
* 8-Bit Register

---

# 🧪 Simulation & Verification

Each major component includes a corresponding **VHDL testbench** to verify its functionality.

Testing is performed through simulation and waveform analysis.

The verification process includes:

* Testing all NAND gate input combinations
* Testing SR latch set, reset, hold, and invalid conditions
* Testing D Flip-Flop data capture
* Testing all 2:1 MUX input/select combinations
* Testing 1-bit register load, hold, and reset operations
* Testing 8-bit register data storage
* Testing all 1-bit Full Adder input combinations
* Testing 8-bit binary addition
* Verifying carry propagation through the 8-bit Full Adder

---

# 📂 Repository Structure

```text
VLSI-CSE450/
│
├── 01_NAND_Gate_to_1_Bit_Full_Adder/
│   │
│   ├── Nand_Gate.vhd
│   ├── Nand_Gate_tb.vhd
│   ├── Full_adder.vhd
│   ├── Full_adder_tb.vhd
│   └── README.md
│
├── 02_NAND_Gate_to_8_Bit_Full_Adder/
│   │
│   ├── Nand_Gate.vhd
│   ├── Nand_Gate_tb.vhd
│   ├── Full_adder.vhd
│   ├── Full_adder_tb.vhd
│   ├── Full_adder_8bit.vhd
│   ├── Full_adder_8bit_tb.vhd
│   └── README.md
│
├── 03_NAND_Gate_to_8_Bit_Register/
│   │
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
└── README.md
```

> The folder and file names can be adjusted to match the actual repository structure.

---

# 🛠️ Tools & Technologies

* **VHDL**
* **Cadence Software**
* Structural VHDL Modeling
* Hierarchical Digital Logic Design
* Digital Logic Design
* NAND Gate Implementation
* VHDL Testbenches
* Digital Circuit Simulation
* Waveform Analysis

---

# 🎯 Learning Outcomes

Through these projects, I gained practical experience in:

* Designing digital circuits using VHDL
* Understanding NAND as a universal logic gate
* Building complex circuits from basic components
* Applying structural and hierarchical VHDL modeling
* Instantiating reusable components
* Designing combinational logic circuits
* Designing sequential logic circuits
* Building Full Adders from NAND gates
* Constructing multi-bit arithmetic circuits
* Understanding ripple-carry addition
* Designing latches and flip-flops
* Building registers from lower-level components
* Creating VHDL testbenches
* Simulating digital circuits
* Analyzing waveform outputs
* Verifying circuit behavior against expected results

---

# 📈 Project Progression

The repository represents a progressive development path:

```text
NAND Gate
    │
    ├───────────────────────┐
    │                       │
    ▼                       ▼
1-Bit Full Adder         SR Latch
    │                       │
    ▼                       ▼
8-Bit Full Adder       D Flip-Flop
                            │
                            ▼
                         2:1 MUX
                            │
                            ▼
                       1-Bit Register
                            │
                            ▼
                       8-Bit Register
```

This progression demonstrates how fundamental digital logic components can be combined to create increasingly complex systems.

---

# 📖 Course

**Course:** CSE450
**Area:** VLSI / Digital Logic Design
**Implementation Language:** VHDL
**Simulation Environment:** Cadence

---

# 👨‍💻 Author

**Shourov Chandra Bormon**

Computer Science & Engineering
**University of Asia Pacific (UAP)**

---

# 🎓 Academic Purpose

This repository was developed as part of the **CSE450 VLSI laboratory work** to gain practical experience in VHDL-based digital circuit design, hierarchical modeling, component instantiation, simulation, and verification.

The projects demonstrate the complete design process from fundamental logic gates to arithmetic and sequential digital circuits.

---

⭐ **If you find this repository useful, feel free to explore the individual project folders and their respective README files.**
