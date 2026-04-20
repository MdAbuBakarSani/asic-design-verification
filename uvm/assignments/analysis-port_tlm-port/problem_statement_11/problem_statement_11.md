# Problem 11: Design a Shared Scoreboard That Accepts Transactions from Two Different Monitors

## Problem Statement:

Design a **shared scoreboard** component that accepts transactions from **two different types of monitors** such as:

- **read monitor**
- **write monitor**

Use **two `uvm_analysis_imp`** connections in the scoreboard.

- One input should receive transactions from the **read monitor**
- The other input should receive transactions from the **write monitor**
- Use **`get_type_name()`** or **`get_full_name()`** to tag and differentiate the source of each transaction in the logs

-----

# Solution:

The solution is implemented as follows:

```systemverilog
