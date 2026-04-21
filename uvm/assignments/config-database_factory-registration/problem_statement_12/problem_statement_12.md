# Problem 12: Use a Configuration Object to Conditionally Build Environment Subcomponents

## Problem Statement:

Implement a **configuration object** class such as **`env_config`** that includes boolean fields like:

- **`enable_scoreboard`**
- **`enable_coverage`**

Pass this object from the **test** to the **environment** using **`uvm_config_db`**.

- The **test** should create and configure the `env_config` object
- The **environment** should retrieve it using **`uvm_config_db`**
- In the environment’s **`build_phase`**, use the config fields to **conditionally construct subcomponents**

## Status:
⚠️ Partially Solved

## Note:
The configuration object is defined and passed through `uvm_config_db`, but the current snippet does not yet show:
- actual values assigned to `enable_scoreboard` and `enable_coverage`
- conditional construction of scoreboard and coverage components in `build_phase`

# Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// === Environment Configuration Object ===
class env_config extends uvm_object;
  `uvm_object_utils(env_config)
  
  bit enable_scoreboard;     // Controls whether scoreboard should be built
  bit enable_coverage;       // Controls whether coverage collector should be built
  
  function new(string name="env_config"); 
    super.new(name); 
  endfunction
endclass

// === Scoreboard Component ===
class my_scoreboard extends uvm_component;
  `uvm_component_utils(my_scoreboard)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

// === Coverage Component ===
class my_coverage extends uvm_component;
  `uvm_component_utils(my_coverage)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass

// === Environment Class ===
class my_env extends uvm_env;
  `uvm_component_utils(my_env)
  
  env_config cfg;  
  my_scoreboard scb;
  my_coverage   cov

  function new(string name, uvm_component parent);
    super.new(name, parent); 
  endfunction

// === Build Phase ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    uvm_config_db#(env_config)::get(this, "", "env_cfg", cfg);

// === Conditionally build scoreboard ===   
    if (cfg.enable_scoreboard) begin     
      scb = my_scoreboard::type_id::create("scb", this);   
      `uvm_info("ENV", "Scoreboard is enabled and created", UVM_LOW) 
    end

// === Conditionally build coverage ===   
    if (cfg.enable_coverage) begin    
      cov = my_coverage::type_id::create("cov", this);    
      `uvm_info("ENV", "Coverage is enabled and created", UVM_LOW)
    end
  endfunction
endclass

// === Test Class ===
class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  my_env env;

// === Build Phase ===
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_config cfg = env_config::type_id::create("env_cfg");
    
// === Set config values ===  
    cfg.enable_scoreboard = 1;
    cfg.enable_coverage   = 1;
    
    uvm_config_db#(env_config)::set(this, "env", "env_cfg", cfg);
    env = my_env::type_id::create("env", this);
  endfunction
endclass

// === Top Module ===
module top;
  initial run_test("my_test");
endmodule
