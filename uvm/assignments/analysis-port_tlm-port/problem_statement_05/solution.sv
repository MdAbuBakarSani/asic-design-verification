// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

// === Sequencer Class ===
class my_sequencer extends uvm_sequencer #(my_transaction);
  `uvm_component_utils(my_sequencer)

  uvm_blocking_put_port #(my_transaction) put_port;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    put_port = new("put_port", this);
  endfunction
endclass

// === Driver Class ===
class my_driver extends uvm_driver #(my_transaction);
  `uvm_component_utils(my_driver)

// === Will be connected to sequencer.put_port ===
  uvm_blocking_put_imp #(my_transaction, my_driver) put_imp;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    put_imp = new("put_imp", this);
  endfunction
    virtual task put(my_transaction tr);
      `uvm_info("Driver", $sformatf("Driving transaction: %s", tr.convert2string()), UVM_LOW)
// === Drive DUT here ===
  endtask
endclass

// === Sequence Class ===
class my_sequence extends uvm_sequence #(my_transaction);
  `uvm_object_utils(my_sequence)
  `uvm_declare_p_sequencer(my_sequencer)

  function new(string name="my_sequence");
    super.new(name);
  endfunction

  task body();
    my_transaction req;
    repeat (5) begin
      req = my_transaction::type_id::create("req");
      assert(req.randomize());
// === Call put() on the sequencer's port  ===  
      `uvm_info("Sequence", $sformatf("Sending item: %s", req.convert2string()), UVM_LOW)
      p_sequencer.put_port.put(req);
    end
  endtask
endclass

