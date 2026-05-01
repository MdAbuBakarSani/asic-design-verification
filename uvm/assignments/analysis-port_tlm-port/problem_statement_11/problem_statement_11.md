# Problem 11: Design a Shared Scoreboard That Accepts Transactions from Two Different Monitors

## Problem Statement:

Design a **shared scoreboard** component that accepts transactions from **two different types of monitors** such as:

- **read monitor**
- **write monitor**

Use **two `uvm_analysis_imp`** connections in the scoreboard.

- One input should receive transactions from the **read monitor**
- The other input should receive transactions from the **write monitor**
- Use **`get_type_name()`** or **`get_full_name()`** to tag and differentiate the source of each transaction in the logs

-----

## Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

class shared_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(shared_scoreboard)

  // Separate analysis implementation ports for read and write monitor streams 
  uvm_analysis_imp#(my_transaction, shared_scoreboard)read_imp;
  uvm_analysis_imp#(my_transaction, shared_scoreboard)write_imp;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
    read_imp = new("read_imp", this);
    write_imp = new("write_imp", this);
  endfunction

  // Handles transactions coming from read monitor 
  function void write(my_transaction tr);
    $display("[Read] %s: %p", get_full_name(), tr);
  endfunction

  // Handles transactions coming from write monitor 
  function void write_write_imp(my_transaction tr);
    $display("[Write] %s: %p", get_full_name(), tr);
  endfunction
endclass
```
