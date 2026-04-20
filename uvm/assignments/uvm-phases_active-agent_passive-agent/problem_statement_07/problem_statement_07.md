# Problem 07: Collect Transactions in a Passive Agent Monitor and Print Them in `extract_phase`

## Problem Statement:

Within a **passive agent monitor**, collect all observed transactions into a **queue**.

- Store all observed transactions during simulation
- Print all collected transactions in the **`extract_phase`**
- Demonstrate how **passive agents** can be used for **data logging** and **post-processing**
- Ensure that the passive agent does this **without interfering with DUT behavior**

-----

# Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here 
// or browse Examples 

`include "uvm_macros.svh" 
import uvm_pkg::*;
