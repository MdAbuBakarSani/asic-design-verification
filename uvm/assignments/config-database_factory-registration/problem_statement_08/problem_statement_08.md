# Problem 08: Override a Base Sequence with an Extended Sequence Using `set_inst_override_by_type()`

## Problem Statement:

Override a **base sequence** such as **`base_seq`** with an extended sequence such as **`burst_seq`** using **`set_inst_override_by_type()`** for a **specific instance path**.

- Apply the override only for one specific path
- Verify that only the specified instance gets the **overridden sequence**
- Verify that other instances still get the **base sequence**

-----

# Solution:

The solution is implemented as follows:

```systemverilog
