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
