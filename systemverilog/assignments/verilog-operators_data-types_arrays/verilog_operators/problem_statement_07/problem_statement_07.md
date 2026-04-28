# Problem 07: Concatenation Operator in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to demonstrate the **concatenation operator `{}`**.



---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

module Concatenation_Operator;

  logic [3:0] a = 4'b1010;
  logic [3:0] b = 4'b1100;
  logic [7:0] result_concat;

  initial begin

    $display("Concatenation Operator in SystemVerilog");

    result_concat = {a, b};
    $display("Concatenation of a and b: {%b, %b} = %b", a, b, result_concat);

  end
endmodule
```
---

## Sample Output:
```text
Concatenation Operator in SystemVerilog

Concatenation of a and b: {1010, 1100} = 10101100
```
---

## Observation:

The concatenation operator `{}` combines multiple variables into a single wider vector by placing them side by side. The order matters, with the left operand occupying higher-order bits and the right operand occupying lower-order bits.
