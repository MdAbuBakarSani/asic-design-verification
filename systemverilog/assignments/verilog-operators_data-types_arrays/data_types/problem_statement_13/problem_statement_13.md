# Problem 13: Extract Substring in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to:

- Declare a string  
- Extract a substring from **8th to 14th position**  
- Display both original string and extracted substring  

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module Substring_Example;

  string message = "I am a trainee at ProV Logic";
  string sub;

  initial begin

    sub = message.substr(7, 13);

    $display("Original String: %s", message);
    $display("Substring (8th to 14th position): %s", sub);

  end
endmodule
```
---

## Sample Output:
```text
Original String: I am a trainee at ProV Logic

Substring (8th to 14th position): trainee
```
---

## Observation:

The `.substr(start, end)` method extracts characters from the given range including both start and end indices.
