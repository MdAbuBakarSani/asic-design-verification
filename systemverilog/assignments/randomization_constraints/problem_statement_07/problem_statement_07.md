# Problem 07: Generate a 3-Digit Number with All Unique Digits

## Problem Statement:

Create a **SystemVerilog class** to randomize a **3-digit number** such that:

- Each digit is **different**
- The number is a valid **3-digit number (100–999)**
- Display the generated number

---

## Solution:
The solution is implemented as follows:
```systemverilog
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

```
---

## Sample Output:
```text

Random 3 unique digits: 894
Random 3 unique digits: 853
Random 3 unique digits: 512
Random 3 unique digits: 849
Random 3 unique digits: 239
```
---

## Observation:

All generated numbers are valid 3-digit values with no repeating digits. The constraint ensures each digit is unique and the hundreds place is non-zero, confirming correct implementation.
