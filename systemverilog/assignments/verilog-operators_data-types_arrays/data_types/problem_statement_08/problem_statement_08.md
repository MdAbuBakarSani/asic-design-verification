# Problem 08: Find Length of a String in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to:

- Declare a string  
- Determine its length  
- Display both the string and its length  

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module String_Length;

  string message = "SystemVerilog";
  int length;

  initial begin

    $display("The message is : %s", message);

    length = message.len();

    $display("Length of the string : %0d", length);

  end
endmodule
```
---

## Sample Output:
```text
The message is : SystemVerilog

Length of the string : 13
```
---

## Observation:

The `.len()` method returns the **total number of characters** in the string including all alphabets and symbols.
