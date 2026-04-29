# Problem 04: Signed Data Types in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to demonstrate **signed data types**:

- byte
- shortint
- int
- integer
- longint


---

## Solution:

The solution is implemented as follows:

```systemverilog


// Code your testbench here 
// or browse Examples 

module Signed_Data_Type;

  byte      a = 8'd101;
  shortint  b = -16'd2500;
  int       c = -32'd30000;
  integer   d = 32'd12345;
  longint   e = 64'd650123;

  initial begin

    $display("SystemVerilog Signed Data Types:");

    $display("byte a = %0d", a);
    $display("shortint b = %0d", b);
    $display("int c = %0d", c);
    $display("integer d = %0d", d);
    $display("longint e = %0d", e);

  end
endmodule
```
---

## Sample Output:
```text
SystemVerilog Signed Data Types:

byte a = 101

shortint b = -2500

int c = -30000

integer d = 12345

longint e = 650123
```
---

## Observation:

All these data types are **signed by default**, meaning they can represent both positive and negative values. The size of each type determines the range of values it can store.
