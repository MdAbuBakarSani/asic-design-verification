// Code your testbench here 
// or browse Examples 

module Enum_Data_Type;

  typedef enum {Verilog, SystemVerilog, UVM, Protocols, Soc} asic_dv;

  initial begin

    asic_dv asic_dv_courses;

    asic_dv_courses = UVM;

    $display("Enum Example in SystemVerilog");

    $display("asic_dv_courses.first(): %0d", asic_dv_courses.first());
    $display("asic_dv_courses.last(): %0d", asic_dv_courses.last());

    // Additional useful methods
    $display("asic_dv_courses.next(): %0d", asic_dv_courses.next());
    $display("asic_dv_courses.prev(): %0d", asic_dv_courses.prev());
    $display("asic_dv_courses.num(): %0d", asic_dv_courses.num());
    $display("asic_dv_courses.name(): %s", asic_dv_courses.name());
    $display("asic_dv_courses.next(3): %0d", asic_dv_courses.next(3));

  end
endmodule
