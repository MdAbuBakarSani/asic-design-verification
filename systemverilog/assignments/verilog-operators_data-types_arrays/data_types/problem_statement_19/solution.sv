// Code your testbench here 
// or browse Examples 

module Enum_Name_Method;

  typedef enum {Verilog, SystemVerilog, UVM, Protocols, Soc} asic_dv;

  initial begin
    asic_dv course;

    course = Soc;

    $display("Current Enumeration value (index): %0d", course);
    $display("Current Name of the Enumeration value: %s", course.name());
    
  end
endmodule
