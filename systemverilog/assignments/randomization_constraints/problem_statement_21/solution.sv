// Code your testbench here 
// or browse Examples 

class DigitAlternateEvenOdd;

  // Random array of 4 digits
  rand bit [3:0] digit[4];

  // Constraint block 
  // Constraint: each digit must be between 0 and 9
  constraint range{
    foreach (digit[i]) digit [i] inside {[0:9]};         
  }

  // Constraint: enforce alternating even-odd pattern
  constraint rules{
    (digit[0] % 2 == 0);
    (digit[1] % 2 == 1);
    (digit[2] % 2 == 0);
    (digit[3] % 2 == 1);
  }

  // Method to randomize and display number
  function void display();
    if (!this.randomize())   
      $display("Randomization failed!");
    else begin
      $display("Random 4-digit (Even-Odd-Even-Odd): ");
      foreach (digit[i])
        $write("%0d", digit[i]);
      $display("");
    end
  endfunction
endclass

// Testbench
module tb;
  DigitAlternateEvenOdd obj;
  initial begin
    obj = new(); 
    // Generate 5 random numbers
    repeat(5) begin
      obj.display();
    end    
  end
endmodule
