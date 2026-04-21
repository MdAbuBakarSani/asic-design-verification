# Problem 12: Create a Scoreboard Reset Sequence That Runs via a Virtual Sequencer

## Problem Statement:

Create a **scoreboard reset sequence** that runs via a **virtual sequencer**.

- The reset sequence should send reset commands to both:
  - **read agent**
  - **write agent**
- Use a **virtual sequence** to coordinate both reset sequences
- Ensure both reset sequences complete before any further transactions are issued

----

# Solution:

The solution is implemented as follows:

```systemverilog
