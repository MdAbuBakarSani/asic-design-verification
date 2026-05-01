// Code your testbench here 
// or browse Examples 

`include "uvm_macros.svh" 
import uvm_pkg::*;

// In test class 

// Set instruction agent as ACTIVE 
uvm_config_db#(uvm_active_passive_enum)::set(
  this,                       // Current component
  "env.instr_agent",          // Path to instruction agent
  "is_active",                // Field name in config_db
  UVM_ACTIVE                  // Set instruction agent to active mode
);

// Set data agent as ACTIVE 
uvm_config_db#(uvm_active_passive_enum)::set(
  this,                       // Current component
  "env.data_agent",           // Path to data agent
  "is_active",                // Field name in config_db
  UVM_ACTIVE                  // Set data agent to active mode
);

// Set monitor agent as PASSIVE 
uvm_config_db#(uvm_active_passive_enum)::set(
  this,                       // Current component
  "env.mon_agent",            // Path to passive monitor agent
  "is_active",                // Field name in config_db
  UVM_PASSIVE                 // Set monitor agent to passive mode
);
