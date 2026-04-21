// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// === Agent Class ===
class my_agent extends uvm_agent;
  `uvm_component_utils(my_agent)

  my_driver drv;
  my_sequencer seqr;
  my_monitor mon;
  uvm_active_passive_enum is_active;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

// === Build phase: creates components based on is_active value ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

// === Get is_active value from config_db ===
// === If not found, default to UVM_ACTIVE ===
    if (!uvm_config_db#(uvm_active_passive_enum)::get(this, "", "is_active", is_active))
      is_active = UVM_ACTIVE;   // default

// === If agent is active, create driver and sequencer ===
    if (is_active == UVM_ACTIVE) begin
      drv = my_driver::type_id::create("drv", this);
      seqr = my_sequencer::type_id::create("seqr", this);
    end

// === Monitor is created in both active and passive modes ===
    mon = uvm_monitor::type_id::create("mon", this);
  endfunction
endclass

// === Environment Class ===
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
  my_agent agt;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

// === Build phase: passes is_active flag to agent and creates agent ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    uvm_config_db#(uvm_active_passive_enum)::set(this, "agt", "is_active", UVM_ACTIVE);
    agt = my_agent::type_id::create("agt", this);
  endfunction
endclass


