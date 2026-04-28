# Problem 09: Streaming Operators in SystemVerilog

## Problem Statement:

Write a SystemVerilog program to demonstrate **streaming operators**:

- Left-to-right streaming `{<< {}}`
- Right-to-left streaming `{>> {}}`



---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

module Streaming_Operators;

  logic [15:0] a = 16'h1234;
  logic [15:0] left_to_right_stream;
  logic [15:0] right_to_left_stream;

  initial begin

    $display("Streaming Operators in SystemVerilog");
    $display("Value of a is %b", a);

    // Left-to-right streaming
    left_to_right_stream = {<< {a}};
    $display("left_to_right_stream = {<< {a}} : %b", left_to_right_stream);

    // Right-to-left streaming
    right_to_left_stream = {>> {a}};
    $display("right_to_left_stream = {>> {a}} : %b", right_to_left_stream);

  end
endmodule
```
---

## Sample Output:
```text
Streaming Operators in SystemVerilog

Value of a is 0001001000110100

left_to_right_stream = {<< {a}} : 0011010000100001

right_to_left_stream = {>> {a}} : 0001001000110100
```
---

## Observation:

Streaming operators rearrange bit ordering within a vector. `{<< {}}` streams bits from left to right, effectively reversing chunk ordering, while `{>> {}}` streams from right to left, typically preserving the original arrangement. These operators are useful for data packing, endian conversion and protocol formatting.
