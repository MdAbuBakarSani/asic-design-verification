// Code your testbench here 
// or browse Examples 

module Conditional_Operator;

  int a = 55;
  int b = 87;
  string result;

  initial begin

    $display("Conditional Operator in SystemVerilog");

    result = (a > b) ? "a is greater" : "b is greater";
    $display("Result is : %s", result);

  end
endmodule
