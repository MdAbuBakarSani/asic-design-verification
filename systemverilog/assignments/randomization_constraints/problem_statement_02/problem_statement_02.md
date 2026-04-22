# Problem 02: Generate Random IP Address Segments with Constraints

## Problem Statement:

Write a **SystemVerilog class** with constraints to generate random **IP address segments (0–255)**.

- Generate **four segments** of an IP address
- Each segment should be in the range **0 to 255**
- The **first segment** must be in the range **1 to 223**
- Exclude **127** from the first segment
- Display the generated IP address

-------

# Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here 
// or browse Examples

class IPAddress;

// === Random 8-bit segments ===
rand bit [7:0] seg1, seg2, seg3, seg4;

// === Constraint block ===
constraint ip_range {
    seg1 inside {[1:223]};
    seg1 != 127;
    seg2 inside {[0:255]};
    seg3 inside {[0:255]};
    seg4 inside {[0:255]};
}

// === Method to randomize and display IP ===
  function void display ();
    if (!this.randomize())
        $display ("Randomization failed!");
    else
        $display ("Random IP Address : %0d.%0d.%0d.%0d", seg1, seg2, seg3, seg4);
endfunction
endclass

// === Testbench ===
module tb_ip_address;
IPAddress ip;
    initial begin
        ip = new();

 // === Generate 5 random IP addresses ===
        repeat(5) begin
        ip.display();
    end
end
endmodule
