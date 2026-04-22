// Code your testbench here 
// or browse Examples 

class UniqueThreeDigit;

  // Random digits
  rand bit [3:0] hundreds, tens, units;

  int count;

  // Constraint block
  constraint unique_digits {
    hundreds inside{[1:9]};       // No leading zero → valid 3-digit number
    tens     inside{[0:9]};
    units    inside{[0:9]};

    // Ensure all digits are unique
    unique {hundreds, tens, units};
  }

  // Method to randomize and display values
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else begin

      // Combine digits into a number
      count = hundreds * 100 + tens * 10 + units;
      $display("Random 3 unique digits: %0d", count);
    end
  endfunction
endclass

// Testbench
module tb_unique_three_digits;
  UniqueThreeDigit digit;
  initial begin 
    digit = new();
    // Generate 5 different numbers
    repeat(5) begin
      digit.display();
    end
  end
endmodule
