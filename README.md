# ALU with Randomized Constrained Operations

A SystemVerilog testbench for a 4-bit ALU, driven by constrained-random stimulus. Built as a hands-on exercise in class-based verification.

## What it does

The `alu` class randomizes two 4-bit operands (`operand_a`, `operand_b`) and a 2-bit opcode (`inp`). A constraint block keeps both operands in the range 1–7 and enforces `operand_a >= operand_b`, so subtraction never goes negative and division never hits zero.

The opcode selects one of four operations:

| inp | Operation |
|-----|-----------|
| 00  | Add |
| 01  | Subtract |
| 10  | Multiply |
| 11  | Divide |

Each iteration prints the operands, the operator symbol, and the result. The testbench runs 10 randomized iterations and dumps a VCD file for waveform viewing.

## Files

- `alu.sv` — the `alu` class and `tb` module

## Running it

```bash
# QuestaSim / ModelSim
vlog alu.sv
vsim -c tb -do "run -all; quit"

# VCS
vcs -sverilog alu.sv -R
```

Produces `dump.vcd`, viewable in GTKWave or a similar tool.

Waveform
<img width="1047" height="181" alt="image" src="https://github.com/user-attachments/assets/a0efc4ea-0cea-4a05-8905-43f216d91b6e" />
 randomization seed isn't fixed, so runs aren't reproducible. Both are reasonable next steps if this gets extended toward a proper verification environment.
