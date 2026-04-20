// Code your testbench here 
// or browse Examples 

`include "uvm_macros.svh" 
import uvm_pkg::*; 

// === Driver ===
task run_phase (uvm_phase phase); 
bus_transaction tr;   // Declare transaction handle
  forever begin

// === Get next transaction from sequencer ===
seq_item_port.get_next_item(tr);

// === Print current simulation time when driver sends transaction ===
$display("Driver => Sending transaction at %0t simulation time.", $time);   

// === Inform sequencer that transaction is completed ===
seq_item_port.item_done();   
end 
endtask

// === Monitor ===
task run_phase (uvm_phase phase); 
 bus_transaction tr;   // Declare transaction handle
 forever begin 

// === Wait for positive edge of clock before sampling transaction ===
@(posedge vif.clk);   

// === Print current simulation time when monitor captures transaction ===
$display("Monitor => Capturing transaction at %0t simulation time.", $time);   

// === The monitor waits for a clock edge, so its timestamp appears later than the driver ===
end 
endtask
