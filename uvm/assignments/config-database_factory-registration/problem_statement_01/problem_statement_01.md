# Problem 01: Pass a Configurable Integer from Test to Driver Using `uvm_config_db`

## Problem Statement:

Use **`uvm_config_db#(int)::set()`** in the **test class** to pass a configurable variable such as **`int num_packets`** to the **driver**.

- Set `num_packets` in the **test class**
- Retrieve it inside the **driver** using **`uvm_config_db#(int)::get()`**
- Generate that many transactions in the driver’s **`run_phase`**

-----

# Solution:

The solution is implemented as follows:

```systemverilog


