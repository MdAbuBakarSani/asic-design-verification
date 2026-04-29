# Problem 06: String Operations in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to demonstrate operations on **string data types**:

- Equality (`==`)
- Inequality (`!=`)
- Comparison (`<`, `>`)
- Concatenation
- Replication
- Indexing

---

## Solution:

The solution is implemented as follows:

```systemverilog


// Code your testbench here 
// or browse Examples 

module String_Operators;

  string str1 = "System";
  string str2 = "Verilog";
  string str3;
  byte index;

  initial begin

    $display("String Operations in SystemVerilog");

    // Equality
    $display("Equality (str1 == str2): %0b", (str1 == str2));

    // Inequality
    $display("Inequality (str1 != str2): %0b", (str1 != str2));

    // Comparison
    $display("Comparison (str1 < str2): %0b", (str1 < str2));
    $display("Comparison (str1 > str2): %0b", (str1 > str2));

    // Concatenation
    str3 = {str1, str2};
    $display("Concatenation (str1 + str2): %s", str3);

    // Replication
    str3 = {3{str1}};
    $display("Replication (3 times str1): %s", str3);

    // Indexing
    index = str1[3];
    $display("Indexing (str1[3]): %s", index);

  end
endmodule
```
---

## Sample Output:
```text
String Operations in SystemVerilog

Equality (str1 == str2): 0

Inequality (str1 != str2): 1

Comparison (str1 < str2): 1

Comparison (str1 > str2): 0

Concatenation (str1 + str2): SystemVerilog

Replication (3 times str1): SystemSystemSystem

Indexing (str1[3]): t
```
---

## Observation:

String operations in SystemVerilog behave similarly to high-level programming languages. Comparisons are performed lexicographically based on ASCII values, while concatenation and replication combine strings.
