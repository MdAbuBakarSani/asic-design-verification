# Problem 11: Array Reduction Methods

## Problem Statement:

Write a SystemVerilog program to demonstrate **array reduction methods**:

- `sum()`
- `product()`
- `and()`
- `or()`
- `xor()`


---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module Array_Reduction_Methods;

  // Integer array
  int int_arr[] = '{1, 2, 3, 4, 5};

  // Bit array
  bit [3:0] bit_arr[] = '{4'b1010, 4'b0110, 4'b0011};

  initial begin

    // Integer array operations
    $display("Original Statement of Integer Array is : %p", int_arr);

    $display("Sum of Integer Array is : %0d", int_arr.sum());
    $display("Product of Integer Array is : %0d", int_arr.product());

    // Bit array operations
    $display("Original Statement of Bit Array is : %p", bit_arr);

    $display("Bitwise AND of Bit Array is : %b", bit_arr.and());
    $display("Bitwise OR of Bit Array is : %b", bit_arr.or());
    $display("Bitwise XOR of Bit Array is : %b", bit_arr.xor());

  end
endmodule
```
---

## Sample Output:
```text
Original Statement of Integer Array is : '{1, 2, 3, 4, 5}

Sum of Integer Array is : 15

Product of Integer Array is : 120

Original Statement of Bit Array is : '{10, 6, 3}

Bitwise AND of Bit Array is : 0010

Bitwise OR of Bit Array is : 1111

Bitwise XOR of Bit Array is : 1111
```
---

## Observation:

Reduction methods perform operations across all elements of an array. `sum()` and `product()` combine numeric values, while `and()`, `or()` and `xor()` apply bitwise operations across all elements of a bit array, producing a single consolidated result.
