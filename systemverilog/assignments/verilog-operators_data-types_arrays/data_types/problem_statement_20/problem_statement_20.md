# Problem 20: Parameters and Constants in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to:

- Declare **parameters** at module level
- Declare **constants (const)** inside procedural block
- Perform calculations using both
- Display results clearly

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module Const_Parameter_Example #(
  parameter int WIDTH  = 8,
  parameter int HEIGHT = 4
);

  int area, volume;

  initial begin

    // Constant values (runtime constants)
    const int LENGTH = 8;
    const int DEPTH  = 3;

    // Calculations
    area   = WIDTH * HEIGHT;
    volume = LENGTH * DEPTH * HEIGHT;

    // Display
    $display("Parameter WIDTH  : %0d", WIDTH);
    $display("Parameter HEIGHT : %0d", HEIGHT);

    $display("Constant LENGTH  : %0d", LENGTH);
    $display("Constant DEPTH   : %0d", DEPTH);

    $display("Calculated area (WIDTH * HEIGHT) = (%0d * %0d) = %0d", WIDTH, HEIGHT, area);

    $display("Calculated volume (LENGTH * DEPTH * HEIGHT) = (%0d * %0d * %0d) = %0d", LENGTH, DEPTH, HEIGHT, volume);

  end
endmodule
```
---

## Sample Output:
```text
Parameter WIDTH  : 8

Parameter HEIGHT : 4

Constant LENGTH  : 8

Constant DEPTH   : 3

Calculated area (WIDTH * HEIGHT) = (8 * 4) = 32

Calculated volume (LENGTH * DEPTH * HEIGHT) = (8 * 3 * 4) = 96
```
---

## Observation:

**1. Parameter**
- Compile-time constant
- Can be overridden during instantiation
- Used for design configurability

**2. Const**
- Runtime constant (assigned once)
- Cannot change after initialization
- Used inside procedural blocks
