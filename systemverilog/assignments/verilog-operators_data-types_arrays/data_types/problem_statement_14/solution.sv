// Code your testbench here 
// or browse Examples 

module Typedef_Enum_Example;

  // Default enum (auto integer)
  typedef enum {Verilog, SystemVerilog, UVM, Protocols, Soc} asic_dv_tde;

  // Explicit integer enum
  typedef enum int {Sat = 0, Sun = 1, Mon = 2, Tue = 3, Wed = 4, Thu = 5} weekdays_tde;

  // Bit-based enum (3-bit wide)
  typedef enum bit [2:0] {data_in, data_out, shift_amount, Serial_in, Serial_out} modules_tde;

  initial begin

    asic_dv_tde asic_dv;
    weekdays_tde weekdays;
    modules_tde modules;

    asic_dv = UVM;
    weekdays = Wed;
    modules = shift_amount;

    $display("Enum Typedef examples in SystemVerilog");

    $display("ASIC DV Course Value: %0d (%s)", asic_dv, asic_dv.name());
    $display("Weekdays Value: %0d (%s)", weekdays, weekdays.name());
    $display("Modules Value: %0d (%s)", modules, modules.name());

  end
endmodule
