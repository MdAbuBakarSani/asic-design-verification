// Code your testbench here 
// or browse Examples 

`include "uvm_macros.svh" 
import uvm_pkg::*;

// === Base Agent Class ===
class base_agent extends uvm_agent; 
  `uvm_component_utils(base_agent) 

  uvm_active_passive_enum is_active;    // Flag to indicate active or passive mode

  function new(string name, uvm_component parent); 
    super.new(name, parent); 
  endfunction 
endclass 

// === Active Agent Class ===
class active_agent extends base_agent; 
  `uvm_component_utils(active_agent) 

  base_driver drv; 
  base_sequencer seqr; 
  base_monitor mon; 

  function new (string name, uvm_component parent); 
    super.new(name, parent); 
    is_active = UVM_ACTIVE;      // Marks this child agent as active
  endfunction 

// === Build Phase: create all required active components ===
  function void build_phase (uvm_phase phase); 
    super.build_phase(phase); 
    drv = base_driver::type_id::create("drv", this); 
    seqr = base_sequencer::type_id::create("seqr", this); 
    mon = base_monitor::type_id::create("mon", this); 
  endfunction 

// === Run phase: shows active agent behavior ===
  task run_phase (uvm_phase phase); 
    `uvm_info("Active Agent: ", $sformatf("%s: run_phase executing (driving transactions)", get_full_name()), UVM_LOW); 
  endtask 
endclass 

// === Passive Agent Class ===
class passive_agent extends base_agent; 
  `uvm_component_utils(passive_agent) 

  base_monitor mon; 

  function new (string name, uvm_component parent); 
    super.new(name, parent); 
    is_active = UVM_PASSIVE;   // Marks this child agent as passive
  endfunction 

// === Build phase: create only the monitor ===
  function void build_phase (uvm_phase phase); 
    super.build_phase(phase); 
    mon = base_monitor::type_id::create("mon", this); 
  endfunction 

// === Run phase: shows passive agent behavior ===
  task run_phase (uvm_phase phasae); 
    `uvm_info("Passive Agent: ", $sformatf("%s: run_phase executing (observing transactions)", get_full_name()), UVM_LOW); 
  endtask 
endclass 

// === Environment Class ===
class base_environment extends uvm_env; 
  `uvm_component_utils(base_environment) 

  uvm_component agt; 

  string agent_type = "active";   // Default agent type

  function new (string name, uvm_component parent); 
    super.new(name, parent); 
  endfunction 

// === Build phase: instantiate active or passive agent based on config setting ===
  function void build_phase (uvm_phase phase); 
    super.build_phase(phase); 

// === Gets agent type from config_db ===
    `void(uvm_config_db#(string)::get(this, "", "agent_type", agent_type)); 

// === Instantiates active agent if selected ===
    if(agent_type == "active") begin 
      agt = active_agent::type_id::create("agt", this); 
      `uvm_info("Environment", "Instantiated Active Agent", UVM_LOW); 
    end 
    
    else begin 

// === Instantiates passive agent otherwise ===
      agt = passive_agent::type_id::create("agt", this); 
      `uvm_info("Environment", "Instantiated Passive Agent", UVM_LOW); 
    end 
  endfunction 
endclass 

// === Test Class ===
class agent_select_test extends uvm_test; 
  `uvm_component_utils(agent_select_test) 

  base_environment env; 
  function new (string name, uvm_component parent); 
    super.new(name, parent); 
  endfunction 

// === Build phase: set config and create environment ===
  function void build_phase (uvm_phase phase); 
    super.build_phase(phase); 

// === Choose one of the following settings from testbench === 
    uvm_config_db#(string)::set(this, "env", "agent_type", "active"); 
    // uvm_config_db#(string)::set(this, "env", "agent_type", "passive"); 

    env = base_environment::type_id::create("env", this); 
  endfunction 

// === Run Phase ===
  task run_phase (uvm_phase phase); 
    phase.raise_objection(this); 

// === If active agent is selected, a sequence could be started here ===
    
    phase.drop_objection(this); 
  endtask 
endclass
