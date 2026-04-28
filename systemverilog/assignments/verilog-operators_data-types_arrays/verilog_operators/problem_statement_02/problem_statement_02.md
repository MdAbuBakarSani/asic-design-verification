# Problem 02: Logical Operators in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to demonstrate **logical operators**:

- Logical NOT `!`
- Logical AND `&&`
- Logical OR `||`
- Logical implication `(a -> b)` equivalent
- Logical bi-implication `(a <-> b)` equivalent


---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

module Logical_Operators;

  logic a = 1;
  logic b = 0;

  initial begin

    $display("Logical Operators in SystemVerilog:");
    $display("Given: a = %0b, b = %0b", a, b);

    // Logical NOT
    $display("Logical NOT: !a = %0b (inverts value of a)", !a);

    // Logical AND
    $display("Logical AND: (a && b) = %0b (1 only if both are 1)", (a && b));

    // Logical OR
    $display("Logical OR: (a || b) = %0b (1 if any one is 1)", (a || b));

    // Logical Implication (a -> b ≡ !a || b)
    $display("Logical Implication: (!a || b) = %0b (false only when a=1 and b=0)", (!a || b));

    // Logical Bi-implication (a <-> b ≡ a == b)
    $display("Bi-implication: (a == b) = %0b (true when both are equal)", (a == b));

  end
endmodule
```
---

## Sample Output:
```text
Logical Operators in SystemVerilog:

Given: a = 1, b = 0

Logical NOT: !a = 0 (inverts value of a)

Logical AND: (a && b) = 0 (1 only if both are 1)

Logical OR: (a || b) = 1 (1 if any one is 1)

Logical Implication: (!a || b) = 0 (false only when a=1 and b=0)

Bi-implication: (a == b) = 0 (true when both are equal)
```
---

## Observation:

Logical operators evaluate Boolean conditions. While `!`, `&&`, and `||` are native operators, implication and bi-implication are derived forms implemented using logical equivalence. These operators are widely used in assertions, conditions, and verification logic.
