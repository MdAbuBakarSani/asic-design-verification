# Problem 09: Create a Coverage Component That Receives Transactions Using `uvm_analysis_export`

## Problem Statement:

Create a **coverage component** that receives transactions from the **monitor** using **`uvm_analysis_export`** instead of a direct **analysis imp**.

- The coverage component should use **`uvm_analysis_export`**
- The export should be connected to the monitor’s **analysis port**
- Make this connection in the **environment**
- The component should sample coverage when transactions are received

-----

## Status:
⚠️ Partially Solved

## Note:
The internal structure of the coverage component is implemented correctly, but the **environment-level connection from the monitor’s analysis port to the coverage component’s `analysis_export`** is not shown in this solution snippet.

----

# Solution:

The solution is implemented as follows:

```systemverilog


// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

class coverage_component extends uvm_component;
  `uvm_component_utils(coverage_component)

// === Analysis export used to receive transactions from outside this component ===
  uvm_analysis_export #(my_transaction) analysis_export;
  
// === Internal analysis implementation used to handle received transactions ===
  uvm_analysis_imp #(my_transaction, coverage_component) imp;

// === Covergroup used for coverage collection ===
  covergroup cg;
     // === coverpoint logic ===
  endgroup

  function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_export = new("analysis_export", this);
    imp = new("imp", this);
    cg = new();
  endfunction

// === Connect phase ===
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    analysis_export.connect(imp);     // Connects export to internal analysis implementation
  endfunction


// === This function is called when a transaction arrives through analysis_export ===
  function void write(my_transaction tr);
    cg.sample();    // coverage logic
  endfunction
endclass
