# Problem 10: Connect Active and Passive Agent Components in `connect_phase`

## Problem Statement:

In the **environment's `connect_phase`**, make the required TLM connections for both the **active agent** and the **passive agent**.

- Connect the **active agent’s driver** to the **sequencer** using **`seq_item_port`**
- Connect the **passive agent’s monitor `analysis_port`** to a **coverage collector**
- Verify that all connections are completed only in **`connect_phase`**

-----

# Solution:

```systemverilog

