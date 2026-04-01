# Problem 02: Modify the Environment to Make the Same Agent Configurable as Either Active or Passive

## Problem Statement:

Modify the **environment** to make the same agent configurable as either **active** or **passive** using a **config_db** field (`is_active`).

- If `is_active == UVM_ACTIVE`, instantiate the **sequencer** and **driver**.
- If `is_active == UVM_PASSIVE`, skip the sequencer and driver.
- Set the `is_active` field from the **test class**.
- Demonstrate both behaviors in two separate simulations: one for the active agent and one for the passive agent.

---

# Solution:

The solution is implemented as follows:

```systemverilog
