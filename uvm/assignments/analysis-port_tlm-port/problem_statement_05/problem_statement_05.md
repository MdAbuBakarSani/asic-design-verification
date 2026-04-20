# Problem 05: Replace the Default Sequencer-Driver Connection with `uvm_blocking_put_port` and `uvm_blocking_put_imp`

## Problem Statement:

Replace the default **sequencer-driver** connection using **`seq_item_port`** and instead use:

- **`uvm_blocking_put_port`** in the **sequencer**
- **`uvm_blocking_put_imp`** in the **driver**

Transfer sequence items using **`put()`** and verify correctness.

----

# Solution:

The solution is implemented as follows:

```systemverilog
