// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

class my_transaction extends uvm_sequence_item;
  `uvm_object_utils(my_transaction)
  function new (string name = "my_transaction");
    super.new(name);
  endfunction
endclass

class read_sqr extends uvm_sequencer#(my_transaction);
  `uvm_component_utils(read_sqr)
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

class write_sqr extends uvm_sequencer#(my_transaction);
  `uvm_component_utils(write_sqr)
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

class read_reset_sequence extends uvm_sequence#(my_transaction);
  `uvm_object_utils(read_reset_sequence)
  function new (string name = "read_reset_sequence");
    super.new(name);
  endfunction
  
  task body();
    `uvm_info("Read Reset Sequence", "Running", UVM_LOW)
  endtask
endclass

class write_reset_sequence extends uvm_sequence#(my_transaction);
  `uvm_object_utils(write_reset_sequence)
  function new (string name = "write_reset_sequence");
    super.new(name);
  endfunction
  
    task body();
      `uvm_info("Write Reset Sequence", "Running", UVM_LOW)
  endtask
endclass

class virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
  `uvm_component_utils(virtual_sequencer)
  read_sqr read_seqr;
  write_sqr write_seqr;

  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

class virtual_sequence extends uvm_sequence#(uvm_sequence_item);
  `uvm_object_utils(virtual_sequence)
  `uvm_declare_p_sequencer(virtual_sequencer)

  function new(string n ="virtual_sequence"); 
    super.new(n); 
  endfunction
  
  virtual task pre_body();
    if (p_sequencer == null)
      `uvm_fatal("VSEQ", "p_sequencer(virtual sequencer) is NULL")
    if (p_sequencer.read_seqr == null)
      `uvm_fatal("VSEQ", "read_seqr is NULL on virtual sequencer")
    if (p_sequencer.write_seqr == null)
      `uvm_fatal("VSEQ", "write_seqr is NULL on virtual sequencer")
  endtask

  task body();
    read_reset_sequence  rs = read_reset_sequence ::type_id::create("rs");
    write_reset_sequence ws = write_reset_sequence::type_id::create("ws");
    fork
      rs.start(vseqr.read_sqr);
      ws.start(vseqr.write_sqr); 
    join
  endtask
endclass

class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
  read_sqr rseqr;
  write_sqr wseqr;
  virtual_sequencer vseqr;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    rseqr = read_sqr::type_id::create("rseqr", this);
    wseqr = write_sqr::type_id::create("wseqr", this);
    vseqr = virtual_sequencer::type_id::create("vseqr", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    vseqr.read_sqr = rseqr;
    vseqr.write_sqr = wseqr;
  endfunction
endclass

class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  my_environment env;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = my_environment::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    virtual_sequence vs = virtual_sequence::type_id::create("vs");
    vs.start(env.vseqr);  
    phase.drop_objection(this);
  endtask
endclass

module top;
  initial run_test("my_test");
endmodule

