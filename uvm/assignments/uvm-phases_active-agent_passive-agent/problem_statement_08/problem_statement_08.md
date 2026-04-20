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

// === In test class ===

// === Set instruction agent as ACTIVE ===
uvm_config_db#(uvm_active_passive_enum)::set(
  this,                       // Current component
  "env.instr_agent",          // Path to instruction agent
  "is_active",                // Field name in config_db
  UVM_ACTIVE                  // Set instruction agent to active mode
);

// === Set data agent as ACTIVE ===
uvm_config_db#(uvm_active_passive_enum)::set(
  this,                       // Current component
  "env.data_agent",           // Path to data agent
  "is_active",                // Field name in config_db
  UVM_ACTIVE                  // Set data agent to active mode
);

// === Set monitor agent as PASSIVE ===
uvm_config_db#(uvm_active_passive_enum)::set(
  this,                       // Current component
  "env.mon_agent",            // Path to passive monitor agent
  "is_active",                // Field name in config_db
  UVM_PASSIVE                 // Set monitor agent to passive mode
);
