// Code your testbench here 
// or browse Examples 

module Replication_Operator;

  logic [3:0] a = 4'b1010;
  logic [11:0] replicated_value;

  initial begin

    $display("Replication Operator in SystemVerilog");
    $display("Original value a = %b", a);

    replicated_value = {3{a}};
    $display("Replicated value {3{a}} = %b", replicated_value);

  end
endmodule
