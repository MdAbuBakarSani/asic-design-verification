# Problem 10: Create Two Different Sequences for Random and Corner-Case Testing

## Problem Statement:

Create two different sequences:

- One for **random testing**.
- Another for **corner-case testing** (e.g., max/min operand values).

From the **test class**, use a **virtual sequence** to call both sequences back-to-back.

----

# Solution:

The solution is implemented as follows:

```systemverilog
// Code your testbench here 
// or browse Examples 

`include "uvm_macros.svh" 
import uvm_pkg::*;
 
// Random Sequence 
class random_sequence extends uvm_sequence#(alu_sequence_item); 
  `uvm_object_utils(random_sequence) 

  function new (string name = "random_sequence"); 
    super.new(name); 
  endfunction 

  task body(); 
    alu_sequence_item pkt; 
    repeat (10) begin 
      `uvm_do(pkt)   // `uvm_do(req) = create → start_item → randomize → finish_item    
    end 
  endtask 
endclass 
 
// Corner-Case Sequence
class corner_case_sequence extends uvm_sequence#(alu_sequence_item); 
  `uvm_object_utils(corner_case_sequence) 
  
  function new (string name = "corner_case_sequence"); 
    super.new(name); 
  endfunction  

  task body(); 
    alu_sequence_item pkt; 
    repeat(10) begin 
      `uvm_do_with(pkt, {operand_a inside {0,15}; operand_b inside {0,15};}) 
    end 
  endtask 
endclass 

// Virtual Sequence to Call Both Sequences Back-to-Back
class virtual_sequence extends uvm_sequence; 
  `uvm_object_utils(virtual_sequence) 

  random_sequence rseq; 
  corner_case_sequence cseq; 
  alu_sequencer seqr; 

  function new (string name = "virtual_sequence"); 
    super.new(name); 
  endfunction 

  task body(); 
   
// Create random and corner-case sequences
    rseq = random_sequence::type_id::create("rseq"); 
    cseq = corner_case_sequence::type_id::create("cseq"); 
// Start both sequences back-to-back
  endtask 
endclass
