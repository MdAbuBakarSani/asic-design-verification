# Problem 25: Generate an Array of 6 Unique Elements Within a Range

## Problem Statement:

Randomize an **array of 6 elements** such that:

- No two elements are the same
- All elements are within the range **10 to 20**
- Display the generated array

---

## Solution:

The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

class Unique6ElementsArray;

  // Random array of 6 integers
  rand int arr [6];
 
  // Constraint block
  constraint range{

    // All elements must be unique
    unique {arr};    
    
    // Each element must be between 10 and 20 
    foreach (arr[i]) arr[i] inside {[10:20]};
  }
 
  // Method to randomize and display array
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else begin
      $display("Randomized array of 6 elements: ");
      foreach (arr[i])
        $write("%0d ", arr[i]);
      $display("");
    end
  endfunction
endclass

// Testbench
module tb;
  Unique6ElementsArray obj;
  initial begin
    obj = new();
    // Generate 5 random arrays
    repeat(5) begin
      obj.display();
    end
  end
endmodule
```
---

## Sample Output:
```text
Randomized array of 6 elements:
20 10 15 13 17 19

Randomized array of 6 elements:
16 17 20 14 19 12

Randomized array of 6 elements:
10 14 18 11 20 13

Randomized array of 6 elements:
17 20 18 14 16 12

Randomized array of 6 elements:
20 14 10 18 17 11
```
---

## Observation:

All generated arrays contain unique elements only, and every value remains within the range 10 to 20, confirming correct implementation of both uniqueness and range constraints.
