// Code your testbench here 
// or browse Examples 

class EvenDigitSum;

  // Random number
  rand int number;

  // Constraint block 
  constraint range{
    number inside {[1:500]};     // Constraint: number range
  }

  constraint rules{
    ((number / 100) + ((number % 100)/10) + (number % 10)) % 2 == 0;   // Constraint: sum of digits must be even
  }
 
  // Method to randomize and display value
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else
      $display("Random number (1:500) with even digit sum: %0d", number);
  endfunction
endclass

// Testbench
module tb;
  EvenDigitSum obj;
  initial begin
    obj = new();
    // Generate 5 random numbers
    repeat(5) begin
      obj.display();
    end
  end
endmodule
