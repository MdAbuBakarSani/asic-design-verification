// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// === Virtual Sequencer ===
class virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
  `uvm_component_utils(virtual_sequencer)
  
  function new(string name, uvm_component parent); 
    super.new(name,parent); 
  endfunction
endclass

// === Base Virtual Sequence ===
class base_virtual_sequence extends uvm_sequence#(uvm_sequence_item);
  `uvm_object_utils(base_virtual_sequence)
  `uvm_declare_p_sequencer(virtual_sequencer)

  function new(string name ="base_virtual_sequence"); 
    super.new(name); 
  endfunction

// === Sequence body ===
  task body();
    `uvm_info("VSEQ", $sformatf("Running %s", get_type_name()), UVM_LOW)
  endtask
endclass

// === Custom Virtual Sequence ===
class custom_virtual_sequence extends base_virtual_sequence;
  `uvm_object_utils(custom_virtual_sequence)
  
  function new(string name ="custom_virtual_sequence"); 
    super.new(name); 
  endfunction

// === Sequence body ===
  task body();
    `uvm_info("VSEQ", $sformatf("Running %s (customized)", get_type_name()), UVM_LOW)
  endtask
endclass

// === Environment Class ===
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
  
  virtual_sequencer vseqr;
  
  function new(string name, uvm_component parent); 
    super.new(name,parent); 
  endfunction

// === Build phase creates virtual sequencer ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    vseqr = virtual_sequencer::type_id::create("vseqr", this);
  endfunction
endclass

// === Test Class ===
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  my_environment env;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

// === Build phase applies factory override and creates environment ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    uvm_factory::get().set_type_override_by_type(base_virtual_sequence::get_type(), custom_virtual_sequence::get_type());

    env = my_environment::type_id::create("env", this);
  endfunction

// === Run phase creates the base sequence through factory ===
// === Due to override, custom sequence will actually be created ===
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    base_virtual_sequence bvs = base_virtual_sequence::type_id::create("bvs");
    
    `uvm_info("TEST", $sformatf("Inside Test => sequence type: %s", bvs.get_type_name()), UVM_NONE)
    
    bvs.start(env.vseqr);     // Start sequence on virtual sequencer
    
    phase.drop_objection(this);
  endtask

// === Start of Simulation Phase ===
  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase (phase);
    `uvm_info("FACTORY", "start_of_simulation_phase: ", UVM_NONE)
    uvm_factory::get().print();
  endfunction
endclass

// === Top Module ===
module top;
  initial run_test("my_test");
endmodule
