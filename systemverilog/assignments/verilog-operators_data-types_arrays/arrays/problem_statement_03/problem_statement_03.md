# Problem 03: Fixed-Size Array Initialization

## Problem Statement:

Create a **fixed-size array** of size 4 and assign values to it.

- Declare a fixed-size array
- Initialize it with predefined values
- Display all elements using iteration

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module Fixed_Array;

  // Fixed-size array with initialization
  int arr[4] = '{10, 20, 30, 40};

  initial begin

    $display("Fixed-size Array Elements:");

    // Display elements
    foreach (arr[i])
      $display("arr[%0d] = %0d", i, arr[i]);

  end
endmodule
```
---

## Sample Output:
```text
Fixed-size Array Elements:

arr[0] = 10

arr[1] = 20

arr[2] = 30

arr[3] = 40
```
---

## Observation:

The fixed-size array stores a predefined number of elements and does not change in size during execution. All elements are initialized at declaration, and iteration using foreach allows easy access to each value.
