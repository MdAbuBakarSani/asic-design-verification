# Problem 08: Generate a 6-Character Alphanumeric String Using Constraints

## Problem Statement:

Create a **SystemVerilog class** to generate a **6-character alphanumeric string** such that:

- Each character is **either a digit (0–9), uppercase letter (A–Z), or lowercase letter (a–z)**
- The string length is **exactly 6 characters**
- Display the generated string

---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

class AlphaNumericString;

  // Random array of 6 characters
  rand byte str [6];

  // Constraint block
  constraint range {
    foreach (str[i]) 
      str[i] inside {[48:57], [65:90], [97:122]};    // Allow only digits, uppercase, and lowercase characters
  }

  // Method to randomize and display string
  function void display();  
    if (!this.randomize()) 
      $display("Randomization failed!");
    else begin 
      $display("Random 6-character alphanumeric string: ");

      // Print characters one by one
      foreach (str[i])
        $write("%c", str[i]);
      $display("");
    end
  endfunction
endclass


// Testbench
module tb_alpha_numeric_string;
  AlphaNumericString character;
  initial begin
    character = new();
    // Generate 5 random strings 
    repeat(5) begin
      character.display();
    end
  end
endmodule
```
---
## Sample Output:
```text
Random 6-character alphanumeric string:
F89NBy

Random 6-character alphanumeric string:
Rhk5Hc

Random 6-character alphanumeric string:
z1f7NF

Random 6-character alphanumeric string:
twdzFr

Random 6-character alphanumeric string:
XIsL07

```
---

## Observation:

All generated strings contain only valid alphanumeric characters and maintain a fixed length of 6, confirming correct use of ASCII range constraints.
