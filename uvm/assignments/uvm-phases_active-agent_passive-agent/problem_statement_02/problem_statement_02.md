# Problem 02: Modify the Environment to Make the Same Agent Configurable as Either Active or Passive

## Problem Statement:

Modify the **environment** to make the same agent configurable as either **active** or **passive** using a **config_db** field (`is_active`).

- If `is_active == UVM_ACTIVE`, instantiate the **sequencer** and **driver**.
- If `is_active == UVM_PASSIVE`, skip the sequencer and driver.
- Set the `is_active` field from the **test class**.
- Demonstrate both behaviors in two separate simulations: one for the active agent and one for the passive agent.

---

## Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here 
// or browse Examples 

`include "uvm_macros.svh" 
import uvm_pkg::*; 

// Agent Class: Can be configured as either active or passive 
class bus_agent extends uvm_agent; 
  `uvm_component_utils(bus_agent) 

  bus_sequencer seqr;     // Sequencer for active agent
  bus_driver drv;         // Driver for active agent
  bus_monitor mon;        // Monitor for both active and passive agents
  virtual bus_if vif;     // Virtual bus interface

  uvm_active_passive_enum is_active = UVM_ACTIVE;     // Field to determine if agent is active or passive

  function new (string name, uvm_component parent); 
    super.new(name, parent); 
  endfunction 

  // Build phase: Configuring the agent as active or passive 
  function void build_phase (uvm_phase phase); 
    super.build_phase(phase); 

    // Get virtual interface (vif) from config_db 
    if(!uvm_config_db#(virtual bus_if)::get(this, "", "vif", vif)) 
      `uvm_fatal("No Virtual Interface", "bus agent") 

      // Get the active/passive configuration from the config_db 
      void'(uvm_config_db#(uvm_active_passive_enum)::(this, "", "is_active", is_active)); 

    // Instantiate the monitor, which is common for both active and passive agents 
    mon = bus_monitor::type_id::create("mon", this); 
    uvm_config_db#(virtual bus_if)::set(this, "mon", "vif", vif); 

    // If is_active == UVM_ACTIVE, instantiate the sequencer and driver 
    if(is_active == UVM_ACTIVE) begin 
      seqr = bus_sequencer::type_id::create("seqr", this); 
      drv = bus_driver::type_id::create("drv", this);    
      uvm_config_db#(virtual bus_if)::set(this, "drv", "vif", vif); 
    end 
  endfunction 

  // Connect phase: Connecting sequencer to driver if active 
  function void connect_phase (uvm_phase phase); 
    super.connect_phase (phase); 

    // If the agent is active, connect the driver and sequencer 
    if(is_active == UVM_ACTIVE) begin 
      drv.seq_item_port.connect(seqr.seq_item_export); 
    end 
  endfunction 
endclass 

// Environment  Class 
class bus_environment extends uvm_env; 
  `uvm_component_utils(bus_environment) 

  bus_agent agt; 

  function new (string name, uvm_component parent); 
    super.new(name, parent); 
  endfunction 

  // Build phase: Instantiating the bus agent 
  function void build_phase (uvm_phase phase); 
    super.build_phase(phase); 
    agt = bus_agent::type_id::create("agt", this); 
  endfunction 
endclass 
 
// Test Active  
class bus_active_test extends uvm_test; 
  `uvm_component_utils(bus_active_test) 

  bus_environment env; 

  function new (string name, uvm_component parent); 
    super.new(name, parent); 
  endfunction 

  // Build phase: Set the agent to active and create the environment  
  function void build_phase (uvm_phase phase); 
    super.build_phase(phase); 
    
    uvm_config_db#(uvm_active_passive_enum)::set(this, UVM_ACTIVE); 
    env = bus_environment::type_id::create("env", this); 
  endfunction 

  // Run phase: Start the sequence from the active agent 
  task run_phase (uvm_phase phase); 
    bus_sequencer seqr; 
    phase.raise_objection(this); 
    seq = bus_sequence::type_id::create("seq"); 
    seq.start(env.agt.seqr); 
    phase.drop_objection(this); 
  endtask 
endclass 

// Test Passive 
class bus_passive_test extends uvm_test; 
  `uvm_component_utils(bus_passive_test) 

  bus_environment env; 

  function new(string name, uvm_component parent); 
    super.new(name, parent); 
  endfunction 

  // Build phase: Set the agent to passive and create the environment
  function void build_phase(uvm_phase phase); 
    super.build_phase(phase); 

    uvm_config_db#(uvm_active_passive_enum)::set(this, "env.agt", "is_active", UVM_PASSIVE); 
    env = bus_environment::type_id::create("env", this); 
  endfunction 

  // Run phase: No sequence is started here as the passive agent has no sequencer/driver 
  task run_phase (uvm_phase phase); 
    phase.raise_objection (this); 
    
    // Passive agent doesn't start a sequence, it only observes 
    phase.drop_objection (this); 
  endtask 
endclass
```
