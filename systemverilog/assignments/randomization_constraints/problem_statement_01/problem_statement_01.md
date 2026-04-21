# Problem 01: Generate Random 4-Digit Numbers Divisible by 11 Using Constraints

## Problem Statement:

Create a **SystemVerilog class** to generate random **4-digit numbers** that are **divisible by 11**.

- Use **randomization**
- Ensure the number is within **4-digit range (1000–9999)**
- Apply a constraint so that the number is **divisible by 11**
- Generate multiple such numbers

-------

# Solution:

The solution is implemented as follows:

```systemverilog

class DivisibleBy11;

  // Random variable
  rand int number;

  // Constraint block
  constraint range {
    // Ensure number is a 4-digit value
    number inside {[1000:9999]};

    // Ensure number is divisible by 11
    number % 11 == 0;
  }

  // Method to randomize and display the value
  function void display();

    // Try randomization
    if (!this.randomize())
      $display("Randomization failed!");
    else
      $display("Random 4-digit number divisible by 11 : %0d", number);

  endfunction

endclass


// === Testbench ===

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
