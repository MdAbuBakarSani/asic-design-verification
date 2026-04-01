# Problem 01: Design a UVM Environment with One Active Agent and One Passive Agent for a Simple Bus Interface

## Problem Statement:

Design a **UVM environment** with:

- **One active agent** and **one passive agent** for a simple bus interface.
  
The active agent should include:
- A **sequencer** and **driver** to generate stimulus.

The passive agent should include:
- A **monitor** that observes transactions.

Simulate a few **bus write operations** and confirm that:
- Only the **active agent** drives the **DUT**.
- Both agents observe data.

----

# Solution:

The solution is implemented as follows:

```systemverilog
