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
