// Code your testbench here 
// or browse Examples 

class MoreOnesThanZeros;

  // Random 5-bit variable
  rand bit [4:0] digits;

  // Constraint block 
  // Constraint: number of 1s must be greater than number of 0s
  constraint rules{  
    $countones(digits) > 2;
  }

  // Method to randomize and display values
  function void display();
    if (!this.randomize()) 
      $display("Randomization failed!");
    else
      $display("Digit: %0b (%0d),  Ones: %0d", digits, digits, $countones(digits));
  endfunction
endclass

// Testbench
module tb;
  MoreOnesThanZeros value;
  initial begin
    value = new();
    // Generate 5 random values
    repeat(5) begin
      value.display(); 
    end
  end
endmodule
