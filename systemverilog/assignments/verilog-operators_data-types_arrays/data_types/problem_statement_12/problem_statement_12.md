# Problem 12: Compare Two Strings in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to:

- Declare two strings  
- Compare them using a built-in method  
- Display whether:
  - Strings are equal  
  - String 1 is less than String 2  
  - String 1 is greater than String 2  

---

## Solution:
The solution is implemented as follows:
```systemverilog



// Code your testbench here 
// or browse Examples 

module String_Compare;

  string str1 = "Verilog";
  string str2 = "SystemVerilog";
  int result;

  initial begin

    $display("String 1: %s", str1);
    $display("String 2: %s", str2);
    $display("Comparing between String 1 and String 2 --->");

    result = str1.compare(str2);

    if (result == 0)
      $display("Result: String 1 and String 2 are equal");
    else if (result < 0)
      $display("Result: String 1 is less than String 2");
    else
      $display("Result: String 1 is greater than String 2");

  end
endmodule
```
---

## Sample Output:
```text
String 1: Verilog

String 2: SystemVerilog

Comparing between String 1 and String 2 --->

Result: String 1 is greater than String 2
```
---

## Observation:

The `.compare()` method compares two strings **lexicographically** and returns:

- `0` → strings are equal
- `< 0` → first string is smaller
- `> 0` → first string is greater
