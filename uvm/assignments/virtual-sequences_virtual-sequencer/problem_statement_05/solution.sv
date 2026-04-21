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
  
class read_sequencer extends uvm_sequencer#(my_transaction);
  `uvm_component_utils(read_sequencer)
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

class write_sequencer extends uvm_sequencer#(my_transaction);
  `uvm_component_utils(write_sequencer)
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

class read_sequence extends uvm_sequence#(my_transaction);
  `uvm_object_utils(read_sequence)
  function new (string name = "read_sequence");
    super.new(name);
  endfunction
  
  task body();
    `uvm_info("Read Sequence", "Running", UVM_LOW)
  endtask
endclass

class write_sequence extends uvm_sequence#(my_transaction);
  `uvm_object_utils(write_sequence)
  function new (string name = "write_sequence");
    super.new(name);
  endfunction
  
  task body();
    `uvm_info("Write Sequence", "Running", UVM_LOW)
  endtask
endclass

class virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
  `uvm_component_utils(virtual_sequencer)
  read_sequencer read_seqr;
  write_sequencer write_seqr;
   
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

class virtual_sequence extends uvm_sequence#(uvm_sequence_item);
  `uvm_declare_p_sequencer(virtual_sequencer)
  `uvm_object_utils(virtual_sequence)
  int transfer_count = 1;
  
  function new (string name = "virtual_sequence");
    super.new(name);
  endfunction
  
  virtual task pre_body();
    uvm_config_db#(int)::get(null, get_full_name(), "transfer_count", transfer_count);
  endtask
  
  task body();
    for (int i = 0; i <transfer_count, i++) begin
      read_sequence rs = read_sequence::type_id::create($sformatf("rs_%0d", i)); // gives each sequence a unique hierarchical name
      write_sequence ws = write_sequence::type_id::create($sformatf("ws_%0d", i)); // gives each sequence a unique hierarchical name
      rs.start (p_sequencer.read_seqr);
      ws.start (p_sequencer.write_seqr);
    end
  endtask
endclass
  
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
  read_sequencer     rseqr;
  write_sequencer    wseqr;
  virtual_sequencer  vseqr;
  function new(string n, uvm_component p); 
    super.new(n,p); 
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    rseqr = read_sequencer   ::type_id::create("rseqr", this);
    wseqr = write_sequencer  ::type_id::create("wseqr", this);
    vseqr = virtual_sequencer::type_id::create("vseqr", this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    vseqr.read_seqr  = rseqr;
    vseqr.write_seqr = wseqr;
  endfunction
endclass  

class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  my_environment env;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = my_environment::type_id::create("env", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    virtual_sequence vs = virtual_sequence::type_id::create("vs"); 
    uvm_config_db#(int)::set(this, vs.get_full_name(), "transfer_count", transfer_count);
    vs.start(env.vseqr);
    phase.drop_objection(this);
  endtask
endclass

module top;
  initial run_test("my_test");
endmodule
      











