# Problem 06: Override Default Driver with Random Delay
## Problem Statement:

Override the default **driver** with a new driver named `delayed_driver` that introduces a **random delay** before sending transactions.

- Use the **UVM factory** with `set_type_override_by_type()` to override the **default driver** with `delayed_driver`.
- The `delayed_driver` should introduce a **random delay** before sending each transaction to the **DUT**.
- The **Test Class** should be able to set this driver override using `set_type_override_by_type()`.

---

# Solution:

The solution is implemented as follows:

