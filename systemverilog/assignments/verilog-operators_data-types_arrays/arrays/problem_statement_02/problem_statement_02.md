# Array Problem 02: Packed Union with 8-bit Data

## Problem Statement:

Create a **packed union** to store an **8-bit (`[7:0]`) variable**.

Requirements:
- Define a packed union
- Store an 8-bit value inside the union
- Instantiate the union
- Initialize the variable
- Display the stored value

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module Packed_Union_Example;

  // Define packed union
 
  typedef union packed {
    bit [7:0] data_value;
  } data_union;

  // Declare instance
  data_union data;

  initial begin

    // Initialize value
    data.data_value = 8'b10110101;

    // Display result
    $display("Packed Union Elements:");
    $display("data_value = %b", data.data_value);

  end
endmodule
```
---

## Sample Output:
```text
Packed Union Elements:

data_value = 10110101
```
---

## Observation:

The packed union successfully stores and represents the 8-bit value. Since it is a packed structure, the data is stored in a contiguous bit format, making it suitable for bit-level operations and hardware modeling.
