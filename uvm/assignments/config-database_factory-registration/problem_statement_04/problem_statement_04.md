# Problem 04: Create a Coverage Collector with a Configurable Minimum Opcode Threshold

## Problem Statement:

Create a **coverage collector** that takes a config parameter for the minimum opcode value such as **`min_opcode`**.

- The value of **`min_opcode`** should be configurable using **`uvm_config_db`**
- The coverage collector should filter transactions based on this threshold
- Transactions with opcode values below **`min_opcode`** should be ignored
- Transactions meeting the threshold should be processed by the coverage collector

-------

# Solution:

The solution is implemented as follows:

```systemverilog
