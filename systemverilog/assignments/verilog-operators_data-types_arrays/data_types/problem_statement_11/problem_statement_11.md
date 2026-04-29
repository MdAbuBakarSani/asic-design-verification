# Problem 11: Convert String to Lowercase in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to:

- Declare a string  
- Convert the entire string to lowercase using a built-in method  
- Display both original and lowercase strings  

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module LowerCase_Example;

  string message = "I AM A TRAINEE AT PROV LOGIC";

  initial begin

    $display("Original string: %s", message);

    $display("LowerCase String: %s", message.tolower());

  end
endmodule
```
---

## Sample Output:
```text
Original string: I AM A TRAINEE AT PROV LOGIC

LowerCase String: i am a trainee at prov logic
```
---

## Observation:

The `.tolower()` method converts all uppercase characters to lowercase while leaving spaces and non-alphabet characters unchanged.
