# Problem 11: Override a Base Environment with a Custom Environment Using the UVM Factory

## Problem Statement:

Create a **base environment** class and extend it as **`custom_env`**.

- Define a base environment class
- Extend it into a child class named **`custom_env`**
- Use the **UVM factory** to override the base environment with the custom environment in the **test**
- Verify during simulation that **`custom_env`** gets instantiated using **`$display`**

----

# Solution:

The solution is implemented as follows:

```systemverilog
