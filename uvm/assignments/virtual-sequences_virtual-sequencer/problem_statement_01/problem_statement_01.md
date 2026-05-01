# Problem 01: Create a Virtual Sequence to Control Two Sequences in Parallel

## Problem Statement:

Create a **virtual sequence** that controls two different sequences such as:

- **`read_seq`**
- **`write_seq`**

These sequences should run on two different sequencers, for example:

- one sequencer for the **read agent**
- one sequencer for the **write agent**

Coordinate both sequences to run **in parallel**.

-------

## Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// Virtual Sequence Class 
class virtual_seq extends uvm_sequence;
  `uvm_object_utils(virtual_seq)
  `uvm_declare_p_sequencer(virtual_sequencer)
  
  read_seq rseq;
  write_seq wseq;
  
  function new(string name = "virtual_seq");
    super.new(name);
  endfunction

  // Body task creates both sequences and starts them in parallel
  task body();
    rseq = read_seq::type_id::create("rseq");
    wseq = write_seq::type_id::create("wseq");
    fork
      rseq.start(p_sequencer.read_seq);        // Starts read sequence on read sequencer
      wseq.start(p_sequencer.write_seq);       // Starts write sequence on write sequencer
    join
  endtask
endclass
```
