# Problem 01: Continuous Assignment using wire

## Problem Statement:

Write a SystemVerilog program to demonstrate **continuous assignment** using the `wire` data type.

---

## Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here 
// or browse Examples 

module Continuous_Assignment_Example;

  wire a, b, xor_result;

  // Continuous assignments
  assign a = 1'b1;
  assign b = 1'b0;
  assign xor_result = a ^ b;

  initial begin
    #1;
    $display("Continuous_Assignment_Example");
    $display("Inputs: a = %b, b = %b", a, b);
    $display("Output: a ^ b = %b", xor_result);
  end
endmodule
```
---

## Sample Output:
```text
Continuous_Assignment_Example

Inputs: a = 1, b = 0

Output: a ^ b = 1
```
---

## Observation:

A `wire` represents a physical connection and does not store values. It must be driven continuously using `assign`. Any change in the input automatically updates the output without procedural control.
