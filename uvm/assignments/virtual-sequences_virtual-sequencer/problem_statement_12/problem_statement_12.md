# Problem 12: Create a Scoreboard Reset Sequence That Runs via a Virtual Sequencer

## Problem Statement:

Create a **scoreboard reset sequence** that runs via a **virtual sequencer**.

- The reset sequence should send reset commands to both:
  - **read agent**
  - **write agent**
- Use a **virtual sequence** to coordinate both reset sequences
- Ensure both reset sequences complete before any further transactions are issued

----

# Solution:

The solution is implemented as follows:

```systemverilog

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

// === Read Reset Sequence ===
class read_reset_sequence extends uvm_sequence#(my_transaction);
  `uvm_object_utils(read_reset_sequence)
  
  function new (string name = "read_reset_sequence");
    super.new(name);
  endfunction

// === Sequence body ===
  task body();
    `uvm_info("Read Reset Sequence", "Running", UVM_LOW)
  endtask
endclass

// === Write Reset Sequence ===
class write_reset_sequence extends uvm_sequence#(my_transaction);
  `uvm_object_utils(write_reset_sequence)
  
  function new (string name = "write_reset_sequence");
    super.new(name);
  endfunction

// === Sequence body ===
    task body();
      `uvm_info("Write Reset Sequence", "Running", UVM_LOW)
  endtask
endclass

// === Virtual Sequencer ===
class virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
  `uvm_component_utils(virtual_sequencer)
  
  read_sqr read_seqr;
  write_sqr write_seqr;

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

// === Check that all required sequencer handles are valid ===
  virtual task pre_body();
    
    if (p_sequencer == null)
      `uvm_fatal("VSEQ", "p_sequencer(virtual sequencer) is NULL")
      
    if (p_sequencer.read_seqr == null)
      `uvm_fatal("VSEQ", "read_seqr is NULL on virtual sequencer")
      
    if (p_sequencer.write_seqr == null)
      `uvm_fatal("VSEQ", "write_seqr is NULL on virtual sequencer")
  endtask

// === Start both reset sequences in parallel ===
// === join ensures both complete before moving forward ===
  task body();
    read_reset_sequence  rs = read_reset_sequence ::type_id::create("rs");
    write_reset_sequence ws = write_reset_sequence::type_id::create("ws");
    
    fork
      rs.start(vseqr.read_sqr);
      ws.start(vseqr.write_sqr); 
    join

    `uvm_info("Virtual Sequence", "Both reset sequences completed", UVM_LOW)
  endtask
endclass

// === Environment Class ===
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
  
  read_sqr rseqr;
  write_sqr wseqr;
  virtual_sequencer vseqr;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

// === Build phase creates sequencers ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    rseqr = read_sqr::type_id::create("rseqr", this);
    wseqr = write_sqr::type_id::create("wseqr", this);
    vseqr = virtual_sequencer::type_id::create("vseqr", this);
  endfunction

// === Connect phase connects real sequencers to virtual sequencer ===
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    vseqr.read_sqr = rseqr;
    vseqr.write_sqr = wseqr;
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

// === Run phase starts the virtual reset sequence ===
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
