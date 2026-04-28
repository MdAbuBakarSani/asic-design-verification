# Problem 06: Increment and Decrement Operators in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to demonstrate:

- Increment operator `++`
- Decrement operator `--`





---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

module Increment_Decrement_Operators;

  int a = 7;

  initial begin

    $display("Increment Decrement Operators in SystemVerilog");
    $display("Initial value: a = %0d", a);

    // Post-Increment
    a++;
    $display("After Post-Increment : a = %0d", a);

    // Pre-Increment
    ++a;
    $display("After Pre-Increment : a = %0d", a);

    // Post-Decrement
    a--;
    $display("After Post-Decrement : a = %0d", a);

    // Pre-Decrement
    --a;
    $display("After Pre-Decrement : a = %0d", a);

  end
endmodule
```
---

## Sample Output:
```text
Increment Decrement Operators in SystemVerilog

Initial value: a = 7

After Post-Increment : a = 8

After Pre-Increment : a = 9

After Post-Decrement : a = 8

After Pre-Decrement : a = 7
```
---

## Observation:

Increment and decrement operators change the value of a variable by one. Pre-operations modify the value before evaluation while post-operations modify it after evaluation. 
