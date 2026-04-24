# Problem 08: Associative Array Built-in Methods

## Problem Statement:

Write a SystemVerilog program to demonstrate associative array built-in methods:

- `num()`
- `size()`
- `delete()`
- `exists()`
- `first()`
- `last()`
- `next()`
- `prev()`


---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

module Associative_Array_Methods;

  int array[int];
  int index;

  initial begin

    // Assign values
    array[1] = 10;
    array[2] = 20;
    array[3] = 30;
    array[4] = 40;
    array[5] = 50;

    // Display number of elements
    $display("array.num() = %0d", array.num());
    $display("array.size() = %0d", array.size());

    // Check if index exists
    if (array.exists(3))
      $display("Array 3 exists with value = %0d", array[3]);
    else
      $display("Array 3 does not exist");

    // Get first index
    if (array.first(index))
      $display("First: index = %0d, value = %0d", index, array[index]);

    // Get last index
    if (array.last(index))
      $display("Last: index = %0d, value = %0d", index, array[index]);

    // Move to next index
    if (array.next(index))
      $display("Next: index = %0d, value = %0d", index, array[index]);

    // Move to previous index
    if (array.prev(index))
      $display("Prev: index = %0d, value = %0d", index, array[index]);

    // Delete element at index 3
    array.delete(3);
    $display("Deleted Array 3.");

    // Display number of elements after delete
    $display("array.num() after delete = %0d", array.num());

  end
endmodule
```
---

## Sample Output:
```text
array.num() = 5

array.size() = 5

Array 3 exists with value = 30

First: index = 1, value = 10

Last: index = 5, value = 50

Prev: index = 4, value = 40

Deleted Array 3.

array.num() after delete = 4
```
---

## Observation:

The associative array methods correctly manage and inspect key-value entries. `num()` and `size()` return the number of stored elements, `exists()` checks whether an index is present, and `first()`, `last()`, `next()` and `prev()` allow index navigation. The `delete()` method removes the selected entry from the array.
