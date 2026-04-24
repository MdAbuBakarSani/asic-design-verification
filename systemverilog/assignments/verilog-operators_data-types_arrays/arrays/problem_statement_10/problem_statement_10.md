# Problem 10: Array Ordering Methods

## Problem Statement:

Write a SystemVerilog program to demonstrate **array ordering methods**:

- `reverse()`
- `sort()`
- `rsort()`
- `shuffle()`

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module Array_Ordering_Methods;

  int arr[8] = '{76, 26, 40, 13, 8, 66, 84, 57};

  initial begin

    $display("Original Statements: %p", arr);

    // reverse() – reverses the array
    arr.reverse();
    $display("After reverse : %p", arr);

    // sort() – sorts in ascending order
    arr.sort();
    $display("After sort : %p", arr);

    // rsort() – sorts in descending order
    arr.rsort();
    $display("After rsort : %p", arr);

    // shuffle() – randomizes the order
    arr.shuffle();
    $display("After shuffle : %p", arr);

  end
endmodule
```
---

## Sample Output:
```text
Original Statements: '{76, 26, 40, 13, 8, 66, 84, 57}

After reverse : '{57, 84, 66, 8, 13, 40, 26, 76}

After sort : '{8, 13, 26, 40, 57, 66, 76, 84}

After rsort : '{84, 76, 66, 57, 40, 26, 13, 8}

After shuffle : '{40, 8, 84, 26, 57, 13, 66, 76}
```
---

## Observation:

Array ordering methods allow flexible manipulation of element order. `reverse()` flips the sequence, `sort()` and `rsort()` arrange elements in ascending and descending order, and `shuffle()` randomizes the array, making it useful for testing and randomized scenarios.
