# Problem 03: Continuous, Blocking and Non-Blocking Assignment using logic

## Problem Statement:

Write a SystemVerilog program to demonstrate:

- Continuous assignment using `logic`
- Blocking assignment (`=`)
- Non-blocking assignment (`<=`)


---

## Solution:

The solution is implemented as follows:

```systemverilog


// Code your testbench here 
// or browse Examples 

module Logic_Assignments;

  logic a, b;
  logic blocking_assignment;
  logic nonblocking_assignment;

  // Continuous assignment
  assign a = 1'b1;
  assign b = 1'b0;

  initial begin

    $display("Continuous, Blocking and Non-blocking Assignments in SystemVerilog");
    $display("Input Values: a = %b, b = %b", a, b);

    // Blocking Assignment
    blocking_assignment = a | b;
    $display("Blocking Assignment : a | b = %b", blocking_assignment);

    #1;

    // Non-blocking Assignment
    nonblocking_assignment <= a ^ b;

    #1;
    $display("NonBlocking Assignment : a ^ b = %b", nonblocking_assignment);

  end
endmodule
```
---

## Sample Output:
```text
Continuous, Blocking and Non-blocking Assignments in SystemVerilog

Input Values: a = 1, b = 0

Blocking Assignment : a | b = 1

NonBlocking Assignment : a ^ b = 1
```
---

## Observation:

The `logic` data type can be used in both continuous (`assign`) and procedural (`initial`, `always`) assignments. Blocking assignments execute immediately while non-blocking assignments update values at the end of the time step.
