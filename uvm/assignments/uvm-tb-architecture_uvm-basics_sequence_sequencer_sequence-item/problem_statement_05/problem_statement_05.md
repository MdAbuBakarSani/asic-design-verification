# Problem 05: Use `uvm_config_db` for Passing `delay_enable`
## Problem Statement:
- Use `uvm_config_db` to pass a variable `delay_enable` from the **test class** to the **driver**.
- If `delay_enable` is set to **1**, the **driver** should add a **#10ns delay** before sending each transaction to the DUT (Device Under Test).

---

# Solution:

The solution is implemented as follows:

