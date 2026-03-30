
# Problem 2: UVM Environment for 4-bit ALU with Scoreboard

## Problem Breakdown:
Build a **UVM environment** that:
1. Instantiates the **agent** from **Problem 1**.
2. Instantiates a **scoreboard** to verify the DUT's output.
3. Connects the **monitor’s analysis port** to the **scoreboard** using **`uvm_analysis_port`**.

---

## Requirements:
- **Agent Instantiation**: The **UVM agent** from **Problem 1** should be instantiated inside the **UVM environment**.
- **Scoreboard**: Create a **scoreboard** to compare the **expected** and **actual** data from the **monitor**.
- **Analysis Port**: Connect the **monitor’s analysis port** to the **scoreboard** using **`uvm_analysis_port`**.
- **Monitor**: Capture the **inputs** and **outputs** of the DUT (Device Under Test) using the **monitor**.
- **Active/Passive Control**: The agent’s **active/passive** behavior should be controlled using the **`is_active` flag**.
- **UVM Methodology**: Use the **UVM** methodology for constructing the environment and connecting components.
- **Verification**: The **scoreboard** must check the **validity** of the DUT's output by comparing the **expected data** to the **actual data**.

---

# Solution:

The solution is implemented as follows:







