# Problem 09: Create a Coverage Component That Receives Transactions Using `uvm_analysis_export`

## Problem Statement:

Create a **coverage component** that receives transactions from the **monitor** using **`uvm_analysis_export`** instead of a direct **analysis imp**.

- The coverage component should use **`uvm_analysis_export`**
- The export should be connected to the monitor’s **analysis port**
- Make this connection in the **environment**
- The component should sample coverage when transactions are received

-----

## Status:
⚠️ Partially Solved

## Note:
The internal structure of the coverage component is implemented correctly, but the **environment-level connection from the monitor’s analysis port to the coverage component’s `analysis_export`** is not shown in this solution snippet.

----

# Solution:

The solution is implemented as follows:

```systemverilog
