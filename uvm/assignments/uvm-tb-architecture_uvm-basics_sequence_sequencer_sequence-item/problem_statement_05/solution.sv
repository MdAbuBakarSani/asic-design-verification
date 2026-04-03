// Code your testbench here
// or browse Examples

// === Test Class to Set the `delay_enable` Variable in `uvm_config_db` ===
uvm_config_db#(bit)::set(this, "", "delay_enable", 1);

// === Driver with Delay control ===
class alu_driver extends uvm_driver;
  bit delay_enable;      // Variable to store delay_enable flag
  
  `uvm_component_utils(alu_driver)
  
  function new (string name, uvm_component parent);  
    super.new(name, parent);  
  endfunction

// === Build Phase: Retrieve the `delay_enable` value from `uvm_config_db` ===
  function void build_phase (uvm_phasephase);
    super.build_phase(phase);
    uvm_config_db#(bit)::get(this, "", "delay_enable", delay enable);
  endfunction
  
// === Run Phase: Apply delay if `delay_enable` is 1 ===
  task run_phase(uvm_phase phase);  
    alu_sequence_item pkt;
    
    forever begin        
// === Get the next sequence item ===
      seq_item_port.get_next_item(pkt);
  
// === If `delay_enable` is 1, apply a #10ns delay ===     
      if (delay_enable) #10ns;
      
// === Mark the item as done ===
      seq_item_port.item_done();
    end
  endtask
endclass
