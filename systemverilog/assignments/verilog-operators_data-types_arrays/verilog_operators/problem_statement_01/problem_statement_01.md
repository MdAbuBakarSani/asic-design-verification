# Problem 01: Demonstrate Verilog Operators

## Problem Statement:

Write a Verilog/SystemVerilog code to demonstrate different **Verilog operators** using display statements.

The code should cover:

- Arithmetic operators
- Relational operators
- Equality operators
- Logical operators
- Bitwise operators
- Shift operators
- Concatenation operator
- Reduction operators
- Conditional/Ternary operator

---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

module Verilog_Operators;

  reg [3:0] a = 4'b1010;
  reg [3:0] b = 4'b0101;

  reg [7:0] concat_result;
  reg logic_result;

  initial begin

    // Arithmetic Operators
    $display("Arithmetic Operators:");
    $display("a + b = %0d", a + b);
    $display("a - b = %0d", a - b);
    $display("a * b = %0d", a * b);
    $display("a / b = %0d", a / b);
    $display("a %% b = %0d", a % b);

    // Relational Operators
    $display("\nRelational Operators:");
    $display("a < b = %0d", a < b);
    $display("a > b = %0d", a > b);
    $display("a <= b = %0d", a <= b);
    $display("a >= b = %0d", a >= b);

    // Equality Operators
    $display("\nEquality Operators:");
    $display("a == b = %0d", a == b);
    $display("a != b = %0d", a != b);
    $display("a === b = %0d", a === b);
    $display("a !== b = %0d", a !== b);

    // Logical Operators
    $display("\nLogical Operators:");
    $display("a && b = %0d", a && b);
    $display("a || b = %0d", a || b);
    $display("!a = %0d", !a);

    // Bitwise Operators
    $display("\nBitwise Operators:");
    $display("a & b = %b", a & b);
    $display("a | b = %b", a | b);
    $display("a ^ b = %b", a ^ b);
    $display("~a = %b", ~a);

    // Shift Operators
    $display("\nShift Operators:");
    $display("a << 1 = %b", a << 1);
    $display("a >> 1 = %b", a >> 1);

    // Concatenation Operator
    $display("\nConcatenation Operator:");
    concat_result = {a, b};
    $display("{a, b} = %b", concat_result);

    // Reduction Operators
    $display("\nReduction Operators:");
    $display("&a = %0d", &a);
    $display("|a = %0d", |a);
    $display("^a = %0d", ^a);
    $display("~&a = %0d", ~&a);

    // Conditional Operator
    $display("\nConditional (Ternary) Operator:");
    logic_result = (a > b) ? 1'b1 : 1'b0;
    $display("a > b ? 1 : 0 = %0d", logic_result);

  end
endmodule
```
---

## Sample Output:
```text
Arithmetic Operators:
a + b = 15
a - b = 5
a * b = 2
a / b = 2
a % b = 0

Relational Operators:
a < b = 0
a > b = 1
a <= b = 0
a >= b = 1

Equality Operators:
a == b = 0
a != b = 1
a === b = 0
a !== b = 1

Logical Operators:
a && b = 1
a || b = 1
!a = 0

Bitwise Operators:
a & b = 0000
a | b = 1111
a ^ b = 1111
~a = 0101

Shift Operators:
a << 1 = 0100
a >> 1 = 0101

Concatenation Operator:
{a, b} = 10100101

Reduction Operators:
&a = 0
|a = 1
^a = 0
~&a = 1

Conditional (Ternary) Operator:
a > b ? 1 : 0 = 1

```
---

## Observation:

The code demonstrates how different Verilog operators behave on 4-bit operands. Arithmetic, relational and equality operators produce numeric or Boolean results, while bitwise, shift, concatenation and reduction operators operate directly on the bit-level representation of the operands.
