# RISC-V Single Cycle Modular Processor

## Overview
This repository contains the design and implementation of a **32-bit RISC-V Single Cycle Processor** developed using **Verilog HDL**. The processor follows a **modular design approach**, where each functional block of the CPU is implemented as a separate module.

In a **single-cycle processor**, every instruction is executed in **one clock cycle**. Although this architecture is not optimized for performance, it provides a **clear understanding of processor datapath and control logic**, making it ideal for learning CPU microarchitecture and digital design.

This project is part of my journey into **processor design and VLSI systems**.

---

## Processor Architecture

The processor follows the standard **single-cycle datapath architecture**, where the instruction passes through all stages of execution within a single clock cycle.

## Design Approach

The processor is designed using a **modular structure**, where each block is implemented independently and later integrated into the complete datapath.

Main modules include:

- Program Counter (PC)
- Instruction Memory
- Control Unit
- Register File
- Immediate Generator
- ALU
- ALU Control
- Data Memory
- Multiplexers
- Adders

This approach improves:

- readability of the design
- debugging
- scalability for future extensions

---

## Supported Instruction Types

The processor supports core **RISC-V RV32I instruction formats**:

- **R-Type**  
  Register-to-register arithmetic operations

- **I-Type**  
  Immediate arithmetic and load instructions

- **S-Type**  
  Store instructions

- **B-Type**  
  Conditional branch instructions

- **U-Type**  
  Upper immediate instructions

- **J-Type**  
  Jump instructions

---

## Repository Structure

```
Risc-v-Single-Cycle-Modular
│
├── modules
│   ├── ALU.v
│   ├── Control_Unit.v
│   ├── Register_File.v
│   ├── PC.v
│   ├── Instruction_Memory.v
│   ├── Data_Memory.v
│   └── ALU_Control.v
│
├── top
│   └── Top_Module.v
│
├── testbench
│   └── tb.v
│
└── README.md
```

---

## Tools Used

- **Verilog HDL**
- **ModelSim**

---

## How to Run the Simulation

1. Clone the repository
```bash
git clone https://github.com/S0UMY4J1T/Risc-v-Single-Cycle-Modular.git
```
2. Open the project in your preferred Verilog simulator.
3. Compile all the Verilog modules.
4. Run the **testbench** file.
5. Observe the processor execution using waveform viewer.

---

## Learning Outcomes

Through this project, the following concepts were explored:

- RISC-V Instruction Set Architecture
- Processor Datapath Design
- Control Unit Implementation
- Verilog Hardware Description Language
- Modular Digital System Design

---

## Future Work

Possible extensions for this project include:

- Multi-cycle RISC-V processor
- 5-stage pipelined processor
- Hazard detection and forwarding
- Branch prediction
- FPGA implementation
- Cache integration

---

## Author

**Soumyajit Samanta**  
Electronics Engineering  
IIT (ISM) Dhanbad

GitHub:  
https://github.com/S0UMY4J1T

---

## Project Motivation

This project is part of my exploration into **processor architecture and VLSI design**, with the goal of developing a deeper understanding of how modern processors are built from fundamental digital logic blocks.
