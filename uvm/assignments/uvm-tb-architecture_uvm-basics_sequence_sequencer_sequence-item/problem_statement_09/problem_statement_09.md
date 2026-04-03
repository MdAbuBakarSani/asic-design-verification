# Problem 09: Use `uvm_do_with()` Macro Inside the Sequence to Generate Only Specific Operations

## Problem Statement:

Use the **`uvm_do_with()`** macro inside the **sequence** to generate only specific operations while randomizing other fields. Specifically:

- Generate only **`opcode == 2` or `3`** operations.
- Demonstrate that **constrained transactions** are generated during simulation.

-----
# Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here 
// or browse Examples 

`include "uvm_macros.svh" 
import uvm_pkg::*; 

class alu_sequence_specific_operation extends uvm_sequence#(alu_sequence_item); 
  `uvm_object_utils(alu_sequence_specific_operation) 

  function new ( string name = "alu_sequence_specific_operation"); 
    super.new(name); 
  endfunction 

  task body(); 
    alu_sequence_item pkt; 
    pkt = alu_sequence_item::type_id::create("pkt"); 
    start_item (pkt);  
// === Constrain opcode to be either 2 or 3 while randomizing other fields ===
    assert (pkt.randomize() with {opcode inside {[2, 3]}}); 
    finish_item (pkt); 
  endtask 
endclass
  
// === Starting it from the test ===
  alu_sequence_specific_operation item;  
  item = alu_sequence_specific_operation::type_id::create("item");   
  item.start(env.agt.seqr);
