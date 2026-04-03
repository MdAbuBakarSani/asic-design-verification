# Problem 07: Modify ALU Environment to Include Coverage Collector

## Problem Statement:

Modify the **ALU environment** to include a **coverage collector** that tracks and reports the coverage of the **opcode** field from the sequence item.

- Create a **UVM subscriber** (`opcode_coverage`) that collects **functional coverage** for the **opcode** field.
- The **`opcode_coverage`** subscriber should:
  1. **Sample** the **opcode** value for every transaction.
  2. **Print** the coverage report at the end of the simulation using the **`report_phase()`**.

---

# Solution:

The solution is implemented as follows:

```SystemVerilog

// Code your testbench here 
// or browse Examples 

`include "uvm_macros.svh" 
import uvm_pkg::*; 

// === Define the opcode_coverage class that extends uvm_subscriber ===
class opcode_coverage extends uvm_subscriber; 
  bit [2:0] opcode; 

// === Define the coverage group ===
  covergroup op_cov; 
    coverpoint opcode;    // Coverage point for the opcode field
  endgroup 

  `uvm_component_utils(opcode_coverage)     // UVM registration macro

  function new (string name, uvm_component parent); 
    super.new(name, parent); 
    op_cov = new();      // Create the coverage group
  endfunction 

// === Write function to sample opcode from the sequence item ===
  function void write (alu_sequence_item item); 
    opcode = item.opcode;     // Assign the opcode from the sequence item
    op_cov.sample();          // Sample the coverage
  endfunction 

// === Report phase to print coverage at the end of the simulation ===
  function void report_phase (uvm_phase phase); 
    op_cov.print(); 
  endfunction 
endclass
