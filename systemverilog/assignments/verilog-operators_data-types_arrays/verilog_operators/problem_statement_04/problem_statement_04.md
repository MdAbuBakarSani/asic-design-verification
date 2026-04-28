# Problem 04: Reduction Operators in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to demonstrate **reduction operators**:

- AND reduction `&`
- NAND reduction `~&`
- OR reduction `|`
- NOR reduction `~|`
- XOR reduction `^`
- XNOR reduction `~^`



---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

module Reduction_Operators;

  logic [3:0] a = 4'b1101;
  logic result;

  initial begin

    $display("Reduction Operators in SystemVerilog");

    // AND reduction
    result = &a;
    $display("&a = &%b = %0b", a, result);

    // NAND reduction
    result = ~&a;
    $display("~&a = ~&%b = %0b", a, result);

    // OR reduction
    result = |a;
    $display("|a = |%b = %0b", a, result);

    // NOR reduction
    result = ~|a;
    $display("~|a = ~|%b = %0b", a, result);

    // XOR reduction
    result = ^a;
    $display("^a = ^%b = %0b", a, result);

    // XNOR reduction
    result = ~^a;
    $display("~^a = ~^%b = %0b", a, result);

  end
endmodule
```
---

## Sample Output:
```text
Reduction Operators in SystemVerilog

&a = &1101 = 0

~&a = ~&1101 = 1

|a = |1101 = 1

~|a = ~|1101 = 0

^a = ^1101 = 1

~^a = ~^1101 = 0
```
---

## Observation:

Reduction operators apply a bitwise operation across all bits of a vector and produce a single-bit result. They are commonly used for checks such as parity, zero detection and validation logic in hardware design.
