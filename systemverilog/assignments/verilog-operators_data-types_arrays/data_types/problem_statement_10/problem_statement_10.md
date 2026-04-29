# Problem 10: Convert String to Uppercase in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to:

- Declare a string  
- Convert the entire string to uppercase using a built-in method  
- Display both original and uppercase strings  

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module UpperCase_Example;

  string message = "I am a trainee at ProV Logic";

  initial begin
    
    $display("Original string: %s", message);
    
    $display("Uppercase String: %s", message.toupper());
    
  end
endmodule
```
---

## Sample Output:
```text
Original string: I am a trainee at ProV Logic

Uppercase String: I AM A TRAINEE AT PROV LOGIC
```
---

## Observation:

The `.toupper()` method converts **all lowercase characters to uppercase** while keeping non-alphabet characters unchanged.
