# Problem 15: Enumeration Methods in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to:

- Declare an enumeration with **5 values**
- Assign one value to a variable
- Use enum built-in methods to:
  - Get the **first member**
  - Get the **last member**
- Also demonstrate other enum methods for completeness

---

## Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here 
// or browse Examples 

module Enum_Data_Type;

  typedef enum {Verilog, SystemVerilog, UVM, Protocols, Soc} asic_dv;

  initial begin

    asic_dv asic_dv_courses;

    asic_dv_courses = UVM;

    $display("Enum Example in SystemVerilog");

    $display("asic_dv_courses.first(): %0d", asic_dv_courses.first());
    $display("asic_dv_courses.last(): %0d", asic_dv_courses.last());

    // Additional useful methods
    $display("asic_dv_courses.next(): %0d", asic_dv_courses.next());
    $display("asic_dv_courses.prev(): %0d", asic_dv_courses.prev());
    $display("asic_dv_courses.num(): %0d", asic_dv_courses.num());
    $display("asic_dv_courses.name(): %s", asic_dv_courses.name());
    $display("asic_dv_courses.next(3): %0d", asic_dv_courses.next(3));

  end
endmodule
```
---

## Sample Output:
```text
Enum Example in SystemVerilog

asic_dv_courses.first(): 0

asic_dv_courses.last(): 4

asic_dv_courses.next(): 3

asic_dv_courses.prev(): 1

asic_dv_courses.num(): 5

asic_dv_courses.name(): UVM

asic_dv_courses.next(3): 0
```
---

## Observation:

Enum methods provide powerful utilities to **navigate and inspect enumeration values dynamically**.
