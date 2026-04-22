# Problem 27: Generate a 6-Character String Containing Only Vowels

## Problem Statement:

Generate a **6-character string** such that:

- Each character is a **vowel**
- Allowed vowels: **a, e, i, o, u (both lowercase and uppercase)**
- Display the generated string

---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

// Define vowel enum with ASCII values
typedef enum byte {A_LOWER = "a", E_LOWER = "e", I_LOWER = "i", O_LOWER = "o", U_LOWER = "u",  
                   A_UPPER = "A", E_UPPER = "E", I_UPPER = "I", O_UPPER = "O", U_UPPER = "U"} vowel;

class VowelStringGeneration;

  // Random array of 6 vowels
  rand vowel str [6];

  // Method to randomize and display string
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else begin
      $display("Random 6-character vowel string: ");
      foreach (str[i])
        $write("%c", str[i]);
      $display("");
    end
  endfunction
endclass

// Testbench
module tb;
  VowelStringGeneration obj;
  initial begin
    obj = new();
    // Generate 5 random strings
    repeat(5) begin
      obj.display();
    end
  end
endmodule
```
---

## Sample Output:
```text
Random 6-character vowel string:
Eeoioo

Random 6-character vowel string:
AOAEOU

Random 6-character vowel string:
AeOeIA

Random 6-character vowel string:
UeIOUA

Random 6-character vowel string:
IEAOae
```
---

## Observation:

All generated strings contain only valid vowels in both uppercase and lowercase forms, confirming correct use of enum-based constrained randomization for character selection.
