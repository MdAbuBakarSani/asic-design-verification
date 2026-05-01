# Problem 11: Override a Base Environment with a Custom Environment Using the UVM Factory

## Problem Statement:

Create a **base environment** class and extend it as **`custom_env`**.

- Define a base environment class
- Extend it into a child class named **`custom_env`**
- Use the **UVM factory** to override the base environment with the custom environment in the **test**
- Verify during simulation that **`custom_env`** gets instantiated using **`$display`**

----

## Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// Base Environment Class 
class base_env extends uvm_env;
  `uvm_component_utils(base_env)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  // Build phase prints base environment information 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("base_env (%s)", get_full_name());
  endfunction
endclass

// Custom Environment Class 
class custom_env extends base_env;
  `uvm_component_utils(custom_env)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  // Build phase prints custom environment information 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("custom_env (%s)", get_full_name());
  endfunction
endclass

// Test Class 
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  base_env env;
 
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  // Build phase applies environment override and creates env 
  // Factory overrides must be set before object creation 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_factory::get().set_type_override_by_type(base_env::get_type(), custom_env::get_type());
    env = base_env::type_id::create("env", this);
  endfunction

  // Start of simulation phase 
  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    uvm_factory::get().print();     // Prints factory registration and overrides
  endfunction
endclass

// Top Module 
module top;
  initial run_test("my_test");
endmodule
```
