# Problem 02: Connect Two Monitors to a Single Scoreboard Using Separate `uvm_analysis_port` Instances

## Problem Statement:

Connect **two monitors** to a single **scoreboard** using separate **`uvm_analysis_port`** instances.

- Each **monitor** should have its own **`uvm_analysis_port`**
- The **scoreboard** should receive transactions from both monitors
- Handle the two input streams using **two `uvm_analysis_imp` implementations**
- Print the received transactions separately for each monitor stream

----

## Solution:

The solution is implemented as follows:

```systemverilog
