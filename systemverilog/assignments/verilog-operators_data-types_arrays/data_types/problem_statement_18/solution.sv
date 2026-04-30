// Code your testbench here 
// or browse Examples 

module Enum_Num_Method;

  typedef enum {Verilog, SystemVerilog, UVM, Protocols, Soc} asic_dv;

  initial begin
    asic_dv course;

    $display("Total Number of Courses in ASIC DV Curriculum: %0d", course.num());
 
  end
endmodule
