
// Code your testbench here 

// or browse Examples 

`include "uvm_macros.svh" 

import uvm_pkg::*; 

class bus_agent extends uvm_agent; 

  `uvm_component_utils(bus_agent) 

  bus_sequencer seqr; 

  bus_driver drv; 

  bus_monitor mon; 

  virtual bus_if vif; 

  uvm_active_passive_enum is_active = UVM_ACTIVE; 

  function new (string name, uvm_component parent); 

    super.new(name, parent); 

  endfunction 

  function void build_phase (uvm_phase phase); 

    super.build_phase(phase); 

    // get vif 

    if(!uvm_config_db#(virtual bus_if)::get(this, "", "vif", vif)) 

      `uvm_fatal("No Virtual Interface", "bus agent") 

      // get active/passive from config_db 

      void'(uvm_config_db#(uvm_active_passive_enum)::(this, "", "is_active", is_active)); 

    mon = bus_monitor::type_id::create("mon", this); 

    uvm_config_db#(virtual bus_if)::set(this, "mon", "vif", vif); 

    // If is_active == UVM_ACTIVE, instantiate the sequencer and driver 

    if(is_active == UVM_ACTIVE) begin 

      seqr = bus_sequencer::type_id::create("seqr", this); 

      drv = bus_driver::type_id::create("drv", this);    

      uvm_config_db#(virtual bus_if)::set(this, "drv", "vif", vif); 

    end 

  endfunction 

  function void connect_phase (uvm_phase phase); 

    super.connect_phase (phase); 

    if(is_active == UVM_ACTIVE) begin 

      drv.seq_item_port.connect(seqr.seq_item_export); 

    end 

  endfunction 

endclass 

//////////////////////////////////////////// 

////////////// Environment////////////////// 

//////////////////////////////////////////// 

class bus_environment extends uvm_env; 

  `uvm_component_utils(bus_environment) 

  bus_agent agt; 

  function new (string name, uvm_component parent); 

    super.new(name, parent); 

  endfunction 

  function void build_phase (uvm_phase phase); 

    super.build_phase(phase); 

    agt = bus_agent::type_id::create("agt", this); 

  endfunction 

endclass 

//////////////////////////////////////////// 

////////////// Test Active////////////////// 

//////////////////////////////////////////// 

class bus_active_test extends uvm_test; 

  `uvm_component_utils(bus_active_test) 

  bus_environment env; 

  function new (string name, uvm_component parent); 

    super.new(name, parent); 

  endfunction 

  function void build_phase (uvm_phase phase); 

    super.build_phase(phase); 

    
    uvm_config_db#(uvm_active_passive_enum)::set(this, UVM_ACTIVE); 

    env = bus_environment::type_id::create("env", this); 

  endfunction 

  task run_phase (uvm_phase phase); 

    bus_sequencer seqr; 

    phase.raise_objection(this); 

    seq = bus_sequence::type_id::create("seq"); 

    seq.start(env.agt.seqr); 

    phase.drop_objection(this); 

  endtask 

endclass 

class bus_passive_test extends uvm_test; 

  `uvm_component_utils(bus_passive_test) 

  bus_environment env; 

  function new(string name, uvm_component parent); 

    super.new(name, parent); 

  endfunction 

  function void build_phase(uvm_phase phase); 

    super.build_phase(phase); 

    uvm_config_db#(uvm_active_passive_enum)::set(this, UVM_PASSIVE); 
"env.agt", "env.agt", "is_active", "is_active", 

    env = bus_environment::type_id::create("env", this); 

  endfunction 

  task run_phase (uvm_phase phase); 

    phase.raise_objection (this); 

    //no sequence here, because passive agent has no sequencer/driver 

    phase.drop_objection (this); 

  endtask 

endclass
