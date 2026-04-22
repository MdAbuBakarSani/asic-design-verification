# Problem 09: Generate Random MAC Addresses with Valid Constraints

## Problem Statement:

Create a **SystemVerilog class** to generate random **MAC addresses** such that:

- A MAC address consists of **6 bytes (octets)**
- The **first octet must be even**
- The address must be **unicast (not multicast)**
- Display the generated MAC address in standard **hexadecimal format**

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

class MACAddress;

  // Random MAC address
  rand bit [7:0] mac [6];

  // Constraint block
  constraint mac_address_rules {
    mac [0][0] == 0;  // Ensure first octet is even → LSB must be 0
    mac [0][1] == 0;  // Ensure unicast address → second LSB must be 0
  }

  // Method to randomize and display MAC address
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else begin
      $write("Random MAC Address: ");
      
      // Print MAC in xx:xx:xx:xx:xx:xx format
      foreach (mac[i]) begin
        $write ("%02x", mac[i]);
        if (i < 5)
          $write (":");
      end
      $display("");
    end
  endfunction
endclass

// Testbench
module tb_mac_address;
  MACAddress address;
  initial begin
    address = new();
    // Generate 5 random MAC addresses 
    repeat(5) begin
      address.display();
    end
  end
endmodule
```
---

## Sample Output:
```text
Random MAC Address: c0:14:65:09:e5:d4
Random MAC Address: dc:8e:fe:e1:f4:e3
Random MAC Address: 30:ba:c4:a6:2b:2e
Random MAC Address: d4:77:32:11:d4:c7
Random MAC Address: ec:2c:b9:f6:94:75
```
---

## Observation:

All generated MAC addresses follow the required constraints. The first octet is always even and the multicast bit is cleared, ensuring valid unicast MAC address generation.
