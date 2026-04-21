# Problem 11: Build a Testbench with Three Sequencers and Coordinate Them Using a Virtual Sequence

## Problem Statement:

Build a **testbench with three sequencers**: **`read_sqr`**, **`write_sqr`**, and **`config_sqr`**. Implement a **virtual sequence** that coordinates sequences across all three sequencers, running some in **parallel** and some in **sequence**.

- Create three sequencers:
  - **`read_sqr`**
  - **`write_sqr`**
  - **`config_sqr`**
- Implement a **virtual sequencer**
- Implement a **virtual sequence**
- Run some sequences in **parallel**
- Run some sequences in **sequence**
- Use **`$display`** to indicate the **start** and **end** of each sequence

-----

# Solution:

The solution is implemented as follows:

```systemverilog
