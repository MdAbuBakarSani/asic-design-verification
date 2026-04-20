# Problem 07: Collect Transactions in a Passive Agent Monitor and Print Them in `extract_phase`

## Problem Statement:

Within a **passive agent monitor**, collect all observed transactions into a **queue**.

- Store all observed transactions during simulation
- Print all collected transactions in the **`extract_phase`**
- Demonstrate how **passive agents** can be used for **data logging** and **post-processing**
- Ensure that the passive agent does this **without interfering with DUT behavior**

-----

# Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here 
// or browse Examples 

`include "uvm_macros.svh" 
import uvm_pkg::*;

// === Monitor Class ===
class bus_monitor extends uvm_monitor; 
  `uvm_component_utils(bus_monitor) 

  virtual bus_if vif;    
  uvm_analysis_port#(bus_transaction)mon_ap; 

// === Queue used to store all observed transactions until extract_phase === 
  bus_transaction collected_transaction [$]; 
  
  function new (string name, uvm_component parent); 
    super.new(name, parent); 
    mon_ap = new("mon_ap", this); 
  endfunction 

// === Build phase to get the virtual interface from config_db ===
  function void build_phase (uvm_phase phase); 
    super.build_phase(phase); 

// === Gets the virtual interface from the UVM configuration database ===
    if(!uvm_config_db#(virtual bus_if)::get(this, "", "vif", vif))  
      `uvm_fatal("No Virtual Interface", "Monitor") 
      endfunction 

// === Run phase continuously observes bus activity ===
  task run_phase(uvm_phase phase); 
    bus_transaction tr; 

    forever begin 
      @(posedge vif.clk); 

      .................. 
      ..................  
      .................. 

      collected_transaction.push_back(tr); 
      mon_ap.write(tr);
    end 
  endtask 

// === Extract Phase ===
    function void extract_phase (uvm_phase phase); 
      super.extract_phase(phase); 

      foreach (collected_transaction[i]) begin 
        $display("Monitor => Extract Phase: %p", collected_transaction[i]); 
      end 
  endfunction 
endclass

