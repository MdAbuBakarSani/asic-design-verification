# Problem 05: Pass a Virtual Interface from Top Module to Driver Using `uvm_config_db`

## Problem Statement:

Use **`uvm_config_db`** to pass a **virtual interface** from the **top module** to the **driver class**.

- Bind the virtual interface in the **testbench**
- Retrieve it in the driver’s **`build_phase`**
- Validate the connection using **`$display`**

-------

# Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// === Interface Definition ===
 interface my_vif;
   logic clk;      // Clock signal
   logic rst_n;    // Active-low reset signal
 endinterface

// === Driver Class === 
class my_driver extends uvm_driver#(uvm_sequence_item);
  `uvm_component_utils(my_driver)
  
  virtual my_vif vif;    // Virtual interface handle

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

// === Build phase retrieves virtual interface from config_db ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual my_vif)::get(this, "", "vif", vif))
      `uvm_fatal("VIF", "Virtual interface not set");
    else
      $display("Interface connected: %m");
  endfunction
endclass

// === Environment Class ===
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
  my_driver drv;

// === Build phase creates driver ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = my_driver::type_id::create("drv", this);
  endfunction
endclass

// === Test Class ===
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  my_environment env;

// === Build phase creates environment ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = my_environment::type_id::create("env", this);
  endfunction
endclass

// === Top Module ===
module top;
  my_vif my_vif_port();   // Instantiates interface


  initial begin
// === Pass virtual interface from top module to UVM testbench ===
    uvm_config_db#(virtual my_vif)::set(null, "*", "vif", my_vif_port);

// === Start UVM test ===
    run_test("my_test");
  end
endmodule
