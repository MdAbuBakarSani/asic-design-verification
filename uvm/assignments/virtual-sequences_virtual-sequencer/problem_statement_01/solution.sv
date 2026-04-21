// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// === Virtual Sequence Class ===
class virtual_seq extends uvm_sequence;
  `uvm_object_utils(virtual_seq)
  `uvm_declare_p_sequencer(virtual_sequencer)
  
  read_seq rseq;
  write_seq wseq;
  
  function new(string name = "virtual_seq");
    super.new(name);
  endfunction

// === Body task creates both sequences and starts them in parallel ===
  task body();
    rseq = read_seq::type_id::create("rseq");
    wseq = write_seq::type_id::create("wseq");
    fork
      rseq.start(p_sequencer.read_seq);        // Starts read sequence on read sequencer
      wseq.start(p_sequencer.write_seq);       // Starts write sequence on write sequencer
    join
  endtask
endclass
