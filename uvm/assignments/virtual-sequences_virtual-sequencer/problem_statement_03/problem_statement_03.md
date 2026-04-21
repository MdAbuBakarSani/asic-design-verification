# Problem 03: Run Read Sequence First, Then Start Write Sequence from a Virtual Sequence

## Problem Statement:

Implement a system where the **virtual sequence**:

- runs one sequence on the **read sequencer**
- waits for it to complete
- then starts another sequence on the **write sequencer**

Also, log the transaction flow clearly during execution.

------

# Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here 
// or browse Examples 

`include "uvm_macros.svh" 
import uvm_pkg::*;

class virtual_seq extends uvm_sequence;
  `uvm_object_utils(virtual_seq)
  `uvm_declare_p_sequencer(virtual_sequencer)
  
  read_seq rseq;
  write_seq wseq;
  
  function new(string name = "virtual_seq");
    super.new(name);
  endfunction
  
  task body();
    rseq = read_seq::type_id::create("rseq");
    wseq = write_seq::type_id::create("wseq");
    
    `uvm_info("Virtual Sequencer", "Starting Read Sequence", UVM_LOW)
    rseq.start(p_sequencer.read_seq);       // Starts read sequence first
    `uvm_info("Virtual Sequencer", "Read Sequence Completed", UVM_LOW)
    
    `uvm_info("Virtual Sequencer", "Starting Write Sequence", UVM_LOW)
    wseq.start(p_sequencer.write_seq);       // Starts write sequence only after read completes
    `uvm_info("Virtual Sequencer", "Write Sequence Completed", UVM_LOW)
  endtask
endclass
