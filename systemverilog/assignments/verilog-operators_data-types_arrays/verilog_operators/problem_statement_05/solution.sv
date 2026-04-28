// Code your testbench here 
// or browse Examples 

module Shift_Operators;

  // Unsigned and signed variables
  logic [3:0] a = 4'b1010;
  logic signed [3:0] b = -4;

  logic [3:0] result_u;
  logic signed [3:0] result_s;

  initial begin

    $display("Shift Operators in SystemVerilog");

    // Logical Left Shift
    result_u = a << 1;
    $display("Logical Left Shift (a << 1) : %b << 1 = %b", a, result_u);

    // Logical Right Shift
    result_u = a >> 1;
    $display("Logical Right Shift (a >> 1) : %b >> 1 = %b", a, result_u);

    // Arithmetic Left Shift
    result_s = b <<< 1;
    $display("Arithmetic Left Shift (b <<< 1) : %b <<< 1 = %b", b, result_s);

    // Arithmetic Right Shift
    result_s = b >>> 1;
    $display("Arithmetic Right Shift (b >>> 1) : %b >>> 1 = %b", b, result_s);

  end
endmodule
