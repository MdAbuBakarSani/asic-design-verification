# Problem 05: UVM Config DB with Delay Control

## Problem Statement:

Use **`uvm_config_db`** to pass a variable **`delay_enable`** from the **test class** to the **driver**. 

If **`delay_enable`** is set to **1**, the **driver** should add a **#10ns delay** before sending each transaction to the DUT (Device Under Test).

The sequence of actions should be as follows:
1. In the **test class**, set **`delay_enable`** using **`uvm_config_db`**.
2. In the **driver**, retrieve the value of **`delay_enable`** using **`uvm_config_db`**.
3. If **`delay_enable`** is **1**, the driver should introduce a **#10ns delay** before sending each transaction to the DUT.
4. If **`delay_enable`** is **0**, the driver should send transactions without any delay.

---

# Solution:

The solution is implemented as follows:

