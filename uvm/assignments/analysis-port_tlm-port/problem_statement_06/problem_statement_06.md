# Problem 06: Build a Passive Agent with a Monitor and Connect It to a Statistics Collector

## Problem Statement:

Build a **passive agent** with a **monitor** that sends data using **`uvm_analysis_port`**.

- The **monitor** should send observed transactions through **`uvm_analysis_port`**
- Connect the monitor to a component that acts as a **statistics collector**
- The **statistics collector** should track the number of transactions for each **opcode**

----

## Status:
⚠️ Partially Solved


## Note:
The **statistics collector** is implemented correctly, but the **passive agent**, **monitor**, and the **analysis port connection** are not shown in this solution snippet.

----

## Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

class statistics_collector extends uvm_component;
  `uvm_component_utils(statistics_collector)

  // Analysis implementation port used to receive transactions from the monitor 
  uvm_analysis_imp #(my_transaction, statistics_collector) imp;

  // Array used to count how many times each opcode appears 
  int unsigned opcode_count[16];

  function new(string name, uvm_component parent);
    super.new(name, parent);
    imp = new("imp", this);
  endfunction

  // This function is called whenever a transaction is received 
  function void write(my_transaction tr);
    opcode_count[tr.op_code]++;
  endfunction

  // Report phase prints opcode statistics at the end of simulation 
  function void report_phase(uvm_phase phase);
    int i;
    foreach (opcode_count[i]) begin
      if (opcode_count[i] != 0)
        `uvm_info("STATS", $sformatf("opcode %0d : count %0d ", i, opcode_count[i]), UVM_NONE)
    end
  endfunction
endclass
```
