# Problem 08: Use Factory Override to Replace a Base Virtual Sequence with a Custom Virtual Sequence

## Problem Statement:

Use **factory override** to replace a **base virtual sequence** with a **custom virtual sequence** from the **test**.

- Create a **base virtual sequence**
- Create a **custom virtual sequence** that extends the base one
- Register both using **`uvm_object_utils`**
- Apply **factory override** in the **test**
- Verify at runtime which sequence is actually created using **`get_type_name()`**

-----

# Solution:

The solution is implemented as follows:

```systemverilog
