// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// === Ordered Virtual Sequence ===
class ordered_virtual_sequence extends uvm_sequence#(uvm_sequence_item);
  `uvm_object_utils(ordered_virtual_sequence)
  `uvm_declare_p_sequencer(virtual_sequencer)

  function new(string n="ordered_virtual_sequence"); 
    super.new(n); 
  endfunction

// === Body executes sequences in a fixed order ===
  task body();
    seq_A a = seq_A::type_id::create("a");
    seq_B b = seq_B::type_id::create("b");
    seq_C c = seq_C::type_id::create("c");

// === Start seq_A on read sequencer ===
    `uvm_info("VSEQ","Start A on READ",  UVM_LOW)
    a.start(p_sequencer.read_sqr);    
    `uvm_info("VSEQ","Finished",  UVM_LOW)

// === Start seq_B on write sequencer ===
    `uvm_info("VSEQ","Start B on WRITE", UVM_LOW)
    b.start(p_sequencer.write_sqr);   
    `uvm_info("VSEQ","Finished",  UVM_LOW)

// === Start seq_C on read sequencer ===
    `uvm_info("VSEQ","Start C on READ",  UVM_LOW)
    c.start(p_sequencer.read_sqr);   
    `uvm_info("VSEQ","Finished",  UVM_LOW)
  endtask
endclass
