# Problem 10: Override a Scoreboard Using `set_type_override_by_name()`

## Problem Statement:

Use the **UVM factory** to register and override a **scoreboard implementation** using **`set_type_override_by_name()`**.

- Register the base scoreboard and derived scoreboard with the factory
- Override the base scoreboard using **`set_type_override_by_name()`**
- Print factory overrides before simulation
- Confirm that the mapping was registered

----

# Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// Base Scoreboard 
class my_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(my_scoreboard)
  
  function new(string n, uvm_component p); 
    super.new(n, p); 
  endfunction

  // Build phase prints the actual scoreboard type created at runtime 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Scoreboard", $sformatf("Built %s (%s)", get_type_name(), get_full_name()), UVM_LOW)
  endfunction
endclass

// Derived Scoreboard 
class derived_scoreboard extends my_scoreboard;
  `uvm_component_utils(derived_scoreboard)
  
  function new(string n, uvm_component p); 
    super.new(n,p); 
  endfunction

  // Build phase prints the actual scoreboard type created at runtime 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Scoreboard", $sformatf("Built %s (%s)", get_type_name(), get_full_name()), UVM_LOW)
  endfunction
endclass

// Environment Class 
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
  
 my_scoreboard scb;  

  // Build phase creates scoreboard using factory 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    scb = my_scoreboard::type_id::create("scb", this);
  endfunction
endclass

// Test Class 
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  my_environment env;

  // Build phase 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Override my_scoreboard with derived_scoreboard using type names 
    // Factory overrides must be set before object creation 
    uvm_factory::get().set_type_override_by_name("my_scoreboard", "derived_scoreboard");  
    env = my_environment::type_id::create("env", this);
  endfunction

  // Start of simulation phase prints factory override information 
  function void start_of_simulation_phase(uvm_phase phase);
    `uvm_info("FACTORY", "=== Factory overrides before run ===", UVM_NONE)
    uvm_factory::get().print();     // Prints factory registration and overrides
  endfunction
endclass

// Top Module 
module top;
  initial run_test("my_test");
endmodule
```
