# Problem 07: Override a Driver Class Using `set_type_override_by_type()`

## Problem Statement:

Register a child class of the driver such as **`custom_driver`** using the factory override method **`set_type_override_by_type()`**.

- Create a base driver class
- Create a child driver class such as **`custom_driver`**
- Use **`set_type_override_by_type()`** to override the base driver with the child driver
- Instantiate the driver in the **environment** using the factory
- Verify at runtime that the **custom driver** is actually used

-----

## Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// === Base Driver Class ===
class my_driver extends uvm_driver#(my_transaction);
  `uvm_component_utils(my_driver)
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction

// === Build phase ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Driver", $sformatf("Built %s", get_type_name()), UVM_LOW)
  endfunction
endclass

// === Custom Driver Class ===
class custom_driver extends my_driver;
  `uvm_component_utils(custom_driver)
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction

// === Build phase ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Driver", $sformatf("Built %s", get_type_name()), UVM_LOW)
  endfunction
endclass

// === Environment Class ===
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
  my_driver drv;
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction

// === Build phase ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = my_driver::type_id::create("drv", this);
  endfunction
endclass

// === Test Class ===
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  my_environment env;
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction

// === Build phase ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

// === Override base driver type with custom driver type ===
    uvm_factory::get().set_type_override_by_type(my_driver::get_type(), custom_driver::get_type());
    env = my_environment::type_id::create("env", this);
  endfunction

// === Start of simulation phase ===
  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    uvm_factory::get().print();     // Prints factory table
  endfunction
endclass

// === Top Module ===
module top;
  initial run_test("my_test");
endmodule
