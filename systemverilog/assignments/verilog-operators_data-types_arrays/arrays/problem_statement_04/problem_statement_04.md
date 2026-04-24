# Problem 04: Static Packed Array (8×8)

## Problem Statement:

Create a **static packed array** of size **8×8** (8 elements, each 8 bits).


---

## Solution:

The solution is implemented as follows:

```systemverilog



// Code your testbench here 
// or browse Examples 

module Static_Packed_Array;

  // 8x8 packed array (64 bits total)
  bit [7:0][7:0] array_8x8;

  initial begin

    $display("Static Packed Array Elements:");

    // Assign 64-bit value
    array_8x8 = 64'hFACE_B00C_DEAD_BEEF;

    // Display full value
    $display("array_8x8 = 0x%0h", array_8x8);

    // Display each 8-bit element
    foreach (array_8x8[i])
      $display("array_8x8[%0d] = %b (0x%0h)", i, array_8x8[i], array_8x8[i]);

  end
endmodule
```
---

## Sample Output:
```text
Static Packed Array Elements:

array_8x8 = 0xfaceb00cdeadbeef

array_8x8[7] = 11111010 (0xfa)

array_8x8[6] = 11001110 (0xce)

array_8x8[5] = 10110000 (0xb0)

array_8x8[4] = 00001100 (0x0c)

array_8x8[3] = 11011110 (0xde)

array_8x8[2] = 10101101 (0xad)

array_8x8[1] = 10111110 (0xbe)

array_8x8[0] = 11101111 (0xef)
```
---

## Observation:
The packed array stores data as a contiguous 64-bit value while allowing access to individual 8-bit segments. This allows both full-word operations and bit-level manipulation, making packed arrays highly efficient for hardware modeling.
