# Problem 28: Generate an Odd Ascending Array

## Problem Statement:

Create a **SystemVerilog class** to generate an array of **4 integers** such that:

- All elements are **odd numbers**
- The elements are in **strictly ascending order**
- Display the generated array

---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

class OddAscendingArray;

  // Random array of 4 integers
  rand int arr[4];

  // Constraint block
  constraint rules{
    
    // Range constraint (optional but keeps values reasonable)
    foreach (arr[i]) arr[i] inside {[1:49]};
    
    // Ensure all elements are odd
    foreach (arr[i]) arr[i] % 2 == 1;
  
    // Ascending order constraints
    arr[0] < arr[1];
    arr[1] < arr[2];
    arr[2] < arr[3];
  }

  // Method to randomize and display array
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else begin
      $write("Random 4-element Odd Ascending Array: ");
      foreach (arr[i])
        $write("%0d, ", arr[i]);
      $display("");
    end
  endfunction
endclass

// Testbench
module tb;
  OddAscendingArray obj;
  initial begin
    obj = new();
    // Generate 5 arrays
    repeat(5) begin
      obj.display();
    end
  end
endmodule
```
---

## Sample Output:
```text
Random 4-element Odd Ascending Array: 7, 11, 29, 39,
Random 4-element Odd Ascending Array: 5, 11, 15, 33,
Random 4-element Odd Ascending Array: 1, 3, 23, 37,
Random 4-element Odd Ascending Array: 5, 13, 27, 47,
Random 4-element Odd Ascending Array: 3, 11, 41, 49,
```
---

## Observation:

All generated arrays contain only odd numbers and maintain strictly increasing order, confirming correct enforcement of both parity and ordering constraints.
