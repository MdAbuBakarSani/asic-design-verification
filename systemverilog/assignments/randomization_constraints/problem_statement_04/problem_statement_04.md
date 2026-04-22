# Problem 04: Generate 3 Random Bytes Where the Third Byte is the XOR of the First Two

## Problem Statement:

Generate **3 random bytes** such that the **third byte** is the **XOR** of the first two.

- Generate two random bytes
- Compute the third byte using **XOR operation**
- Display all three bytes in both **hexadecimal and decimal format**

-------

## Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here 
// or browse Examples 

class XORBytes;

    // Random bytes 
    rand bit [7:0] byte1, byte2;

    // Byte3 (not randomized) 
    bit [7:0] byte3;

    // Method to randomize and display values 
    function void display();
    if (!this.randomize())
        $display ("Randomization failed!");
    else begin

        // Compute XOR result 
        byte3 = byte1 ^ byte2;
      
        $display ("Random Bytes: ");
        $display ("Byte 1 = 0x%0h (%0d)", byte1, byte1);
        $display ("Byte 2 = 0x%0h (%0d)", byte2, byte2);
        $display ("Byte 3 (Byte1 ^ Byte 2) = 0x%0h (%0d)", byte3, byte3);
    end
endfunction
endclass

// Testbench
module tb_xor_bytes;
XORBytes values;
    initial begin
      values = new();

        // Generate 2 sets of values 
      repeat(2) begin
      values.display();
     end
   end
endmodule

```
--------

## Sample Output:

```text
Random Bytes:
Byte 1 = 0x77 (119)
Byte 2 = 0x97 (151)
Byte 3 (Byte1 ^ Byte2) = 0xe0 (224)



Random Bytes:
Byte 1 = 0x42 (66)
Byte 2 = 0x8b (139)
Byte 3 (Byte1 ^ Byte2) = 0xc9 (201)

```
--------

## Observation:
Byte3 consistently equals the XOR of Byte1 and Byte2, confirming correct implementation of the bitwise XOR operation.
