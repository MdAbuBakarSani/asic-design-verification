# Problem 21: Generate a 4-Digit Number with Alternating Even and Odd Digits

## Problem Statement:

Randomize a **4-digit number** such that:

- Each digit is between **0 and 9**
- Digits follow an **alternating pattern**:
  - Even → Odd → Even → Odd
- Display the generated number

---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

class DigitAlternateEvenOdd;

  // Random array of 4 digits
  rand bit [3:0] digit[4];

  // Constraint block 
  // Constraint: each digit must be between 0 and 9
  constraint range{
    foreach (digit[i]) digit [i] inside {[0:9]};         
  }

  // Constraint: enforce alternating even-odd pattern
  constraint rules{
    (digit[0] % 2 == 0);
    (digit[1] % 2 == 1);
    (digit[2] % 2 == 0);
    (digit[3] % 2 == 1);
  }

  // Method to randomize and display number
  function void display();
    if (!this.randomize())   
      $display("Randomization failed!");
    else begin
      $display("Random 4-digit (Even-Odd-Even-Odd): ");
      foreach (digit[i])
        $write("%0d", digit[i]);
      $display("");
    end
  endfunction
endclass

// Testbench
module tb;
  DigitAlternateEvenOdd obj;
  initial begin
    obj = new(); 
    // Generate 5 random numbers
    repeat(5) begin
      obj.display();
    end    
  end
endmodule
```
---

## Sample Output:
```text
Random 4-digit (Even-Odd-Even-Odd):
2507


Random 4-digit (Even-Odd-Even-Odd):
4983


Random 4-digit (Even-Odd-Even-Odd):
2147


Random 4-digit (Even-Odd-Even-Odd):
8501


Random 4-digit (Even-Odd-Even-Odd):
8925
```
---

## Observation:

All generated numbers follow the Even-Odd-Even-Odd pattern, confirming correct implementation of position-based parity constraints on individual digits.
