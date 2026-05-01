# Problem 04: UVM Sequence for ALU Operations

## Problem Statement:

Create a **UVM sequence** that generates and sends **10 randomized ALU operations** using the sequence item from **Problem 03**.

The sequence should:

- **Randomize** the `operand_a`, `operand_b`, and `opcode` for each operation.
- **Start the sequence** from the **test class** using the **`start()`** method during the **`run_phase()`**.

---

## Solution:

The solution is implemented as follows:

```SystemVerilog

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
```
