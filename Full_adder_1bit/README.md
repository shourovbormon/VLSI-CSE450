# NAND Gate to 1-Bit Full Adder

A hierarchical **VHDL implementation of a 1-bit Full Adder using only NAND gates**. This project demonstrates how a fundamental universal gate, the NAND gate, can be used to construct more complex combinational logic circuits through structural and hierarchical VHDL design.

## 📌 Project Overview

The project starts with a basic **NAND Gate** and builds a complete **1-bit Full Adder** using multiple NAND gate instances.

A Full Adder performs binary addition of three input bits:

* `A` — First input bit
* `B` — Second input bit
* `Cin` — Carry input

It produces two outputs:

* `Sum` — Sum bit
* `Cout` — Carry output

The entire Full Adder is constructed using **NAND gates only**.

## 🔗 Design Hierarchy

```text
NAND Gate
    │
    ├── NAND Gates
    │
    └── 1-Bit Full Adder
            ├── A
            ├── B
            ├── Cin
            ├── Sum
            └── Cout
```

The design demonstrates hierarchical construction, where the basic NAND gate is instantiated multiple times to implement the required logic for the Full Adder.

## 🧩 Components

### 1. NAND Gate

The NAND gate is the fundamental building block of the project.

```text
Y = NOT(A AND B)
```

Since NAND is a **universal logic gate**, it can be used to construct other logic gates and complete digital circuits.

### 2. 1-Bit Full Adder

The Full Adder is constructed entirely from NAND gate instances.

**Inputs:**

* `A`
* `B`
* `Cin`

**Outputs:**

* `Sum`
* `Cout`

The circuit performs:

```text
A + B + Cin
```

and generates the corresponding Sum and Carry outputs.

## 📊 Full Adder Truth Table

| A | B | Cin | Sum | Cout |
| - | - | --- | --- | ---- |
| 0 | 0 | 0   | 0   | 0    |
| 0 | 0 | 1   | 1   | 0    |
| 0 | 1 | 0   | 1   | 0    |
| 0 | 1 | 1   | 0   | 1    |
| 1 | 0 | 0   | 1   | 0    |
| 1 | 0 | 1   | 0   | 1    |
| 1 | 1 | 0   | 0   | 1    |
| 1 | 1 | 1   | 1   | 1    |

## 📁 Project Structure

```text
NAND-Gate-to-1-Bit-Full-Adder/
│
├── Nand_Gate.vhd
├── Nand_Gate_tb.vhd
│
├── Full_adder.vhd
├── Full_adder_tb.vhd
│
└── README.md
```

> File names may vary depending on the actual files in the repository.

## 🧪 Simulation & Testing

The project includes VHDL testbenches for verifying the functionality of the NAND Gate and Full Adder.

The Full Adder testbench applies all **8 possible combinations** of:

```text
A, B, Cin
```

and verifies the corresponding:

```text
Sum, Cout
```

outputs.

Simulation waveforms are used to confirm that the circuit produces the expected results for every input combination.

## 🛠️ Tools & Technologies

* **VHDL**
* **Cadence Software**
* Structural VHDL Modeling
* Hierarchical Digital Logic Design
* NAND Gate Logic
* VHDL Testbench
* Digital Circuit Simulation
* Waveform Analysis

## 🎯 Learning Outcomes

Through this project, I gained practical experience in:

* Designing digital circuits using VHDL
* Understanding NAND as a universal gate
* Building complex circuits from basic components
* Using component instantiation and `PORT MAP`
* Developing structural and hierarchical VHDL designs
* Creating VHDL testbenches
* Analyzing simulation waveforms
* Verifying digital circuits using truth tables

## 👨‍💻 Author

**Shourov Chandra Bormon**
Computer Science & Engineering
University of Asia Pacific (UAP)

## 🎓 Academic Purpose

This project was developed as part of an academic Digital Logic / VHDL laboratory exercise to understand hierarchical digital circuit design and simulation using VHDL.
