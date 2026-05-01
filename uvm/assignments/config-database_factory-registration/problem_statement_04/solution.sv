// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

class coverage_collector extends uvm_subscriber#(my_transaction);
  `uvm_component_utils(coverage_collector)

  int min_opcode;      // Stores the minimum opcode threshold

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  // Build phase retrieves min_opcode from config_db 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Get min_opcode from config_db 
    // If not found, assign default value 0 
    uvm_config_db#(int)::get(this, "", "min_opcode", min_opcode);
     min_opcode = 0;   // default
  endfunction


  // Write function filters transactions based on min_opcode 
  function void write(my_transaction tr);
    if (tr.op_code >= min_opcode) 
      `uvm_info("Coverage", $sformatf("Sampling op: %0d | min_op : %0d", tr.op_code, min_opcode), UVM_LOW)   // Logs accepted transaction
  endfunction
endclass
