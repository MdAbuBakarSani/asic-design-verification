// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// Sequence Class 
// Demonstrates uvm_object_utils registration 
class my_sequence extends uvm_sequence#(my_transaction);
  `uvm_object_utils(my_sequence)
  
  function new(string name="my_sequence"); 
    super.new(name); 
  endfunction

  // Body task logs the sequence type name during execution 
  task body();
    `uvm_info("FACTORY", $sformatf("Created sequence type: %s", get_type_name()), UVM_LOW)
  endtask
endclass

// Driver Class 
// Demonstrates uvm_component_utils registration 
class my_driver extends uvm_driver#(my_transaction);
  `uvm_component_utils(my_driver)
  
  function new(string name, uvm_component parent); 
    super.new(name,parent); 
  endfunction

  // Build phase logs the driver type name during simulation 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("UVM Factory: ", $sformatf("Built component type: %s", get_type_name()), UVM_LOW)
  endfunction
endclass

// Test Class 
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  my_environment env;
  my_sequence seq;
  
  function new(string name, uvm_component parent); 
    super.new(name,parent); 
  endfunction

  // Build phase creates environment 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = my_environment::type_id::create("env", this);
  endfunction

  // Start of simulation phase prints factory registration table 
  function void start_of_simulation_phase(uvm_phase phase);
    uvm_factory::get().print(); // verify registrations
  endfunction
endclass

// Run phase to create and start the sequence 
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);   

    seq = my_sequence::type_id::create("seq");   
    seq.start(env.agt.seqr);   // Start sequence on sequencer

    phase.drop_objection(this);  
  endtask
endclass

// Top Module 
// Starts the UVM test 
module top;
  initial run_test("my_test");
endmodule
