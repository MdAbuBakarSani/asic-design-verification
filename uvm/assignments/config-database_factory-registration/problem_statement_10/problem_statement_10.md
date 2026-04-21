# Problem 10: Override a Scoreboard Using `set_type_override_by_name()`

## Problem Statement:

Use the **UVM factory** to register and override a **scoreboard implementation** using **`set_type_override_by_name()`**.

- Register the base scoreboard and derived scoreboard with the factory
- Override the base scoreboard using **`set_type_override_by_name()`**
- Print factory overrides before simulation
- Confirm that the mapping was registered

----

# Solution:

The solution is implemented as follows:

```systemverilog
