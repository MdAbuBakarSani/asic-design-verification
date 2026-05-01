// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// Monitor Class 
class my_monitor extends uvm_monitor;
  `uvm_component_utils(my_monitor)
  
  // Analysis port used to send transactions to other components such as scoreboard 
  uvm_analysis_port#(my_transaction)mon_ap;
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
    mon_ap = new("mon_ap", this);
  endfunction

  // Run phase: continuously generates/sends observed transactions
  task run_phase (uvm_phase phase);
    forever begin
      my_transaction tr;
       tr = my_transaction::type_id::create("tr", this);
      mon_ap.write(tr);    // Sends the transaction through the analysis port
    end
  endtask
endclass

// Scoreboard Class 
class my_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(my_scoreboard)

  // Analysis implementation port used to receive transactions from monitor 
  uvm_analysis_imp#(my_transaction, my_scoreboard)imp;

  // Queue used to store received transactions 
  my_transaction collected_transaction [$];
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
    imp = new("imp", this);
  endfunction

  // This function is automatically called when monitor writes a transaction 
  function void write (my_transaction tr);
    `uvm_info("Scoreboard", $sformatf("Recieved transaction :%s", tr.convert2string()), UVM_LOW);   // Prints the received transaction
    collected_transaction.push_back(tr);    // Stores transaction in queue
  endfunction
endclass
