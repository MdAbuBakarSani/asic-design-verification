# Problem 02: Pass `is_active` from Environment to Agent Using `uvm_config_db`

## Problem Statement:

In the **environment class**, use **`uvm_config_db`** to pass an **`is_active`** flag to the **agent**.

- Pass the **`is_active`** flag from the **environment**
- The value can be:
  - **`UVM_ACTIVE`**
  - **`UVM_PASSIVE`**
- Based on this value, configure the **agent** to:
  - include the **driver** when active
  - exclude the **driver** when passive

-----

# Solution:

The solution is implemented as follows:

```systemverilog
