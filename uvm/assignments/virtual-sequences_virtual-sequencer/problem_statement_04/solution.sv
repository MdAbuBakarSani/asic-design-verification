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
class read_sequencer extends uvm_sequencer#(my_transaction);
  `uvm_component_utils(read_sequencer)
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

// === Write Sequencer ===
class write_sequencer extends uvm_sequencer#(my_transaction);
  `uvm_component_utils(write_sequencer)
  
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
  `uvm_declare_p_sequencer(virtual_sequencer)
  `uvm_object_utils(virtual_sequence)
  
  function new (string name = "virtual_sequence");
    super.new(name);
  endfunction

// === Body randomly chooses which sequence to run ===
  task body();
    int sel = $urandom_range(0, 2);    // Randomly selects 0, 1, or 2
    
    read_sequence rs = read_sequence::type_id::create("rs");
    write_sequence ws = write_sequence::type_id::create("ws");

// === Decide what to run based on random value ===
    case (sel)
      0: rs.start (p_sequencer.read_seqr);      // Run only read sequence
      1: ws.start (p_sequencer.write_seqr);     // Run only write sequence
      2: fork
        rs.start (p_sequencer.read_seqr);       // Run read sequence
        ws.start (p_sequencer.write_seqr);      // Run write sequence
      join
    endcase 
  endtask
endclass
