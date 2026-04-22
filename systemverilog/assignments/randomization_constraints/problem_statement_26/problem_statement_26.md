# Problem 26: Generate a 2-Digit Number with Prime Digit Sum

## Problem Statement:

Generate a **2-digit number** such that:

- The number is between **10 and 99**
- The **sum of its digits is a prime number**
- Display the number along with its digit breakdown and sum

---

## Solution:
The solution is implemented as follows:
```systemverilog

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
      
      // Extract digits
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
```
---

## Sample Output:
```text
Random 2-digit number: 25 (Digits: 2 + 5 = 7)
Random 2-digit number: 76 (Digits: 7 + 6 = 13)
Random 2-digit number: 14 (Digits: 1 + 4 = 5)
Random 2-digit number: 20 (Digits: 2 + 0 = 2)
Random 2-digit number: 67 (Digits: 6 + 7 = 13)
```
---

## Observation:

All generated numbers are valid 2-digit values and their digit sums are prime numbers, confirming correct implementation of arithmetic and membership-based constraints.
