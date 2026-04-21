// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// === Transaction Class ===
class my_transaction extends uvm_sequence_item;
  `uvm_object_utils(my_transaction)
  
  function new (string name = "my_transaction");
    super.new(name);
  endfunction
endclass

// === Read Sequencer ===
class read_sqr extends uvm_sequencer#(my_transaction);
  `uvm_component_utils(read_sqr)
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

// === Write Sequencer ===
class write_sqr extends uvm_sequencer#(my_transaction);
  `uvm_component_utils(write_sqr)
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

// === Config Sequencer ===
class config_sqr extends uvm_sequencer#(my_transaction);
  `uvm_component_utils(config_sqr)
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

// === Read Sequence ===
class read_sequence extends uvm_sequence#(my_transaction);
  `uvm_object_utils(read_sequence)
  function new (string name = "read_sequence");
    super.new(name);
  endfunction

// === Sequence body ===
  task body();
    `uvm_info("Read Sequence", "Running", UVM_LOW)
  endtask
endclass

// === Write Sequence ===
class write_sequence extends uvm_sequence#(my_transaction);
  `uvm_object_utils(write_sequence)
  function new (string name = "write_sequence");
    super.new(name);
  endfunction

// === Sequence body ===
  task body();
    `uvm_info("Write Sequence", "Running", UVM_LOW)
  endtask
endclass

// === Config Sequence ===
class config_sequence extends uvm_sequence#(my_transaction);
  `uvm_object_utils(config_sequence)
  function new (string name = "config_sequence");
    super.new(name);
  endfunction

// === Sequence body ===
  task body();
    `uvm_info("Config Sequence", "Running", UVM_LOW)
  endtask
endclass

// === Virtual Sequencer ===
class virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
  `uvm_component_utils(virtual_sequencer)
  
  read_sqr read_seqr;
  write_sqr write_seqr;
  config_sqr config_seqr;
   
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

// === Virtual Sequence ===
class virtual_sequence extends uvm_sequence#(uvm_sequence_item);
  `uvm_object_utils(virtual_sequence)
  `uvm_declare_p_sequencer(virtual_sequencer)

  function new(string n ="virtual_sequence"); 
    super.new(n); 
  endfunction

// === Body coordinates sequences across all three sequencers ===
  task body();
    
    read_sequence  rs = read_seq ::type_id::create("rs");
    write_sequence ws = write_seq::type_id::create("ws");
    config_sequence cs = config_seq::type_id::create("cs");

// === Run read and write sequences in parallel ===
    `uvm_info("VSEQ", "Starting Read and Write Sequences in Parallel", UVM_LOW)
    fork
      begin
        $display("Read Started");
        rs.start(p_sequencer.read_seqr);
        $display("Read Finished");
      end
      
      begin
        $display("Write Started");
        ws.start(p_sequencer.write_seqr);
        $display("Write Finished");
      end
    join

// === Run config sequence after read and write complete ===
    $display("Config Started");
    cs.start(p_sequencer.write_seqr);
    $display("Config Finished");
  endtask
endclass

// === Environment Class ===
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
  
  read_sqr rseqr;
  write_sqr wseqr;
  config_sqr cseqr;
  virtual_sequencer vseqr;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

// === Build phase creates all sequencers ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    rseqr = read_sqr::type_id::create("rseqr", this);
    wseqr = write_sqr::type_id::create("wseqr", this);
    cseqr = config_sqr::type_id::create("cseqr", this);
    vseqr = virtual_sequencer::type_id::create("vseqr", this);
  endfunction

// === Connect phase assigns real sequencers to virtual sequencer ===
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    vseqr.read_sqr = rseqr;
    vseqr.write_sqr = wseqr;
    vseqr.config_sqr = cseqr;
  endfunction
endclass

// === Test Class ===
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  my_environment env;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

// === Build phase creates environment ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = my_environment::type_id::create("env", this);
  endfunction

// === Run phase starts virtual sequence ===
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    virtual_sequence vs = virtual_sequence::type_id::create("vs");
    vs.start(env.vseqr);  
    
    phase.drop_objection(this);
  endtask
endclass

// === Top Module ===
module top;
  initial run_test("my_test");
endmodule
