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
