# Problem 17: Nth Previous Enum Member in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to:

- Declare an enumeration with **5 values**
- Assign one value
- Use enum built-in method to get the **Nth previous member**
- Display both current value and Nth previous value

---

## Solution:
The solution is implemented as follows:
```systemverilog



// Code your testbench here 
// or browse Examples 

module Enum_Prev_Method;

  typedef enum {Verilog, SystemVerilog, UVM, Protocols, Soc} asic_dv;

  int n;

  initial begin

    asic_dv course;

    course = Protocols;
    n = 2;

    $display("Current Member: %s", course.name());

    $display("nth Previous Member (n = %0d): %s", n, course.prev(n).name());

  end
endmodule
```
---

## Sample Output:
```text
Current Member: Protocols

nth Previous Member (n = 2): SystemVerilog
```
---

## Observation:

The `.prev(n)` method moves n steps backward from the current enum value.
