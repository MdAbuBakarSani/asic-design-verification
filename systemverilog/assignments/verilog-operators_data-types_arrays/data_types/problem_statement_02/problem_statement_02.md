# Problem 02: Blocking and Non-Blocking Assignment using reg

## Problem Statement:

Write a SystemVerilog program to demonstrate:

- Blocking assignment `=`
- Non-blocking assignment `<=`

---

## Solution:

The solution is implemented as follows:

```systemverilog


// Code your testbench here 
// or browse Examples

module Blocking_NonBlocking_Example;

  reg a, b, c;
  reg x, y, z;

  initial begin

    // Blocking assignment
    a = 1;
    b = a;
    c = b;

    $display("Blocking Assignments:");
    $display("a = %b, b = %b, c = %b", a, b, c);

    // Non-blocking assignment
    #1;
    x <= 1;
    y <= x;
    z <= y;

    #1;
    $display("Non-Blocking Assignments:");
    $display("x = %b, y = %b, z = %b", x, y, z);

  end
endmodule
```
---

## Sample Output:
```text
Blocking Assignments:
a = 1, b = 1, c = 1

Non-Blocking Assignments:
x = 1, y = x, z = x
```
---

## Observation:

Blocking assignments (`=`) execute sequentially, so each statement uses the updated value immediately. Non-blocking assignments (`<=`) schedule updates to occur simultaneously at the end of the time step, so all right-hand sides use old values.
