# Problem 03: Dynamically Select and Start a Sequence Type Using `uvm_config_db` and Factory

## Problem Statement:

Implement a **testbench** where the **sequence type** to run is passed using **`uvm_config_db#(uvm_object_wrapper)::set()`**.

- Pass the sequence type such as:
  - **`read_seq`**
  - **`write_seq`**
- Use **`uvm_config_db#(uvm_object_wrapper)::set()`** to configure the sequence type
- Use **`uvm_factory::create_object_by_type()`** to dynamically create the sequence
- Start the created sequence on the **sequencer**

------

## Status:
Not Solved Yet

## Note:
This problem is currently unsolved. I will revisit and update the solution later.
