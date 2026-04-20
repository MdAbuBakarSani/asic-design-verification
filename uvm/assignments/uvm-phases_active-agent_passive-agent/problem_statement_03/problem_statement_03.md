# Problem 03: Print Simulation Time from Driver and Monitor to Compare Their Timestamps

## Problem Statement:

Create a **UVM testbench** where:

- The **active agent’s driver** prints the current **simulation time** in the `run_phase()` whenever a transaction is sent.
- The **passive agent monitor** captures the transaction and prints a message in its own `run_phase()`.
- Compare their timestamps to show that the **monitor lags the driver**.

---

# Solution:

```systemverilog
