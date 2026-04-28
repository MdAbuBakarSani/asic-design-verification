// Code your testbench here 
// or browse Examples 

module Reduction_Operators;

  logic [3:0] a = 4'b1101;
  logic result;

  initial begin

    $display("Reduction Operators in SystemVerilog");

    // AND reduction
    result = &a;
    $display("&a = &%b = %0b", a, result);

    // NAND reduction
    result = ~&a;
    $display("~&a = ~&%b = %0b", a, result);

    // OR reduction
    result = |a;
    $display("|a = |%b = %0b", a, result);

    // NOR reduction
    result = ~|a;
    $display("~|a = ~|%b = %0b", a, result);

    // XOR reduction
    result = ^a;
    $display("^a = ^%b = %0b", a, result);

    // XNOR reduction
    result = ~^a;
    $display("~^a = ~^%b = %0b", a, result);

  end
endmodule
