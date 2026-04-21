# Problem 04: Create an Environment with Two Agents and Run Read, Write, or Both Using a Virtual Sequence

## Problem Statement:

Create an **environment with two agents**. Write a **virtual sequence** that randomly decides at runtime whether to run a **read_seq**, **write_seq**, or **both**.

- Use **two agents**
- Create a **virtual sequencer**
- Write a **virtual sequence**
- Use **`$urandom_range`** inside the virtual sequence for randomization
- Based on the random value, run:
  - only **read_seq**
  - only **write_seq**
  - or **both sequences together**

------

# Solution:

The solution is implemented as follows:

```systemverilog
