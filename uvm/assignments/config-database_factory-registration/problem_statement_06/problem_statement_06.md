# Problem 06: Demonstrate Factory Registration Using `uvm_object_utils` and `uvm_component_utils`

## Problem Statement:

Demonstrate **factory registration** using:

- **`uvm_object_utils`** in a **sequence** class
- **`uvm_component_utils`** in a **driver** class

Also:

- Verify their creation using **`uvm_factory::print()`**
- Log their **type names** during simulation

-------

## Status:
⚠️ Partially Solved

## Note:
The sequence and driver are correctly registered with the factory, and `uvm_factory::print()` is used. However, the snippet does not show the sequence actually being created and started, so the sequence type-name log in `body()` may not execute unless the sequence is run elsewhere.

------

# Solution:

The solution is implemented as follows:

```systemverilog
