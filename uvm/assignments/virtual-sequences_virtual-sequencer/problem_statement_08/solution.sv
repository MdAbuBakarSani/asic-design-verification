// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

class virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
  `uvm_component_utils(virtual_sequencer)
  function new(string name, uvm_component parent); 
    super.new(name,parent); 
  endfunction
endclass

class base_virtual_sequence extends uvm_sequence#(uvm_sequence_item);
  `uvm_object_utils(base_virtual_sequence)
  `uvm_declare_p_sequencer(virtual_sequencer)

  function new(string name ="base_virtual_sequence"); 
    super.new(name); 
  endfunction
  task body();
    `uvm_info("VSEQ", $sformatf("Running %s", get_type_name()), UVM_LOW)
  endtask
endclass

class custom_virtual_sequence extends base_virtual_sequence;
  `uvm_object_utils(custom_virtual_sequence)
  function new(string name ="custom_virtual_sequence"); 
    super.new(name); 
  endfunction
  task body();
    `uvm_info("VSEQ", $sformatf("Running %s (customized)", get_type_name()), UVM_LOW)
  endtask
endclass

class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
  virtual_sequencer vseqr;
  
  function new(string name, uvm_component parent); 
    super.new(name,parent); 
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    vseqr = virtual_sequencer::type_id::create("vseqr", this);
  endfunction
endclass

// ---------- Test: set factory override & verify ----------
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  my_environment env;

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_factory::get().set_type_override_by_type(base_virtual_sequence::get_type(),
                                                 custom_virtual_sequence::get_type());

    env = my_environment::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    base_virtual_sequence bvs = base_virtual_sequence::type_id::create("bvs");
    `uvm_info("TEST", $sformatf("Inside Test => sequence type: %s", bvs.get_type_name()), UVM_NONE)
    v.start(env.vseqr);
    phase.drop_objection(this);
  endtask

  function void start_of_simulation_phase(uvm_phase phase);
    `uvm_info("FACTORY", "start_of_simulation_phase: ", UVM_NONE)
    uvm_factory::get().print();
  endfunction
endclass

module top;
  initial run_test("my_test");
endmodule











