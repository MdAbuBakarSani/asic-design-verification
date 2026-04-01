# Problem 01: Design a UVM Environment with One Active Agent and One Passive Agent for a Simple Bus Interface

## Problem Statement:

Design a **UVM environment** with:

- **One active agent** and **one passive agent** for a simple bus interface.
  
The active agent should include:
- A **sequencer** and **driver** to generate stimulus.

The passive agent should include:
- A **monitor** that observes transactions.

Simulate a few **bus write operations** and confirm that:
- Only the **active agent** drives the **DUT**.
- Both agents observe data.

----

# Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here 
// or browse Examples 

`include "uvm_macros.svh" 
import uvm_pkg::*; 

// Active Agent: Generates stimulus for the DUT
class bus_active_agent extends uvm_agent; 
  `uvm_component_utils(bus_active_agent) 
  
  bus_driver drv; 
  bus_monitor mon; 
  bus_sequencer seqr; 
  virtual bus_if vif; 

  function new (string name, uvm_component parent); 
    super.new(name, parent); 
  endfunction 

  // Build phase for the active agent
  function void build_phase (uvm_phase phase); 
    super.build_phase(phase); 

    if (!uvm_config_db#(virtual bus_if)::get(this, "", "vif", vif)) 
      `uvm_fatal("No Virtual Interface", "bus_active_agent") 

      drv = bus_driver::type_id::create("drv", this); 
    mon = bus_monitor::type_id::create("mon", this); 
    seqr = bus_sequencer::type_id::create("seq", this);  

    uvm_config_db#(virtual bus_if)::set(this, "drv", "vif", vif); 
    uvm_config_db#(virtual bus_if)::set(this, "mon", "vif", vif); 
  endfunction 

  // Connect phase for the active agent
  function void connect_phase (uvm_phase phase); 
    super.connect_phase(phase); 
    drv.seq_item_port.connect(seqr.seq_item_export); 
  endfunction 
endclass 

// Passive Agent: Observes transactions
class bus_passive_agent extends uvm_agent; 
  `uvm_component_utils(bus_passive_agent) 
 
  bus_monitor mon; 
  virtual bus_if vif; 

  function new (string name, uvm_component parent); 
    super.new(name, parent); 
  endfunction 

  // Build phase for the passive agent
  function void build_phase (uvm_phase phase); 
    super.build_phase(phase); 

    if (!uvm_config_db#(virtual bus_if)::get(this, "", "vif", vif)) 
      `uvm_fatal("No Virtual Interface", "bus_passive_agent") 

      mon = bus_monitor::type_id::create("mon", this); 
    uvm_config_db#(virtual bus_if)::set(this, "mon", "vif", vif); 
  endfunction 
endclass
