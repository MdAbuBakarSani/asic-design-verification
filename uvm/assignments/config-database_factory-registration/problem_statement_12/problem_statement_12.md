# Problem 12: Use a Configuration Object to Conditionally Build Environment Subcomponents

## Problem Statement:

Implement a **configuration object** class such as **`env_config`** that includes boolean fields like:

- **`enable_scoreboard`**
- **`enable_coverage`**

Pass this object from the **test** to the **environment** using **`uvm_config_db`**.

- The **test** should create and configure the `env_config` object
- The **environment** should retrieve it using **`uvm_config_db`**
- In the environment’s **`build_phase`**, use the config fields to **conditionally construct subcomponents**

## Status:
⚠️ Partially Solved

## Note:
The configuration object is defined and passed through `uvm_config_db`, but the current snippet does not yet show:
- actual values assigned to `enable_scoreboard` and `enable_coverage`
- conditional construction of scoreboard and coverage components in `build_phase`

# Solution:

The solution is implemented as follows:

```systemverilog
