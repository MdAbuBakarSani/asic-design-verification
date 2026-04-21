# Problem 04: Create a Coverage Collector with a Configurable Minimum Opcode Threshold

## Problem Statement:

Create a **coverage collector** that takes a config parameter for the minimum opcode value such as **`min_opcode`**.

- The value of **`min_opcode`** should be configurable using **`uvm_config_db`**
- The coverage collector should filter transactions based on this threshold
- Transactions with opcode values below **`min_opcode`** should be ignored
- Transactions meeting the threshold should be processed by the coverage collector

-------

# Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

class coverage_collector extends uvm_subscriber#(my_transaction);
  `uvm_component_utils(coverage_collector)

  int min_opcode;      // Stores the minimum opcode threshold

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

// === Build phase retrieves min_opcode from config_db ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

// === Get min_opcode from config_db ===
// === If not found, assign default value 0 ===
    uvm_config_db#(int)::get(this, "", "min_opcode", min_opcode);
     min_opcode = 0;   // default
  endfunction

// === Write function filters transactions based on min_opcode ===
  function void write(my_transaction tr);
    if (tr.op_code >= min_opcode) 
      `uvm_info("Coverage", $sformatf("Sampling op: %0d | min_op : %0d", tr.op_code, min_opcode), UVM_LOW)   // Logs accepted transaction
  endfunction
endclass
