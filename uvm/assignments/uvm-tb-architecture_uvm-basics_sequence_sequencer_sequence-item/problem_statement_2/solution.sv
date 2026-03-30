// Code your testbench here 
// or browse Examples

class alu_scoreboard extends uvm_scoreboard; 

  `uvm_component_utils(alu_scoreboard) 

  uvm_analysis_imp#(alu_transaction, alu_scoreboard )mon_imp; 

  
  function new (string name, uvm_component parent); 

    super.new (name, parent); 

  endfunction 

  
  function void build_phase (uvm_phase phase); 

    super.build_phase(phase); 

    mon_imp = new("mon_imp", this); 

  endfunction 

  
  function void write (alu_transaction tr): 

    if (tr.expected_data !== tr.actual_data) 

      `uvm_error("Scoreboard", "Mismatched!"); 

    else 

      `uvm_info("Scoreboard", "Matched!", UVM_MEDIUM); 

  endfunction 

endclass 

class alu_env extends uvm_env; 

  alu_agent agt; 

  alu_scoreboard scb; 

  `uvm_component_utils(alu_env) 

  
  function new (string name, uvm_component parent); 

    super.new(name, parent); 

  endfunction 

  function void build_phase (uvm_phase phase); 

    super.build_phase (phase); 

    agt = alu_agent::type_id::create("agt", this); 

    scb = alu_scoreboard::type_id::create("scb", this); 

  endfunction 

  
  function void connect_phase (uvm_phase phase); 

    agt.mon.analysis_port.connect(scb.mon_imp); 

  endfunction 

endclass



