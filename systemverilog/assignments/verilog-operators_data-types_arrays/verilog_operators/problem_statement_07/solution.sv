// Code your testbench here 
// or browse Examples 

module Concatenation_Operator;

  logic [3:0] a = 4'b1010;
  logic [3:0] b = 4'b1100;
  logic [7:0] result_concat;

  initial begin

    $display("Concatenation Operator in SystemVerilog");

    result_concat = {a, b};
    $display("Concatenation of a and b: {%b, %b} = %b", a, b, result_concat);

  end
endmodule
