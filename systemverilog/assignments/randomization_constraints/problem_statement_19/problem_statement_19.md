# Problem 19: Generate an 8-Bit Value with No Adjacent 1s

## Problem Statement:

Generate an **8-bit variable** such that:

- No two **adjacent bits** are both 1
- Display the value in **binary format**

---

## Solution:

```systemverilog

// Code your testbench here 
// or browse Examples 

class NoAdjacentOnes;

  // Random 8-bit value
  rand bit [7:0] value;

  // Constraint: no two adjacent bits should both be 1
  constraint rules {
    foreach (value[i]) {
      if (i < 7)
        !(value[i] && value[i+1]);
    }
  }

  // Method to randomize and display value
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else
      $display("Random 8-bit value with no adjacent 1's: %08b", value);
  endfunction
endclass

// Testbench
module tb;
  NoAdjacentOnes obj;
  initial begin
    obj = new();
    // Generate 5 random values
    repeat (5) begin
      obj.display();
    end
  end
endmodule
```
---

## Sample Output:
```text
Random 8-bit value with no adjacent 1's: 01010001
Random 8-bit value with no adjacent 1's: 10010100
Random 8-bit value with no adjacent 1's: 10000010
Random 8-bit value with no adjacent 1's: 00010000
Random 8-bit value with no adjacent 1's: 00000010
```
---

## Observation:

All generated values ensure that no two adjacent bits are 1, confirming correct implementation of adjacency-based bit constraint logic.
