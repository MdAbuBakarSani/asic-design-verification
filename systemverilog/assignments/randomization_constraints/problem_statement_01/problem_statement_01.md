# Problem 01: Generate Random 4-Digit Numbers Divisible by 11 Using Constraints

## Problem Statement:

Create a **SystemVerilog class** to generate random **4-digit numbers** that are **divisible by 11**.

- Use **randomization**
- Ensure the number is within **4-digit range (1000–9999)**
- Apply a constraint so that the number is **divisible by 11**
- Generate multiple such numbers

-------

## Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here 
// or browse Examples

class DivisibleBy11;
  rand int number;

// === Constraint block ===
  constraint range {
    number inside {[1000:9999]};
    number % 11 == 0;
  }

// === Method to randomize and display the value ===
  function void display();

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

// === Generate 10 random values ===
    repeat (10) begin
      num.display();
    end
  end
endmodule
```
---
## Sample Output:

```text
Random 4-digit number divisible by 11 : 9955
Random 4-digit number divisible by 11 : 1562
Random 4-digit number divisible by 11 : 7029
Random 4-digit number divisible by 11 : 7568
Random 4-digit number divisible by 11 : 2013
Random 4-digit number divisible by 11 : 6776
Random 4-digit number divisible by 11 : 7128
Random 4-digit number divisible by 11 : 8591
Random 4-digit number divisible by 11 : 5456
Random 4-digit number divisible by 11 : 1760
```
----
## Observation:

All generated numbers fall within the 4-digit range and are divisible by 11, confirming that both range and divisibility constraints are correctly applied.
