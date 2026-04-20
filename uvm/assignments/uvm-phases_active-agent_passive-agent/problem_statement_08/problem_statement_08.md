# Problem 08: Create a Testbench with Two Active Agents and One Passive Agent

## Problem Statement:

Create a **UVM testbench** with:

- **Two active agents**
- **One passive agent**
- Each agent works on a **separate interface** such as:
  - **instruction bus**
  - **data bus**

Control all agent types from the **test class** using **`uvm_config_db`**.

Validate that:

- Only the **active agents** generate traffic
- The **passive agent** remains **observational**

----

## Status:
⚠️ Partially Solved
----

## Note:
The test-side `uvm_config_db` setup is implemented, but the full environment and validation code are not shown here.
----

# Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here 
// or browse Examples 

`include "uvm_macros.svh" 
import uvm_pkg::*;
