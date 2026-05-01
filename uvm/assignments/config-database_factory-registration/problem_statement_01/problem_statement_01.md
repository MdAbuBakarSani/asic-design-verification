# Problem 01: Pass a Configurable Integer from Test to Driver Using `uvm_config_db`

## Problem Statement:

Use **`uvm_config_db#(int)::set()`** in the **test class** to pass a configurable variable such as **`int num_packets`** to the **driver**.

- Set `num_packets` in the **test class**
- Retrieve it inside the **driver** using **`uvm_config_db#(int)::get()`**
- Generate that many transactions in the driver’s **`run_phase`**

-----

## Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// Driver Class 
class my_driver extends uvm_driver#(my_transaction);
  `uvm_component_utils(my_driver)
  int num_packets;    // Stores number of packets to generate
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  // Build phase retrieves num_packets from config_db 
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);  
    uvm_config_db#(int)::get(this, " ", "num_packets", 12);
  endfunction

  // Run phase generates num_packets number of transactions
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    repeat (num_packets) begin
      my_transaction tr;
      tr = my_transaction::type_id::create("tr", this);
      assert(tr.randomize());
      `uvm_info("Driver", $sformatf("Driving: %s", tr.convert2string()), UVM_LOW)
    end
    phase.drop_objection(this);
  endtask
endclass

// Environment Class 
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
  my_driver drv;

  function new(string name, uvm_component parent); 
    super.new(name,parent); 
  endfunction

  // Build phase creates driver 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = my_driver::type_id::create("drv", this);
  endfunction
endclass

// Test Class 
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  my_environment env;

  function new(string name, uvm_component parent); 
    super.new(name,parent); 
  endfunction

  // Build phase sets num_packets and creates environment 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_config_db#(int)::set(this, "env.drv", "num_packets", 12);
    env = my_environment::type_id::create("env", this);
  endfunction
endclass
```
