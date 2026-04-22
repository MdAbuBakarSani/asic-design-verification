// Code your testbench here 
// or browse Examples 

class PrimeDigitsSum;

  rand bit [6:0] numbers;
  int tens, units, sum;

  // Constraint block
  constraint range_rules{

    // Ensure number is 2-digit
    numbers inside {[10:99]};
    
    // Sum of digits must be prime
    ((numbers / 10) + (numbers % 10)) inside {2, 3, 5, 7, 11, 13, 17};
  }

  // Method to randomize and display values
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else begin
      tens = numbers / 10;
      units = numbers % 10;
      sum = tens + units;
      $display("Random 2-digit number: %0d (Digits: %0d + %0d = %0d)", numbers, tens, units, sum);
    end
  endfunction
endclass

// Testbench
module tb;
  PrimeDigitsSum obj;
  initial begin
    obj = new();
    // Generate 5 random numbers
    repeat(5) begin
      obj.display();
    end
  end
endmodule
