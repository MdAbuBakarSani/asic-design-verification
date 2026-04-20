# Problem 05: Implement a Scoreboard That Waits Until `check_phase` to Evaluate Results

## Problem Statement:

Implement a **scoreboard** that waits until **`check_phase`** to evaluate results collected by the **passive agent monitor**.

- The **scoreboard** should collect transactions from the passive agent monitor.
- It should **not perform any checks during `run_phase`**.
- All checking should happen only in **`check_phase`**.
- This should demonstrate proper **UVM phase separation**.

----

## Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"   
import uvm_pkg::*; 

// === Scoreboard Class ===
class bus_scoreboard extends uvm_scoreboard; 
  `uvm_component_utils(bus_scoreboard) 

// === Analysis implementation port used to receive transactions from the monitor ===
  uvm_analysis_imp#(bus_transaction, bus_scoreboard)mon_ap; 

// === Queue to store transactions until check_phase starts ===
  bus_transaction collected_transaction [$]; 

  function new (string name, uvm_component parent); 
    super.new(name, parent); 
    mon_ap = new("mon_ap", this); 
  endfunction 

// === This function is called whenever the monitor sends a transaction ===
  function void write (bus_transaction tr); 

// === Logs that transaction was received ===
    `uvm_info ("Scoreboard", $sformatf("Received transaction in run phase: %s", tr.covert2string()), UVM_LOW) 

// === Stores transaction for checking later ===
    collected_transaction.push_back(tr); 
  endfunction 

// === Check Phase ===
  function void check_phase (uvm_phase phase); 
    super.check_phase(phase); 

    foreach (collected_transaction[i]) 
      $display("Scoreboard  => Check Phase => Transaction checked: %p", collected_transaction[i]);
  endfunction 
endclass
