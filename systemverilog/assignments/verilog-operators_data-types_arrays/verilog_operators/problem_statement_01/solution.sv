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
