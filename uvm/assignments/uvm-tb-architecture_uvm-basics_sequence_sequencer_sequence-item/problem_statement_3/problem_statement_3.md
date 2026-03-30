# Problem 3: UVM Sequence Item with Constraints

## Problem Statement:

Define a **UVM sequence item** with the following fields:
- `operand_a [3:0]` (4 bits)
- `operand_b [3:0]` (4 bits)
- `opcode [2:0]` (3 bits)

Add constraints to:
- Limit **operand_a** and **operand_b** to values between **0 and 15**.
- Restrict **opcode** to values between **0 and 4**.

Use **`rand`** and **constraint blocks** appropriately to apply these constraints.

---

# Solution:
The solution is implemented as follows:

```SystemVerilog
// Code your testbench here 
// or browse Examples

// Package groups related classes into a reusable namespace; 
// It avoids name conflicts, and makes importing easy into the testbench. 

package alu_seq_item_pkg; 
  `include "uvm_macros.svh" 
  import uvm_pkg::*; 

  class alu_sequence_item extends uvm_sequence_item; 

    // transaction 
    rand bit [3:0] operand_a; 
    rand bit [3:0] operand_b; 
    rand bit [2:0] opcode; 

    function new (string name = "alu_sequence_item"); 
      super.new(name); 
    endfunction 

    // Factory registration & field automation 
    `uvm_object_utils_begin(alu_sequence_item) 
    `uvm_field_int(operand_a, UVM_ALL_ON) 
    `uvm_field_int(operand_b, UVM_ALL_ON) 
    `uvm_field_int(opcode, UVM_ALL_ON) 
    `uvm_object_utils_end 

    // Constraints 
    constraint operand_range{ 
      operand_a inside {[0:15]}; 
      operand_b inside {[0:15]}; 
    } 

    constraint opcode_range{ 
      opcode inside {[0:4]}; 
    } 
  endclass 
endpackage 

// ==================================================== 
// Testbench for alu_sequence_item 
// ==================================================== 

`include "uvm_macros.svh" 
import uvm_pkg::*; 
import alu_seq_item_pkg::*;  

module tb_alu_sequence_item; 
  alu_sequence_item pkt; 
  
  initial begin 
    pkt = alu_sequence_item::type_id::create("pkt"); 
   
    repeat(5) begin 

    // Randomize the sequence item and check if successful
      if(!pkt.randomize()) begin 
        `uvm_error("Alu_Sequence_Item",  "Randomization Failed!"); 
      end else begin 
        pkt.print(); 
      end 
    end 
  end 
endmodule
