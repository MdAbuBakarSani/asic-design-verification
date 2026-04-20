# Problem 06: Build a Passive Agent with a Monitor and Connect It to a Statistics Collector

## Problem Statement:

Build a **passive agent** with a **monitor** that sends data using **`uvm_analysis_port`**.

- The **monitor** should send observed transactions through **`uvm_analysis_port`**
- Connect the monitor to a component that acts as a **statistics collector**
- The **statistics collector** should track the number of transactions for each **opcode**

----

# Solution:

The solution is implemented as follows:

```systemverilog
