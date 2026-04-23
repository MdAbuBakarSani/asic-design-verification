# Problem 03: Create an Array with 10 Elements

## Problem Statement:

Create an array with **10 elements**.

Implement this using:
- Static Array
- Dynamic Array
- Associative Array

Display all elements using iteration.

---

## Solution:
The solution is implemented as follows:
### 1. Static Array

```systemverilog
module Static_Array;

  int arr[10];

  initial begin

    // Assign values
    foreach (arr[i])
      arr[i] = i + 1;

    $display("Static Array Elements:");

    // Display values
    foreach (arr[i])
      $display("arr[%0d] = %0d", i, arr[i]);

  end
endmodule
```
---
### 2. Dynamic Array
```systemverilog
module Dynamic_Array;

  int arr[];

  initial begin

    // Allocate memory
    arr = new[10];

    // Assign values
    foreach (arr[i])
      arr[i] = i + 1;

    $display("Dynamic Array Elements:");

    // Display values
    foreach (arr[i])
      $display("arr[%0d] = %0d", i, arr[i]);

  end
endmodule
```
---

### 3. Associative Array
```systemverilog
module Associative_Array;

  int arr[int];

  initial begin

    // Assign values
    for (int i = 0; i < 10; i++)
      arr[i] = i + 1;

    $display("Associative Array Elements:");

    // Display values
    foreach (arr[i])
      $display("arr[%0d] = %0d", i, arr[i]);

  end

endmodule
```
---

## Sample Output:
```text
Static Array Elements:
arr[0] = 1
arr[1] = 2
arr[2] = 3
arr[3] = 4
arr[4] = 5
arr[5] = 6
arr[6] = 7
arr[7] = 8
arr[8] = 9
arr[9] = 10

Dynamic Array Elements:
arr[0] = 1
arr[1] = 2
arr[2] = 3
arr[3] = 4
arr[4] = 5
arr[5] = 6
arr[6] = 7
arr[7] = 8
arr[8] = 9
arr[9] = 10

Associative Array Elements:
arr[0] = 1
arr[1] = 2
arr[2] = 3
arr[3] = 4
arr[4] = 5
arr[5] = 6
arr[6] = 7
arr[7] = 8
arr[8] = 9
arr[9] = 10
```
---

## Observation:

All three array types successfully store and display 10 elements. Static arrays have fixed size, dynamic arrays require explicit memory allocation, and associative arrays allow flexible indexing without predefined size.

