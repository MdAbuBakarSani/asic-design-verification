# Problem 10: Implement a Parallel Scoreboard Setup Using `uvm_analysis_port` Broadcasting

## Problem Statement:

Implement a **parallel scoreboard** setup where **two scoreboards** receive the **same transactions** from a **monitor**.

- One scoreboard should check **field-level accuracy**
- The other scoreboard should check **sequence order**
- Use **`uvm_analysis_port` broadcasting** so the monitor can send the same transaction stream to both scoreboards

-----

## Status:
⚠️ Partially Solved

## Note:
The broadcasting setup is implemented correctly, but the second scoreboard does not yet perform a real **sequence-order check**. 

------

# Solution:

The solution is implemented as follows:

```systemverilog
