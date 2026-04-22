# Problem 17: Generate a 2D Array with Row Sum Constraint

## Problem Statement:

Randomize a **2D array [3][3]** such that:

- Each element is within a valid range
- The **sum of each row is exactly 15**
- Display the generated 2D array

---

## Solution:
The solution is implemented as follows:
```systemverilog
// Code your testbench here 
// or browse Examples 

class Array2D;

  // Random 2D array
  rand int arr [3][3];

  // Constraint block 
  constraint range{
    foreach (arr[i, j]) arr[i][j] inside {[0:15]};
  }

  // Constraint: each row sum must be 15
  constraint rules{
    (arr[0][0] + arr[0][1] + arr[0][2]) == 15;
    (arr[1][0] + arr[1][1] + arr[1][2]) == 15;
    (arr[2][0] + arr[2][1] + arr[2][2]) == 15;
  }

  // Method to randomize and display array
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else begin
      $display("2D array of [3][3]: ");
      foreach (arr[i]) begin
        foreach (arr[i][j])
          $write("%0d ", arr[i][j]);
        $display("");
      end 
      $display("");
    end
  endfunction
endclass

// Testbench
module tb_2D_Array;
  Array2D value;
  initial begin
    value = new();
    // Generate 2 arrays
    repeat(2) begin
      value.display();
    end
  end
endmodule
```
---

## Sample Output:
```text
2D array of [3][3]:
2 8 5
1 8 6
1 6 8


2D array of [3][3]:
4 4 7
5 9 1
1 4 10
```
---

## Observation:

Each row in the generated 2D array sums to 15, confirming correct enforcement of row-wise aggregate constraints while maintaining valid element ranges.
