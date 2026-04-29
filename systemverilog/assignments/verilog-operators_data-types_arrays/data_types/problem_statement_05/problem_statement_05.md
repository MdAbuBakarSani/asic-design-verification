# Problem 05: Unsigned Data Types in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to demonstrate **unsigned data types**:

- byte unsigned
- shortint unsigned
- int unsigned
- longint unsigned


---

## Solution:

The solution is implemented as follows:

```systemverilog


// Code your testbench here 
// or browse Examples 

module Unsigned_Data_Type;

  byte unsigned      a = 8'd101;
  shortint unsigned  b = 16'd2500;
  int unsigned       c = 32'd30000;
  longint unsigned   d = 64'd650123;

  initial begin

    $display("SystemVerilog Unsigned Data Types:");

    $display("byte a = %0d", a);
    $display("shortint b = %0d", b);
    $display("int c = %0d", c);
    $display("longint d = %0d", d);

  end
endmodule
```
---

## Sample Output:
```text
SystemVerilog Unsigned Data Types:

byte a = 101

shortint b = 2500

int c = 30000

longint d = 650123
```
---

## Observation:

Unsigned data types can only represent **non-negative values**. They allocate all bits for magnitude, increasing the positive range compared to signed types.
