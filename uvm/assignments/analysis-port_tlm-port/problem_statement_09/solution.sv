// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

class coverage_component extends uvm_component;
  `uvm_component_utils(coverage_component)

  // Analysis export used to receive transactions from outside this component 
  uvm_analysis_export #(my_transaction) analysis_export;
  
  // Internal analysis implementation used to handle received transactions 
  uvm_analysis_imp #(my_transaction, coverage_component) imp;

  // Covergroup used for coverage collection 
  covergroup cg; 
    // coverpoint logic 
  endgroup

  function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_export = new("analysis_export", this);
    imp = new("imp", this);
    cg = new();
  endfunction

  // Connect phase 
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    analysis_export.connect(imp);     // Connects export to internal analysis implementation
  endfunction

  // This function is called when a transaction arrives through analysis_export 
  function void write(my_transaction tr);
    cg.sample();    // coverage logic
  endfunction
endclass
