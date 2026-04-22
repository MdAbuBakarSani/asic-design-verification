# Problem 13: Generate a Valid Random IP Address

## Problem Statement:

Create a **SystemVerilog class** to generate a valid **IP address** such that:

- Each byte is in the range **0 to 255**
- The **first byte must not be 127**
- Display the generated IP address

---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

class IPAddress;

  // Random 8-bit segments
  rand bit [7:0] seg1, seg2, seg3, seg4;

  // Constraint block
  constraint ip_range {
   
    // First byte constraint (exclude 127)
    seg1 inside {[1:223]};
    seg1 != 127;
   
    // Remaining bytes (0–255)
    seg2 inside {[0:255]};
    seg3 inside {[0:255]};
    seg4 inside {[0:255]};
  }

  // Method to randomize and display IP
  function void display ();
    if (!this.randomize())
      $display ("Randomization failed!");
    else
      $display ("Random IP Address : %0d.%0d.%0d.%0d", seg1, seg2, seg3, seg4);
  endfunction
endclass

// Testbench
module tb_ip_address;
  IPAddress ip;
  initial begin
    ip = new();
    // Generate 5 random IP addresses
    repeat(5) begin
      ip.display();
    end
  end
endmodule
```
---

## Sample Output:
```text
Random IP Address : 89.120.23.242
Random IP Address : 155.202.186.208
Random IP Address : 78.83.147.102
Random IP Address : 27.176.177.150
Random IP Address : 21.209.75.222
```
---

## Observation:

All generated IP addresses satisfy the defined constraints. Each segment remains within the valid range of 0 to 255, and the first byte never equals 127, confirming correct implementation of the restriction.
