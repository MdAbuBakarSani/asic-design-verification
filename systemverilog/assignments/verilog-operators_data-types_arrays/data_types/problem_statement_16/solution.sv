// Code your testbench here 
// or browse Examples 

module Enum_Next_Method;

  typedef enum {Verilog, SystemVerilog, UVM, Protocols, Soc} asic_dv;

  int n;

  initial begin

    asic_dv course;

    course = UVM;
    n = 2;

    $display("Current Member: %s", course.name());

    $display("nth Next Member (n = %0d): %s", n, course.next(n).name());

  end
endmodule
