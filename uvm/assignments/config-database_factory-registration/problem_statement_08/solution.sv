// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// Base Sequence 
class base_sequence extends uvm_sequence#(uvm_sequence_item);
  `uvm_object_utils(base_sequence)
  
  function new(string name = "base_sequence"); 
    super.new(name); 
  endfunction

  // Body task 
    `uvm_info("Sequence", "BASE sequence", UVM_LOW)
  endtask
endclass

// Burst Sequence 
class burst_sequence extends base_sequence;
  `uvm_object_utils(burst_sequence)
  
  function new(string name = "burst_sequence"); 
    super.new(name); 
  endfunction

  // Body task 
  task body();
    `uvm_info("Sequence", "BURST sequence", UVM_LOW)
  endtask
endclass

// Sequencer Class 
class my_sequencer extends uvm_sequencer#(uvm_sequence_item);
  `uvm_component_utils(my_sequencer)
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

// Environment Class
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)

  my_sequencer seqr1;     // First sequencer
  my_sequencer seqr2;     // Second sequencer

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  // Build phase creates both sequencers 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seqr1 = my_sequencer::type_id::create("seqr1", this);
    seqr2 = my_sequencer::type_id::create("seqr2", this);
  endfunction
endclass

// Test Class 
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  my_environment env;

  // Build phase creates environment and sets instance override 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = my_environment::type_id::create("env", this);
    uvm_factory::get().set_inst_override_by_type(base_sequence ::get_type(), burst_sequence::get_type(), "env.seqr1");
  endfunction

  // Run phase creates two base_sequence objects and starts them on different sequencers 
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    base_sequence seq1;
    base_sequence seq2;

    seq1 = base_sequence::type_id::create("seq1", env.seqr1);
    seq2 = base_sequence::type_id::create("seq2", env.seqr2);

    seq1.start(env.seqr1);
    seq2.start(env.seqr2);

    phase.drop_objection(this);
  endtask
endclass

// Top Module 
module top;
  initial run_test("my_test");
endmodule
