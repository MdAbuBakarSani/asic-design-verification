# Problem 05: Generate an Array of 10 Integers with Value and Sum Constraints

## Problem Statement:

Write a constraint for an **array of 10 integers** such that:

- All elements are **between 1 and 50**
- The **sum of all elements is less than 300**
- Display the array and its total sum

---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

class Arrays;

  // Random array of 10 integers
  rand int arr[10];

  int total;

  // Constraint block
  constraint elements {
    foreach (arr[i]) arr[i] inside {[1:50]};      // Each element between 1 and 50
    (arr.sum()) < 300;                            // Sum of array elements less than 300
  }

  // Method to randomize and display values
  function void display();  
    if (!this.randomize())   
      $display ("Randomization failed!");
    else begin   
      total = arr.sum();
      $display ("Random array of 10 integers between 1 and 50: ");
      foreach (arr[i])
        $write ("%0d, ", arr[i]);
      $display("");
      $display("Total sum (less than 300) = %0d", total);
    end   
  endfunction
endclass

// Testbench
module tb_array;
  Arrays obj; 
  initial begin  
    obj = new(); 
    // Generate 5 different arrays
    repeat(5) begin
      obj.display();
    end
  end
endmodule
```
---
## Sample Output:
```text
Random array of 10 integers between 1 and 50:
24, 13, 3, 34, 20, 42, 16, 25, 31, 6
Total sum (less than 300) = 214

Random array of 10 integers between 1 and 50:
5, 19, 36, 50, 21, 34, 27, 8, 31, 48
Total sum (less than 300) = 279

Random array of 10 integers between 1 and 50:
26, 17, 1, 17, 40, 47, 41, 36, 23, 45
Total sum (less than 300) = 293

Random array of 10 integers between 1 and 50:
1, 35, 44, 26, 12, 11, 16, 1, 31, 40
Total sum (less than 300) = 217

Random array of 10 integers between 1 and 50:
11, 41, 10, 46, 3, 3, 42, 49, 36, 33
Total sum (less than 300) = 274
```
---

## Observation:

All generated arrays satisfy both constraints: each element lies within the range 1 to 50, and the total sum of elements remains below 300, confirming correct implementation of value and aggregate constraints.
