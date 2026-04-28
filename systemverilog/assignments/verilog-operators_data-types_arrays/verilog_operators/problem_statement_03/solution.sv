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
