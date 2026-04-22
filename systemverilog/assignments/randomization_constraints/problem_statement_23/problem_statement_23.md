# Problem 23: Generate a 5-Bit Gray Code

## Problem Statement:

Create a **SystemVerilog class** to generate a **5-bit Gray Code** such that:

- Start from a **random 5-bit binary number**
- Convert it into **Gray Code**
- Gray Code ensures that **only one bit changes between consecutive values**
- Display both **binary and Gray Code values**

---

## Solution:
The solution is implemented as follows:
```systemverilog
// Code your testbench here 
// or browse Examples 

class GrayCode;

  // Random binary input
  rand bit [4:0] binary_Input;

  // Gray code output
  bit [4:0] gray_code; 

// Post-randomization: convert binary to Gray code
  function void post_randomize();
    gray_code = binary_Input ^ (binary_Input >> 1);
  endfunction

  // Method to randomize and display values
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else
      $display("Binary: %5b | Gray Code: %5b", binary_Input, gray_code);
  endfunction
endclass

// Testbench
module tb;
  GrayCode digits;
  initial begin
    digits = new();
    // Generate 5 random values
    repeat(5) begin
      digits.display();
    end
  end
endmodule
```
---

## Sample Output:
```text
Binary: 00110 | Gray Code: 00101
Binary: 00101 | Gray Code: 00111
Binary: 00011 | Gray Code: 00010
Binary: 10100 | Gray Code: 11110
Binary: 11111 | Gray Code: 10000
```
---

## Observation:

The Gray Code values are correctly generated using the binary-to-Gray transformation. Each output reflects proper bitwise conversion, ensuring single-bit variation between successive Gray values.
