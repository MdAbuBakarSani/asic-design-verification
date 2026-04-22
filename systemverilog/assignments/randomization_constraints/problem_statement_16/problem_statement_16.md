# Problem 16: Generate an Array with Values Between a Given Min and Max Range

## Problem Statement:

Randomize an **array of 5 elements** such that:

- The **maximum value** in the array is **less than 80**
- The **minimum value** in the array is **greater than 20**
- Display the generated array

---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples

class Array;

  // Random array of 5 integers
  rand int arr[5];

  // Constraint block
  constraint range{
    foreach (arr[i]) arr[i] inside {[21:79]};       // Each element must be between 21 and 79
  }

  // Method to randomize and display array
  function void display();
    if (!this.randomize()) 
      $display("Randomization failed!");
    else begin
      $display("Randomized array with elements greater than 20 and less than 80: ");
      foreach (arr[i])
        $write("%0d ", arr[i]);
      $display("");
    end
  endfunction
endclass

// Testbench
module tb_array;
  Array elements;
  initial begin
    elements = new();
    // Generate 5 arrays
    repeat(5) begin 
      elements.display(); 
    end
  end
endmodule
```
---

## Sample Output:
```text
Randomized array with elements greater than 20 and less than 80:
75 56 39 52 29

Randomized array with elements greater than 20 and less than 80:
61 70 62 69 54

Randomized array with elements greater than 20 and less than 80:
39 58 25 79 25

Randomized array with elements greater than 20 and less than 80:
61 32 54 58 22

Randomized array with elements greater than 20 and less than 80:
53 36 35 68 50
```
---

## Observation:

All generated values fall strictly within the range 21 to 79, ensuring that the minimum value is always greater than 20 and the maximum value is always less than 80, confirming correct constraint implementation.
