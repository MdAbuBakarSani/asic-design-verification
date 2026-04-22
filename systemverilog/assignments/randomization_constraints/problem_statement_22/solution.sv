// Code your testbench here 
// or browse Examples 

class Palindrome;

  // Random digits (4-digit palindrome)
  rand bit [3:0] d0, d1, d2, d3;

  int number;

  // Constraint block 
  constraint rules{
    
    // Leading digit must be non-zero (valid 4-digit number)
    d0 inside {[1:9]}; 
    
    // Middle digits
    d1 inside {[0:9]};
 
    // Palindrome condition
    d3 == d0;
    d2 == d1;
  }

  // Method to randomize and display number
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else begin
      number = d0*1000 + d1*100 + d2*10 + d3 ;
      $display("Random Palindrome Number: %0d", number);
    end
  endfunction
endclass

// Testbench
module tb;
  Palindrome obj;
  initial begin 
    obj = new();
    // Generate 5 palindrome numbers
    repeat(5) begin
      obj.display();
    end
  end
endmodule
