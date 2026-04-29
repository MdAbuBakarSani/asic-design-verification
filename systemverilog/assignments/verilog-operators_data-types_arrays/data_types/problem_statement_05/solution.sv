// Code your testbench here 
// or browse Examples 

module Unsigned_Data_Type;

  byte unsigned      a = 8'd101;
  shortint unsigned  b = 16'd2500;
  int unsigned       c = 32'd30000;
  longint unsigned   d = 64'd650123;

  initial begin

    $display("SystemVerilog Unsigned Data Types:");

    $display("byte a = %0d", a);
    $display("shortint b = %0d", b);
    $display("int c = %0d", c);
    $display("longint d = %0d", d);

  end
endmodule
