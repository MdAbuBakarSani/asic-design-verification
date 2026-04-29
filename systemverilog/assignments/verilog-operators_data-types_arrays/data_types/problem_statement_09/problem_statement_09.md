# Problem 09: Character Replacement in a String

## Problem Statement:

Write a SystemVerilog program to:

- Take a string  
- Replace specific characters:
  - 's' → 'S'  
  - 'v' → 'V'  
  - 't' → 'T'  
- Display both original and modified strings  

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module Replace_Letters;

  string original = "systemverilog";
  string modified = "";
  byte ch;

  initial begin

    for (int i = 0; i < original.len(); i++) begin
      ch = original[i];

      if (ch == "s")
        ch = "S";
      else if (ch == "v")
        ch = "V";
      else if (ch == "t")
        ch = "T";

      modified = {modified, ch};
    end

    $display("Original string: %s", original);
    $display("Modified string: %s", modified);

  end
endmodule
```
---

## Sample Output:
```text
Original string: systemverilog

Modified string: SysTemVerilog
```
---

## Observation:

The program scans the string **character by character**, checks conditions, and builds a new modified string using concatenation.
