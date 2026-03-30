# Problem 1: UVM Agent for 4-bit ALU

## Problem Statement:
Create a **UVM agent** for a **4-bit ALU**. The agent must include:
1. A **driver** to send transactions from the **sequencer** to the **DUT** (Device Under Test).
2. A **monitor** to capture **DUT inputs** and **outputs**.
3. An **is_active flag** to control active/passive behavior of the agent.

### Requirements:
- Design a simple **4-bit ALU** agent.
- **Driver** must interface with the sequencer to send data.
- **Monitor** must capture DUT inputs and outputs.
- Implement the agent to be **active** (performing tasks) or **passive** (only monitoring), controlled by the `is_active` flag.


# Solution: UVM Agent for 4-bit ALU

```
package alu_pkg; 
  `include "uvm_macros.svh" 
  import uvm_pkg::*; 

--- ALU Sequencer ---
class alu_sequencer extends uvm_sequencer#(uvm_sequence_item); 
  `uvm_component_utils(alu_sequencer) 
  function new(string name, uvm_component parent);  
    super.new(name, parent);  
  endfunction 
endclass 

  ```
class alu_driver extends uvm_driver#(uvm_sequence_item); 
  `uvm_component_utils(alu_driver) 
  function new(string name, uvm_component parent);  
    super.new(name, parent);  
  endfunction 
endclass 

```
class alu_monitor extends uvm_component; 
  `uvm_component_utils(alu_monitor) 
  function new(string name, uvm_component parent);  
    super.new(name, parent);  
  endfunction 
endclass 

  ```
class alu_agent extends uvm_agent; 
  `uvm_component_utils(alu_agent) 
  alu_sequencer seqr; 
  alu_driver drv; 
  alu_monitor mon; 
  function new(string name = "alu_agent", uvm_component parent = null); 
    super.new(name, parent); 
  endfunction 

  function void build_phase (uvm_phase phase); 
    super.build_phase(phase); 
   
    if(!uvm_config_db #(uvm_active_passive_enum)::get(this, "", "is_active", is_active)) 
      is_active = UVM_ACTIVE; 
    mon = alu_monitor::type_id::create("mon", this); 
    
    if (is_active == UVM_ACTIVE) begin 
      seqr = alu_sequencer::type_id::create("seqr", this); 
      drv = alu_driver::type_id::create("drv", this); 
    end 
  endfunction 
  
  function void connect_phase(uvm_phase phase); 
    super.connect_phase(phase); 
    if(is_active == UVM_ACTIVE) 
      drv.seq_item_port.connect (seqr.seq_item_export); 
  endfunction 
endclass 
endpackage  
