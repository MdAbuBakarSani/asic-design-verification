// Code your testbench here 
// or browse Examples 

module Enum_Prev_Method;

  typedef enum {Verilog, SystemVerilog, UVM, Protocols, Soc} asic_dv;

  int n;

  initial begin

    asic_dv course;

    course = Protocols;
    n = 2;

    $display("Current Member: %s", course.name());

    $display("nth Previous Member (n = %0d): %s", n, course.prev(n).name());

  end
endmodule
