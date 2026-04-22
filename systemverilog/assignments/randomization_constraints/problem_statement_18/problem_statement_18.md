# Problem 18: Generate a 5-Bit Number with More 1s Than 0s

## Problem Statement:

Write a **SystemVerilog class** to generate a **5-bit number** such that:

- The number contains **more 1s than 0s**
- Display the number in **binary and decimal format**
- Also display the **count of 1s**

---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

class MoreOnesThanZeros;

  // Random 5-bit variable
  rand bit [4:0] digits;

  // Constraint block 
  // Constraint: number of 1s must be greater than number of 0s
  constraint rules{  
    $countones(digits) > 2;
  }

  // Method to randomize and display values
  function void display();
    if (!this.randomize()) 
      $display("Randomization failed!");
    else
      $display("Digit: %0b (%0d),  Ones: %0d", digits, digits, $countones(digits));
  endfunction
endclass

// Testbench
module tb;
  MoreOnesThanZeros value;
  initial begin
    value = new();
    // Generate 5 random values
    repeat(5) begin
      value.display(); 
    end
  end
endmodule
```
---

## Sample Output:
```text
Digit: 11001 (25), Ones: 3
Digit: 10011 (19), Ones: 3
Digit: 00111 (7),  Ones: 3
Digit: 10011 (19), Ones: 3
Digit: 01011 (11), Ones: 3
```
---

## Observation:

All generated values contain more 1s than 0s, confirming correct use of the $countones() constraint for controlling bit distribution.
