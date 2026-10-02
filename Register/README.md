# VHDL Hierarchical 8-Bit Register

A hierarchical **VHDL implementation of an 8-bit register**, developed step-by-step from a basic NAND gate. This project demonstrates structural VHDL design, component instantiation, sequential logic, and digital circuit hierarchy.

## 📌 Project Overview

The project builds an 8-bit register through a sequence of reusable VHDL components. Each higher-level component is constructed using previously developed lower-level components.

### Design Hierarchy

```text
Nand_Gate
    ↓
SR_Latch
    ↓
D_Flip_Flop
    ↓
MUX_2to1 + D_Flip_Flop
    ↓
1-Bit Register
    ↓
8-Bit Register
```

This hierarchical approach demonstrates how complex sequential circuits can be constructed from simpler digital building blocks.

---

## ⚙️ Components Implemented

### 1. NAND Gate

The fundamental building block of the project.

**Inputs:**

* `A`
* `B`

**Output:**

* `Y`

Logic:

```text
Y = A NAND B
```

---

### 2. SR Latch

A NAND-based SR latch is constructed using cross-coupled NAND gates.

**Inputs:**

* `S_N` – Active-low Set
* `R_N` – Active-low Reset

**Outputs:**

* `Q`
* `Q_N`

The latch provides the basic storage functionality required for sequential circuits.

---

### 3. D Flip-Flop

The D Flip-Flop is constructed using NAND gates and NAND-based SR latches in a master-slave configuration.

**Inputs:**

* `D`
* `CLK`

**Outputs:**

* `Q`
* `Q_N`

The implemented flip-flop stores the input data according to the active clock edge.

---

### 4. 2:1 Multiplexer

A 2:1 MUX is implemented using NAND gate instances.

```text
S = 0 → Y = I0
S = 1 → Y = I1
```

**Inputs:**

* `I0`
* `I1`
* `S`

**Output:**

* `Y`

---

### 5. 1-Bit Register

The 1-bit register combines the **2:1 MUX** and **D Flip-Flop**.

It supports:

* Data loading
* Data holding
* Synchronous reset

### Register Operation

| RESET | LOAD | Operation         |
| :---: | :--: | ----------------- |
|   1   |   X  | Reset `Q` to `0`  |
|   0   |   1  | Load `D`          |
|   0   |   0  | Hold previous `Q` |

---

### 6. 8-Bit Register

The final 8-bit register is constructed using **eight instances of the 1-bit register**.

```text
D(7 downto 0)
      │
      ├──► Register 7 ──► Q(7)
      ├──► Register 6 ──► Q(6)
      ├──► Register 5 ──► Q(5)
      ├──► Register 4 ──► Q(4)
      ├──► Register 3 ──► Q(3)
      ├──► Register 2 ──► Q(2)
      ├──► Register 1 ──► Q(1)
      └──► Register 0 ──► Q(0)
```

All eight registers share the same:

* `CLK`
* `RESET`
* `LOAD`

This allows the register to load an entire 8-bit value simultaneously.

---

## 🗂️ Project Structure

```text
VHDL-8bit-Register/
│
├── Nand_Gate.vhd
├── Nand_Gate_tb.vhd
│
├── SR_Latch.vhd
├── SR_Latch_tb.vhd
│
├── D_Flip_Flop.vhd
├── D_Flip_Flop_tb.vhd
│
├── MUX_2to1.vhd
├── MUX_2to1_tb.vhd
│
├── register_1bit.vhd
├── register_1bit_tb.vhd
│
├── register_8bit.vhd
├── register_8bit_tb.vhd
│
└── README.md
```

---

## 🧪 Simulation & Testing

Each component was tested individually using its corresponding VHDL testbench before being integrated into the next level of the hierarchy.

The simulations verify:

* NAND gate truth table
* SR latch Set, Reset, and Hold operations
* D Flip-Flop data storage
* MUX input selection
* 1-bit register Load, Hold, and Reset operations
* 8-bit parallel data storage

### Example 8-Bit Register Operation

When:

```text
RESET = 0
LOAD  = 1
D     = 10101010
```

the register stores:

```text
Q = 10101010
```

When:

```text
RESET = 0
LOAD  = 0
D     = 11111111
```

the previously stored value remains:

```text
Q = 10101010
```

When:

```text
RESET = 1
```

the register is synchronously reset to:

```text
Q = 00000000
```

---

## 🛠️ Tools & Technologies

* **VHDL**
* **Cadence**
* Digital Logic Design
* Structural/Hierarchical Modeling
* VHDL Testbenches
* Simulation and Waveform Analysis

---

## 🎯 Learning Outcomes

Through this project, I gained practical experience in:

* Designing digital circuits using VHDL
* Building complex circuits from basic components
* Structural VHDL modeling
* Component instantiation and port mapping
* Designing combinational and sequential circuits
* Understanding latches and flip-flops
* Implementing registers using reusable components
* Writing VHDL testbenches
* Analyzing simulation waveforms
* Understanding hierarchical digital system design

---

## 👨‍💻 Author

**Shourov Chandra Bormon**

Computer Science & Engineering
University of Asia Pacific (UAP)

---

## 📄 Academic Purpose

This project was developed as part of a **Digital Logic / VHDL laboratory experiment** for academic and learning purposes.
