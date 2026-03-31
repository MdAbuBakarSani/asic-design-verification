# Problem 08: Implement a Layered Testbench Structure with Proper TLM Connections

## Problem Statement:

Implement a **layered testbench structure** where:

- The **sequence** is started in the **test class**.
- The **sequencer** is part of the **agent**.
- The **driver** receives items from the **sequencer**.

Demonstrate proper **TLM connections** between components.

----

# Solution: 

The solution is implemented as follows:

This concept has been implemented in previous questions, specifically in:

### Q01: Agent
- Created `alu_agent` containing the necessary components.
- In the `connect_phase()`, the TLM connection between **Driver** and **Sequencer** is established. This step already connected the **Driver** to the **Sequencer** within the **agent**.

### Q04: Sequence
- Defined `alu_sequence`, which generates 10 randomized transactions.
- This sequence is later started from the **test class**.

### Q05–Q06: Override Drivers and Delay Control
- Added **delay control** and **override drivers**, reusing the same **agent** and **sequencer** structure.

### Q07: Coverage Collector
- Expanded the environment to include a **coverage collector**.
- Despite adding the collector, the **agent** still contained the **sequencer**, **driver**, and **monitor** with the same TLM wiring.

By the time **Q07** was implemented, the environment had the following structure:

- **Test** → Starts **Sequence** (`seq.start(env.agt.seq)`)
