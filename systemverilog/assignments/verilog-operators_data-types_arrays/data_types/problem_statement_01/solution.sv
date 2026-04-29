// Code your testbench here 
// or browse Examples 

module Continuous_Assignment_Example;

  wire a, b, xor_result;

  // Continuous assignments
  assign a = 1'b1;
  assign b = 1'b0;
  assign xor_result = a ^ b;

  initial begin
    #1;
    $display("Continuous_Assignment_Example");
    $display("Inputs: a = %b, b = %b", a, b);
    $display("Output: a ^ b = %b", xor_result);
  end
endmodule
