# Problem 10: Implement a Parallel Scoreboard Setup Using `uvm_analysis_port` Broadcasting

## Problem Statement:

Implement a **parallel scoreboard** setup where **two scoreboards** receive the **same transactions** from a **monitor**.

- One scoreboard should check **field-level accuracy**
- The other scoreboard should check **sequence order**
- Use **`uvm_analysis_port` broadcasting** so the monitor can send the same transaction stream to both scoreboards

-----

## Status:
⚠️ Partially Solved

## Note:
The broadcasting setup is implemented correctly, but the second scoreboard does not yet perform a real **sequence-order check**. 

------

# Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// === Monitor Class ===
class my_monitor extends uvm_monitor;
  `uvm_component_utils(my_monitor)

  uvm_analysis_port #(my_transaction) mon_ap;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
    mon_ap = new("mon_ap", this);
  endfunction

// === Run Phase ===
  task run_phase(uvm_phase phase);
    forever begin
      my_transaction tr;
      tr = my_transaction::type_id::create("tr", this);
      assert(tr.randomize());
      mon_ap.write(tr);
    end
  endtask
endclass

// === Scoreboard 1 ===
// === Checks field-level accuracy ===
class scoreboard_field_accuracy extends uvm_scoreboard;
  `uvm_component_utils(scoreboard_field_accuracy)

  uvm_analysis_imp #(my_transaction, scoreboard_field_accuracy) imp;
  function new(string name, uvm_component parent);
    super.new(name, parent);
    imp = new("imp", this);
  endfunction

// === Write function checks expected and actual field values ===
  function void write(my_transaction tr);
    
// === Compare expected vs actual ===
    if (tr.expected_data !== tr.actual_data)
      `uvm_error("scoreboard_field_accuracy", "Mismatch detected") 
      else 
        `uvm_info("scoreboard_field_accuracy", "Match", UVM_MEDIUM)
  endfunction

// == Report Phase ===
  function void report_phase(uvm_phase phase);
    `uvm_info("SCOREBOARD_FIELD", $sformatf("Transaction:%s", convert2string()), UVM_NONE);
  endfunction
endclass

// === Scoreboard 2 ===
// === Sequence-order checking ===
class scoreboard_order_check extends uvm_scoreboard;
  `uvm_component_utils(scoreboard_order_check)

  uvm_analysis_imp #(my_transaction, scoreboard_order_check) imp;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
    imp = new("imp", this);
  endfunction

// === Write function receives transactions ===
  function void write(my_transaction tr);
    
// === Compare expected vs actual ===
    if (tr.expected_data !== tr.actual_data)
      `uvm_error("scoreboard_order_check", "Mismatch detected") 
      else 
        `uvm_info("scoreboard_order_check", "Match", UVM_MEDIUM) 
  endfunction

// === Report Phase
  function void report_phase(uvm_phase phase);
    `uvm_error("SCOREBOARD_ORDER", $sformatf("Transaction: %0d", convert2string()), UVM_LOW);
  endfunction
endclass

// === Environment Class ===
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)

  my_monitor mon;
  scoreboard_field_accuracy  scb_fields;
  scoreboard_order_check     scb_order;

// === Build Phase ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon = my_monitor::type_id::create("mon", this);
    scb_fields = scoreboard_field_accuracy::type_id::create("scb_fields", this);
    scb_order  = scoreboard_order_check::type_id::create("scb_order",  this);
  endfunction

// === Connect Phase ===
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    mon.mon_ap.connect(scb_fields.imp);
    mon.mon_ap.connect(scb_order.imp);
  endfunction
endclass
