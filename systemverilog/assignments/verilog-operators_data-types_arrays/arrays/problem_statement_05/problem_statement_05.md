# Problem 05: Static Unpacked Array (8×8)

## Problem Statement:

Create a **static unpacked array** of size **8×8**.


---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module Static_Unpacked_Array;

  // 2D unpacked array (8x8)
  bit array_8x8 [7:0][7:0];

  initial begin

    $display("Static Unpacked Array Elements:");

    // Assign random values (0 or 1)
    foreach (array_8x8[i]) begin
      foreach (array_8x8[i][j]) begin
        array_8x8[i][j] = $urandom_range(0, 1);

        $display("array_8x8[%0d][%0d] = %0b", i, j, array_8x8[i][j]);
      end
    end

    // Full array display
    $display("array_8x8 = %p", array_8x8);

  end
endmodule
```
---

## Sample Output:
```text
Static Unpacked Array Elements:

array_8x8[7][7] = 1
array_8x8[7][6] = 0
array_8x8[7][5] = 0
array_8x8[7][4] = 0

...

array_8x8[0][3] = 0
array_8x8[0][2] = 0
array_8x8[0][1] = 1
array_8x8[0][0] = 0



array_8x8 = '{'{1, 0, 0, 0, 1, 0, 1, 1},

              '{1, 1, 0, 0, 1, 1, 1, 1},

              ...

              '{1, 0, 1, 0, 0, 0, 1, 0}}
```
---

## Observation:

The static unpacked array stores each bit as an individual element accessed using two indices. The output confirms that values are assigned across all rows and columns, and the full array can also be displayed using `%p`.
