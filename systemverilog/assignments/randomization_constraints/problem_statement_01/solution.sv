// Code your testbench here 
// or browse Examples


class DivisibleBy11;
  
  // Random variable
  rand int number;

  // Constraint block 
  constraint range {
    number inside {[1000:9999]};
    number % 11 == 0;
  }

  // Method to randomize and display the value 
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else
      $display("Random 4-digit number divisible by 11 : %0d", number);
  endfunction
endclass

// Testbench 
module tb_divisible_by_11;
  DivisibleBy11 num;
  initial begin
    num = new();    
    // Generate 10 random values 
    repeat (10) begin
      num.display();
    end
  end
endmodule
