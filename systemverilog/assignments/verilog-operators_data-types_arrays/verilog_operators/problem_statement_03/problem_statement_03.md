# Problem 03: Bitwise Operators in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to demonstrate **bitwise operators**:

- NOT `~`
- AND `&`
- AND with complement `&~`
- OR `|`
- OR with complement `|~`
- XOR `^`
- XNOR `^~`
- XNOR `~^`


---

## Solution:

The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

module Bitwise_Operators;

  logic [3:0] a = 4'b1100;
  logic [3:0] b = 4'b1010;
  logic [3:0] result;

  initial begin

    $display("Bitwise Operators in SystemVerilog");

    // Bitwise NOT
    result = ~a;
    $display("~a = ~%b = %b", a, result);

    // Bitwise AND
    result = a & b;
    $display("a & b = %b & %b = %b", a, b, result);

    // Bitwise AND with complement
    result = a & ~b;
    $display("a & ~b = %b &~ %b = %b", a, b, result);

    // Bitwise OR
    result = a | b;
    $display("a | b = %b | %b = %b", a, b, result);

    // Bitwise OR with complement
    result = a | ~b;
    $display("a | ~b = %b |~ %b = %b", a, b, result);

    // Bitwise XOR
    result = a ^ b;
    $display("a ^ b = %b ^ %b = %b", a, b, result);

    // Bitwise XNOR (^~)
    result = a ^~ b;
    $display("a ^~ b = %b ^~ %b = %b", a, b, result);

    // Bitwise XNOR (~^)
    result = a ~^ b;
    $display("a ~^ b = %b ~^ %b = %b", a, b, result);

  end
endmodule
```
---

## Sample Output:
```text
Bitwise Operators in SystemVerilog

~a = ~1100 = 0011

a & b = 1100 & 1010 = 1000

a & ~b = 1100 &~ 1010 = 0100

a | b = 1100 | 1010 = 1110

a | ~b = 1100 |~ 1010 = 1101

a ^ b = 1100 ^ 1010 = 0110

a ^~ b = 1100 ^~ 1010 = 1001

a ~^ b = 1100 ~^ 1010 = 1001
```
---

## Observation:

Bitwise operators operate directly on individual bits of operands. Complement-based operations (`&~`, `|~`) combine inversion with standard logic, while `^~` and `~^` produce identical XNOR results. These operators are fundamental for low-level hardware design and bit manipulation.
