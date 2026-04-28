# Problem 08: Replication Operator in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to demonstrate the **replication operator `{}`**.



---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

module Replication_Operator;

  logic [3:0] a = 4'b1010;
  logic [11:0] replicated_value;

  initial begin

    $display("Replication Operator in SystemVerilog");
    $display("Original value a = %b", a);

    replicated_value = {3{a}};
    $display("Replicated value {3{a}} = %b", replicated_value);

  end
endmodule
```
---

## Sample Output:
```text
Replication Operator in SystemVerilog

Original value a = 1010

Replicated value {3{a}} = 101010101010
```
---

## Observation:

The replication operator `{n{expression}}` repeats a given expression `n` times and concatenates the results into a wider vector. It is commonly used for pattern generation, masking and initializing repeated bit structures.
