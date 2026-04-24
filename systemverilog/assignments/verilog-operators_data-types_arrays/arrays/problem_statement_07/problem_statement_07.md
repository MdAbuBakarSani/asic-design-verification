# Problem 07: Dynamic Array Methods (size and delete)

## Problem Statement:

Write a SystemVerilog program to demonstrate **dynamic array built-in methods**:

- `size()` → to get the number of elements
- `delete()` → to remove all elements


---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

module Dynamic_Array_Example;

  int arr[];

  initial begin

    // Allocate memory
    arr = new[5];

    // Assign values
    arr = '{5, 10, 15, 20, 25};

    // Display elements
    $display("Array Elements:");
    foreach (arr[i])
      $display("Array[%0d] = %0d", i, arr[i]);

    // Display size
    $display("Size of the array is: %0d", arr.size());

    // Delete array
    arr.delete();

    // Display size after delete
    $display("Size of the array after delete: %0d", arr.size());

  end
endmodule
```
---

## Sample Output:
```text
Array Elements:

Array[0] = 5

Array[1] = 10

Array[2] = 15

Array[3] = 20

Array[4] = 25

Size of the array is: 5

Size of the array after delete: 0
```
---

## Observation:

The size() method returns the current number of elements in the dynamic array, while delete() removes all elements and resets the array size to zero. This demonstrates how dynamic arrays can be managed efficiently during runtime.
