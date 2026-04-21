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

// === Monitor Sequence ===
class monitor_sequence extends uvm_sequence#(my_transaction);
  `uvm_object_utils(monitor_sequence)
  
  function new (string name = "monitor_sequence");
    super.new(name);
  endfunction

// === Sequence body ===
  task body();
    `uvm_info("Monitor Sequence", "Running", UVM_LOW)
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

// === Virtual sequence body ===
  task body();
    read_sequence rs = read_sequence::type_id::create("rs"); 
    write_sequence ws = write_sequence::type_id::create("ws");
    monitor_sequence mr = monitor_sequence::type_id::create("mr");
    monitor_sequence mw = monitor_sequence::type_id::create("mw");

// === Run interleaved operations ===
    fork 
      begin
        `uvm_info("VSEQ","Starting Read now", UVM_LOW)
        rs.start (p_sequencer.read_seqr);
        `uvm_info("VSEQ","Read done", UVM_LOW)
      end 
      
      begin 
        #20ns;
        `uvm_info("VSEQ","Starting Write now after 20ns delay", UVM_LOW)
        ws.start (p_sequencer.write_seqr);
        `uvm_info("VSEQ","Write done", UVM_LOW)
      end
      
      begin
        #20ns;
        `uvm_info("VSEQ","Running Monitor on both sequences", UVM_LOW)
        fork
          mr.start (p_sequencer.read_seqr);        // Monitor sequence on read side
          mw.start (p_sequencer.write_seqr);       // Monitor sequence on write side
        join   
        
        `uvm_info("VSEQ","Monitor done", UVM_LOW)
      end
    join
    
    `uvm_info("VSEQ","Interleaved operation done", UVM_LOW)
  endtask
endclass
