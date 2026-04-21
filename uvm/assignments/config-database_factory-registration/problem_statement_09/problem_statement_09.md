# Problem 09: Pass a Complex Configuration Object from Test to Driver Using `uvm_config_db`

## Problem Statement:

Use **`uvm_config_db`** to send a **complex configuration object** such as **`transaction_config`** from the **test** to the **driver**.

- Define a configuration class with fields such as:
  - **`addr_width`**
  - **`data_mode`**
- Set the configuration object in the **test**
- Retrieve the configuration object in the **driver**
- Use **`uvm_config_db`** to pass the object handle

----

# Solution:

The solution is implemented as follows:

```systemverilog
