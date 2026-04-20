# Problem 03: Subscribe to a Monitor’s `analysis_port` and Broadcast to Multiple Analysis Components

## Problem Statement:

Create a component such as a **coverage collector** that subscribes to the **monitor's `analysis_port`**.

- The component should log transactions that match a particular field value
- For example, log transactions when **`op_code == 3`**
- Demonstrate that a **single monitor** can broadcast transactions to **multiple analysis components**
- One possible setup is:
  - **scoreboard**
  - **coverage collector**

----

# Solution:

The solution is implemented as follows:

```systemverilog
