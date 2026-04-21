// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// === Transaction Class ===
class my_transaction extends uvm_sequence_item;
  `uvm_object_utils(my_transaction)
  
  function new(string name="my_transaction"); 
    super.new(name); 
  endfunction
endclass

// === Configuration Object Class ===
class transaction_config extends uvm_object;
  `uvm_object_utils(transaction_config)
  
  rand int unsigned addr_width;     // Address width configuration field
  rand string       data_mode;      // Data mode configuration field

  function new(string name="transaction_config");
    super.new(name);
  endfunction
endclass

// === Driver Class ===
class my_driver extends uvm_driver#(my_transaction);
  `uvm_component_utils(my_driver)
  
  transaction_config cfg;
  
  function new(string name, uvm_component parent); 
    super.new(name, parent); 
  endfunction

// === Build phase retrieves the configuration object from config_db ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_config_db#(transaction_config)::get(this, "", "cfg", cfg);
  endfunction
endclass

// === Environment Class ===
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
  
  my_driver drv;

// === Build phase creates the driver ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = my_driver::type_id::create("drv", this);
  endfunction
endclass

// === Test Class ===
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  my_environment env;

// === Build phase creates config object, sets fields, and passes it through config_db ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    transaction_config cfg = transaction_config::type_id::create("cfg");

    cfg.addr_width = 32; 
    cfg.data_mode  = "BURST";
    
    uvm_config_db#(transaction_config)::set(this, "env.drv", "cfg", cfg);
    
    env = my_environment::type_id::create("env", this);
  endfunction
endclass

// === Top Module ===
module top;
  initial run_test("my_test");
endmodule
