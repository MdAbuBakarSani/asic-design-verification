// Code your testbench here 
// or browse Examples 

`include "uvm_macros.svh" 
import uvm_pkg::*;

class bus_env extends uvm_env; 
  `uvm_component_utils(bus_env)  

  active_agent act_agt; 
  passive_agent psv_agt; 
  bus_coverage_collector cov; 

  function new (string name, uvm_component parent); 
    super.new(name, parent); 
  endfunction 

// === Build phase ===
  function void build_phase (uvm_phase phase); 
    super.build_phase (phase); 
    act_agt = active_agent::type_id::create("act_agt", this); 
    psv_agt = passive_agent::type_id::create("psv_agt", this); 
    cov = bus_coverage_collector::type_id::create("cov", this); 
  endfunction 

// === Connect phase ===
  function void connect_phase(uvm_phase phase); 
    super.connect_phase(phase); 

// === Active agent connection ===
    act_agt.drv.seq_item_port.connect(act_agt.seqr.seq_item_export); 

// === Passive agent connection ===
    psv_agt.mon.mon_ap.connect(cov.analysis_export); 
  endfunction 
endclass
