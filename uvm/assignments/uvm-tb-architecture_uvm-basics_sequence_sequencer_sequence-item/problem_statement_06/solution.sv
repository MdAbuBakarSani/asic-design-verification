// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// === Test Class to Set the `delay_enable` and Override the Default Driver === 
class alu_test extends uvm_test;
  `uvm_component_utils(alu_test)
 
  alu_env env;

  function new (string name, uvm_component parent);
    super.new (name, parent);
  endfunction
  
// === Build Phase: Set delay_enable and override the default driver with delayed_driver ===
  function void build_phase (uvm_phase phase); 
    super.build_phase(phase);

// === Set delay_enable to 1 ===
    uvm_config_db#(bit)::set(this, "*", "delay_enable", 1);

// === Override the default driver with delayed_driver ===
    uvm_factory::set_type_override_by_type (alu_driver::get_type(), delayed_driver::get_type());
    
    env = alu_env::type_id::create("env", this);
  endfunction
endclass

// === Delayed Driver with Random Delay Control ===
class delayed_driver extends alu_driver;
  `uvm_component_utils(delayed_driver)
  
// === Delayed Driver with Random Delay Control ===
  rand int unsigned random_delay;

// === Constraint to randomize delay between 0 and 20ns ===
  constraint c_delayed_driver {random_delay inside {[0:20]};}
  
  function new (string name, uvm_component parent);  
    super.new(name, parent);
  endfunction
    
// === Build Phase: Retrieve `delay_enable` value and randomize the delay ===
  function void build_phase (uvm_phase phase); 
    super.build_phase(phase);

// === Get delay_enable flag from the test class via uvm_config_db ===
    assert(uvm_config_db#(bit)::get(this, "", "delay_enable", delay_enable));
  endfunction

// === Run Phase: Apply a random delay if delay_enable is 1 ===
  task run_phase(uvm_phase phase); 
    alu_sequence_item pkt;
    
    forever begin

// === Run Phase: Apply a random delay if delay_enable is 1 ===
      seq_item_port.get_next_item(pkt);

// === If delay_enable is set, introduce a random delay ===
      if (delay_enable) begin  
        assert(randomize())    
          else `uvm_error("Random Delay", "Randomization Failed!");
  
// === Apply the randomized delay === 
        #(random_delay * 1ns); 
      end
      
// === Mark the item as done === 
      seq_item_port.item_done();
    end 
  endtask
endclass
