// Code your testbench here 
// or browse Examples 

class alu_sequence extends uvm_sequence#(alu_sequence_item);
  `uvm_object_utils(alu_sequence) 

  function new (string name = "alu_sequence"); 
    super.new (name); 
  endfunction 

  task body(); 
    alu_sequence_item pkt; 
    
    repeat(10) begin 
      pkt = alu_sequence_item::type_id::create("pkt"); 
      
      assert (pkt.randomize());    
      else `uvm_error("ALU Sequence", "Randomization Failed!~"); 
     
      start_item(pkt); 
      finish_item(pkt); 
    end 
  endtask 
endclass
