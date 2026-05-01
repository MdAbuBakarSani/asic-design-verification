// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

class my_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(my_scoreboard)

  // Analysis implementation port used to receive transactions from monitor 
  uvm_analysis_imp #(my_transaction, my_scoreboard) imp;

  // FIFO used to store only mismatched transactions 
  uvm_tlm_fifo #(my_transaction) mismatch_fifo;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    imp           = new("imp", this);
    mismatch_fifo = new("mismatch_fifo", this, 16); // depth 16
  endfunction

  // This function is called whenever a transaction is received 
  function void write(my_transaction tr);
    if (tr.expected != tr.actual) begin
      void'(mismatch_fifo.try_put(tr));   // <-- function-safe
    end
  endfunction

  // Extract phase is used to print all stored mismatches at the end of simulation 
  function void extract_phase(uvm_phase phase);
    my_transaction tr;
    while (mismatch_fifo.try_get(tr)) begin
      $display("Mismatch: %p", tr);
    end
  endfunction
endclass
