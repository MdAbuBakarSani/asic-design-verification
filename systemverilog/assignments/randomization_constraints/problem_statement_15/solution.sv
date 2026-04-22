// Code your testbench here 
// or browse Examples 

class TwoOnes;

  // Random 4-bit number
  rand bit [3:0] number;

  // Constraint block
  constraint rules{
    $countones(number) == 2;    // Constraint: exactly two bits must be 1
  }

  // Method to randomize and display value
  function void display();
    if (!this.randomize())    
      $display("Randomization failed!");
    else
      $display("Random 4-bit number with exactly 2 ones: %0b (%0d)", number, number);
  endfunction
endclass

// Testbench
module tb_two_ones;
  TwoOnes value;
  initial begin
    value = new();
    // Generate 5 random values
    repeat(5) begin
      value.display();
    end
  end
endmodule
