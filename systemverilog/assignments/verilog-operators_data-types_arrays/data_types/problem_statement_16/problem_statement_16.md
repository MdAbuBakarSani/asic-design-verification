# Problem 16: Nth Next Enum Member in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to:

- Declare an enumeration with **5 values**
- Assign one value
- Use enum built-in method to get the **Nth next member**
- Display both current value and Nth next value

---

## Solution:
The solution is implemented as follows:
```systemverilog



// Code your testbench here 
// or browse Examples 

module Enum_Next_Method;

  typedef enum {Verilog, SystemVerilog, UVM, Protocols, Soc} asic_dv;

  int n;

  initial begin

    asic_dv course;

    course = UVM;
    n = 2;

    $display("Current Member: %s", course.name());

    $display("nth Next Member (n = %0d): %s", n, course.next(n).name());

  end
endmodule
```
---

## Sample Output:
```text
Current Member: UVM

nth Next Member (n = 2): Soc
```
---

## Observation:

The `.next(n)` method moves forward n steps from the current enum value.
