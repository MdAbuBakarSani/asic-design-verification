# Problem 18: Enum Member Count using num()

## Problem Statement:

Write a SystemVerilog program to:

- Declare an enumeration with **5 values**
- Use the built-in enum method `.num()`  
- Display the **total number of members**

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module Enum_Num_Method;

  typedef enum {Verilog, SystemVerilog, UVM, Protocols, Soc} asic_dv;

  initial begin
    asic_dv course;

    $display("Total Number of Courses in ASIC DV Curriculum: %0d", course.num());
 
  end
endmodule
```
---

## Sample Output:
```text
Total Number of Courses in ASIC DV Curriculum: 5
```
---

## Observation:

`.num()` returns the total number of enum literals, not the current value.
