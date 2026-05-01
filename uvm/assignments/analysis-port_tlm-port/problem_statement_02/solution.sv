// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// Scoreboard Class 
class my_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(my_scoreboard)

  // Separate analysis implementation ports for two monitor streams 
  uvm_analysis_imp_mon1#(my_transaction, my_scoreboard)imp1;
  uvm_analysis_imp_mon2#(my_transaction, my_scoreboard)imp2;
  
  // Queue to store received transactions 
  my_transaction collected_transaction [$];
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
    imp1 = new("imp1", this);
    imp2 = new("imp2", this);
  endfunction

  // Write function for monitor 1 stream 
  function void write_mon1 (my_transaction tr);
    `uvm_info("Scoreboard", $sformatf("Recieved transaction from Monitor1 :%s", tr.convert2string()), UVM_LOW);
    collected_transaction.push_back(tr);
  endfunction

  // Write function for monitor 2 stream
  function void write_mon2 (my_transaction tr);
    `uvm_info("Scoreboard", $sformatf("Recieved transaction from Monitor2 :%s", tr.convert2string()), UVM_LOW);
    collected_transaction.push_back(tr);
  endfunction
endclass
