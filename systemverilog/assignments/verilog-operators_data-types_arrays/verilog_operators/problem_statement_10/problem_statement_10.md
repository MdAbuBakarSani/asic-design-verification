# Problem 10: Conditional (Ternary) Operator in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to demonstrate the **conditional (ternary) operator `? :`**.



---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

module Conditional_Operator;

  int a = 55;
  int b = 87;
  string result;

  initial begin

    $display("Conditional Operator in SystemVerilog");

    result = (a > b) ? "a is greater" : "b is greater";
    $display("Result is : %s", result);

  end
endmodule
```
---

## Sample Output:
```text
Conditional Operator in SystemVerilog

Result is : b is greater
```
---

## Observation:

The conditional operator evaluates a condition and selects one of two expressions based on the result. It provides a compact alternative to `if-else` statements and is widely used in combinational logic and assignments.
