# MINI_CPU Project

## Overview
This project implements a minimal CPU in Verilog, combining a Register File, ALU, and Finite State Machine (FSM) controller. The CPU supports 8 basic instructions and demonstrates the fundamental concepts of CPU architecture and control flow.  
All files and documentation are contained in this directory.

---

## Instruction Set Architecture (ISA)

| Opcode | Mnemonic | Binary Format     | Example             | Description                               |
|--------|----------|------------------|---------------------|-------------------------------------------|
| 000    | ADD      | 000_dd_ss_0      | ADD R1, R2          | Rdest = Rdest + Rsrc                      |
| 001    | SUB      | 001_dd_ss_0      | SUB R1, R2          | Rdest = Rdest - Rsrc                      |
| 010    | AND      | 010_dd_ss_0      | AND R1, R2          | Rdest = Rdest & Rsrc                      |
| 011    | OR       | 011_dd_ss_0      | OR R1, R2           | Rdest = Rdest \| Rsrc                     |
| 100    | LOAD     | 100_dd_aa_0      | LOAD R1, [addr]     | Rdest = MEM[address]                      |
| 101    | STORE    | 101_ss_aa_0      | STORE R1, [addr]    | MEM[address] = Rsrc                       |
| 110    | MOV      | 110_dd_ss_0      | MOV R1, R2          | Rdest = Rsrc                              |
| 111    | JMP/JZ   | 111_xx_aa_c      | JMP 01 / JZ 10      | PC = address (JMP) or if zero (JZ, c=1)   |

**Fields:**
- `dd` : Destination Register (2 bits)
- `ss` : Source Register (2 bits)
- `aa` : Address/Immediate (2 bits)
- `c`  : Condition flag (JZ only; 1=jump if zero, 0=always)
- `xx` : Not used (set to 00)

---

## Instruction Format

Each instruction is 8 bits, with the following layout:

| 7:5 (3 bits) | 4:3 (2 bits) | 2:1 (2 bits) | 0 (1 bit)     |
|--------------|--------------|--------------|---------------|
| Opcode       | Dest reg     | Src/Addr     | Extra/Cond    |

**Example:**  
- `ADD R1, R2` → `000 01 10 0` → `8'b000_01_10_0`
- `LOAD R3, [10]` → `100 11 10 0`
- `JZ 01` → `111 00 01 1`

---

## Project Structure

- **Register File**: 4 registers, 8 bits each, accessible by address.
- **ALU**: Supports arithmetic (ADD, SUB) and logic (AND, OR) operations.
- **FSM Controller**: Fetches, decodes, and executes instructions step by step.
- **Instruction ROM**: Stores program instructions.
- **Testbenches**: Verifies functionality for each module and the CPU as a whole.

---

## Getting Started

1. Clone the repository or copy the project files.
2. All design and testbench files are inside `MINI_CPU/`.
3. To simulate: use [Icarus Verilog](http://iverilog.icarus.com/) and [GTKWave](http://gtkwave.sourceforge.net/) (or Vivado for advanced simulation).

```sh
# Example:
iverilog -g2012 mini_cpu_top.v mini_cpu_tb.v -o mini_cpu_tb.out
vvp mini_cpu_tb.out
gtkwave dump.vcd


//
   +-------------------+
   |  Instruction ROM  | <------+
   +---------+---------+        |
             |    (Opcode,     |
             |   Dest, Src)    |
             v                 |
   +------------------------+  |
   |          FSM           |--+
   | (Controller/Sequencer) |  
   +---+-----------+--------+  
       |           |           
       |           |           
       v           v           
+-------------+   +---------------+    
| Register    |   |    ALU        |   
| File        |   +---------------+   
+------+------+         ^             
       |                |             
       +----------------+             
             (Operands, Result)       

   +------------------+        
   |   Data Memory    | <-----+
   +--------+---------+       |
            |                 |
            +-----------------+
               (Load/Store)
//