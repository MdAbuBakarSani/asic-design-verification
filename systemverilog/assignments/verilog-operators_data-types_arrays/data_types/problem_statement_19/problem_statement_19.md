# Problem 19: Enum Name using name()

## Problem Statement:

Write a SystemVerilog program to:

- Declare an enumeration with **5 values**
- Assign one enum value
- Display:
  - The **numeric value (index)**
  - The **name of the enum using `.name()`**

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module Enum_Name_Method;

  typedef enum {Verilog, SystemVerilog, UVM, Protocols, Soc} asic_dv;

  initial begin
    asic_dv course;

    course = Soc;

    $display("Current Enumeration value (index): %0d", course);
    $display("Current Name of the Enumeration value: %s", course.name());
    
  end
endmodule
```
---

## Sample Output:
```text
Current Enumeration value (index): 4

Current Name of the Enumeration value: Soc
```
---

## Observation:
- `course` → gives **numeric index**
- `course.name()` → gives **string representation**
