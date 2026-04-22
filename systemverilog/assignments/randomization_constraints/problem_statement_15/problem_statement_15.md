# Problem 15: Generate a 4-Bit Number with Exactly Two 1s

## Problem Statement:

Create a **SystemVerilog class** to generate a **4-bit number** such that:

- The number contains **exactly two bits set to 1**
- Display the number in both **binary and decimal format**

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

class TwoOnes;

  // Random 4-bit number
  rand bit [3:0] number;

  // Constraint block
  constraint rules{
    $countones(number) == 2;    // Constraint: exactly two bits must be 1
  }

  // Method to randomize and display value
  function void display();
    if (!this.randomize())    
      $display("Randomization failed!");
    else
      $display("Random 4-bit number with exactly 2 ones: %0b (%0d)", number, number);
  endfunction
endclass

// Testbench
module tb_two_ones;
  TwoOnes value;
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
Random 4-bit number with exactly 2 ones: 1010 (10)
Random 4-bit number with exactly 2 ones: 1010 (10)
Random 4-bit number with exactly 2 ones: 0110 (6)
Random 4-bit number with exactly 2 ones: 1001 (9)
Random 4-bit number with exactly 2 ones: 1010 (10)
```
---

## Observation:

All generated values contain exactly two bits set to 1, confirming correct use of the $countones() function for bit-level constraint enforcement.
