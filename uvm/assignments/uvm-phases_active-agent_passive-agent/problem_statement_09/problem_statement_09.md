## Problem Statement:

Create a reusable **base agent class** with an **`is_active`** flag.

- Derive both **active** and **passive** agents from the base agent
- Instantiate the appropriate agent in the **environment** based on a **config setting** from the **testbench**
- Demonstrate proper **phase execution** in both child classes

-----

# Solution:

```systemverilog
// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"     
import uvm_pkg::*;            

