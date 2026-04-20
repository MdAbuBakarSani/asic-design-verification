// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// === Monitor 1 ===
class monitor_1 extends uvm_monitor;
  `uvm_component_utils(monitor_1)

// === Analysis port to send transactions ===
  uvm_analysis_port#(my_transaction)mon_ap;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
    mon_ap = new("mon_ap", this);
  endfunction

// === Run phase continuously creates and sends transactions ===
  task run_phase (uvm_phase phase);
    forever begin
      my_transaction tr;
      tr = my_transaction::type_id::create("tr", this);
      mon_ap.write(tr);
    end
  endtask
endclass

// === Monitor 2 ===
class monitor_2 extends uvm_monitor;
  `uvm_component_utils(monitor_2)
  uvm_analysis_imp#(my_transaction, monitor_2)imp;   // Receives transactions from monitor_1
  uvm_analysis_port#(my_transaction)mon_ap;          // Forwards transactions to scoreboard
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
    imp = new("imp", this);
    mon_ap = new("mon_ap", this);
  endfunction

// === This function is called when monitor_1 sends a transaction ===
  function void write(my_transaction tr);
      tr.op_code = 1;
    mon_ap.write(tr);
  endfunction
endclass

// === Environmrnt Class ===
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
 
  monitor_1 m1;
  monitor_2 m2;
  my_scoreboard scb;  
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

// === Build phase creates all components ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m1 = monitor_1::type_id::create("m1",  this);
    m2 = monitor_2::type_id::create("m2",  this);
    scb = my_scoreboard::type_id::create("scb", this);
  endfunction

// === Connect phase makes the analysis connections ===
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    m1.mon_ap.connect(m2.imp);   // M1 → M2 (receive)
    m2.mon_ap.connect(scb.imp);  // M2 → SCB (forward)
  endfunction
endclass
