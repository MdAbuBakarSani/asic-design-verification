# Problem 05: Pass a Virtual Interface from Top Module to Driver Using `uvm_config_db`

## Problem Statement:

Use **`uvm_config_db`** to pass a **virtual interface** from the **top module** to the **driver class**.

- Bind the virtual interface in the **testbench**
- Retrieve it in the driver’s **`build_phase`**
- Validate the connection using **`$display`**

-------

# Solution:

The solution is implemented as follows:

```systemverilog
