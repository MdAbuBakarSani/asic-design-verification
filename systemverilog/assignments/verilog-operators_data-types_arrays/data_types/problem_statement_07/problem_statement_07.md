# Problem 07: String Declaration and Display in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to declare a string variable.  

- Assign the value:  
  **"I am learning SV data type"**  
- Display the string using `$display`

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module String_Display;

  string message = "I am learning SV data type";

  initial begin
    $display("%s", message);
  end

endmodule
```
---

## Sample Output:
```text
I am learning SV data type
```
---

## Observation:

A string in SystemVerilog is a **dynamic sequence of characters**, and it can be directly displayed using `%s` format specifier.
