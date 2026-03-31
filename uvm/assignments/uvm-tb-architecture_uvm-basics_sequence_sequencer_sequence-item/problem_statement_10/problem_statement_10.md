# Problem 10: Create Two Different Sequences for Random and Corner-Case Testing

## Problem Statement:

Create two different sequences:

- One for **random testing**.
- Another for **corner-case testing** (e.g., max/min operand values).

From the **test class**, use a **virtual sequence** to call both sequences back-to-back.

----

# Solution:

The solution is implemented as follows:

```systemverilog
// Code your testbench here 
// or browse Examples 

`include "uvm_macros.svh" 
import uvm_pkg::*;
