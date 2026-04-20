# Problem 07: Chain Multiple Monitors Together Using `uvm_analysis_port` and `uvm_analysis_imp`

## Problem Statement:

Chain multiple **monitors** together:

- **Monitor1** sends data using **`uvm_analysis_port`**
- **Monitor2** receives the data using **`uvm_analysis_imp`**
- **Monitor2** then sends the transaction again to a third component such as a **scoreboard**
- Demonstrate an **intermediate transformation** of the transaction inside **Monitor2**

# Solution:

The solution is implemented as follows:

```systemverilog
