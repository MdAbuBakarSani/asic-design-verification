# Problem 03: Subscribe to a Monitor’s `analysis_port` and Broadcast to Multiple Analysis Components

## Problem Statement:

Create a component such as a **coverage collector** that subscribes to the **monitor's `analysis_port`**.

- The component should log transactions that match a particular field value
- For example, log transactions when **`op_code == 3`**
- Demonstrate that a **single monitor** can broadcast transactions to **multiple analysis components**
- One possible setup is:
  - **scoreboard**
  - **coverage collector**

----

# Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// === Coverage Collector ===
class coverage_collector extends uvm_subscriber#(my_transaction);
  `uvm_component_utils(coverage_collector)

// === Covergroup to collect coverage for op_code field ===
  covergroup opcode_cov;
    coverpoint op_code {bins sel = {3};}
  endgroup
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
    opcode_cov = new();
  endfunction

// === Write function receives transactions from monitor through analysis connection ===
  function void write (my_transaction tr);
    if (tr.op_code == 3) begin
      opcode_cov.sample();
      `uvm_info("Covergroup", $sformatf("Sampled transaction :%s", tr.convert2string()), UVM_LOW);
    end
  endfunction
endclass

// === Environment Class ===
class my_environment extends uvm_env;
  `uvm_component_utils(my_environment)
  
  my_monitor mon;
  my_scoreboard scb;
  coverage_collector cov;
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction

// === Build Phase ===
  function void build_phase (uvm_phase phase);
    super.build_phase (phase);
    mon = my_monitor::type_id::create("mon", this);
    scb = my_scoreboard::type_id::create("scb", this);
    cov = coverage_collector::type_id::create("cov", this);
  endfunction

// === Connect Phase ===
  function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    mon.mon_ap.connect(scb.imp);    // Connects monitor to scoreboard
    mon.mon_ap.connect(cov.analysis_export);    // Connects monitor to coverage collector
  endfunction
endclass
