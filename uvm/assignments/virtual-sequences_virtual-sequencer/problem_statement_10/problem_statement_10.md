# Problem 10: Pass Virtual Sequencer Handle from Environment to Test Using `uvm_config_db`

## Problem Statement:

Pass the **virtual sequencer handle** from the **environment** to the **test** using **`uvm_config_db`**, and access it in the **virtual sequence**.

- Pass the **virtual sequencer handle** from the environment
- Retrieve it in the **test**
- Start the **virtual sequence** using that handle
- Verify that all sequencer handles are properly initialized before starting child sequences
- Ensure **`read_sqr`** and **`write_sqr`** are not null before calling `start()`

-----

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

// === Virtual Sequencer ===
class virtual_sequencer extends uvm_sequencer#(uvm_sequence_item);
  `uvm_component_utils(virtual_sequencer)
  
  read_sequencer read_seqr;
  write_sequencer write_seqr;
   
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

// === pre_body checks that all required handles are valid BEFORE proceeding ===
  virtual task pre_body();

// === Check virtual sequencer handle ===
    if (p_sequencer == null)
      `uvm_fatal("VSEQ", "p_sequencer(virtual sequencer) is NULL")

// === Check read sequencer handle ===
    if (p_sequencer.read_sqr == null)
      `uvm_fatal("VSEQ", "read_sqr is NULL on virtual sequencer")

// === Check write sequencer handle ===
      if (p_sequencer.write_sqr == null)
      `uvm_fatal("VSEQ", "write_sqr is NULL on virtual sequencer")
  endtask

// === Body ===
  task body();
    
    read_seq  rs = read_seq ::type_id::create("rs");
    write_seq ws = write_seq::type_id::create("ws");
    
    rs.start(p_sequencer.read_seqr);      // Start read sequence on read sequencer
    ws.start(p_sequencer.write_seqr);     // Start write sequence on write sequencer
  endtask
endclass

// === Environment Class ===
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
  
  read_sqr     rseqr;
  write_sqr    wseqr;
  virtual_sequencer  vseqr;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
// === Build Phase ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    rseqr = read_sqr   ::type_id::create("rseqr", this);
    wseqr = write_sqr  ::type_id::create("wseqr", this);
    vseqr = virtual_sequencer::type_id::create("vseqr", this);

    uvm_config_db#(virtual_sequencer)::set(this, "", "vseqr", vseqr);
  endfunction

// === Connect phase connects real sequencers to virtual sequencer ===
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    vseqr.read_sqr  = rseqr;
    vseqr.write_sqr = wseqr;

// === Store virtual sequencer handle in config_db so test can retrieve it ===
    uvm_config_db#(virtual_sequencer)::set(this, "uvm_test_top", "vseqr", vseqr);
  endfunction
endclass

// === Test Class ===
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  my_environment env; 
  virtual_sequencer vseqr;

  function new(string name , uvm_component parent);
      super.new(name, parent);
  endfunction

// === Build phase creates environment ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    env = my_environment::type_id::create("env", this);

    if (!uvm_config_db#(virtual_sequencer)::get(this, "", "vseqr", vseqr))
      `uvm_fatal("TEST","vseqr handle not found in config_db");
  endfunction

// === Run phase starts virtual sequence on retrieved virtual sequencer ===
  task run_phase(uvm_phase phase);
    
    phase.raise_objection(this);
    
    virtual_sequence vs = virtual_sequence::type_id::create("vs");
    
    vs.start(vseqr);     // Start virtual sequence using the retrieved virtual sequencer handle
    
    phase.drop_objection(this);
  endtask
endclass

// === Top Module ===
module top;
  initial run_test("my_test");
endmodule
