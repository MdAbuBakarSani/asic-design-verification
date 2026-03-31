# Problem 09: Use uvm_do_with() Macro Inside the Sequence to Generate Only Specific Operations

## Problem Statement:

Use the **`uvm_do_with()`** macro inside the **sequence** to generate only specific operations (e.g., only `opcode == 2` or `3`) while randomizing other fields. Show that **constrained transactions** are generated during the simulation.

---

# Problem 09: Use uvm_do_with() Macro Inside the Sequence to Generate Only Specific Operations

## Problem Statement:

Use the **`uvm_do_with()`** macro inside the **sequence** to generate only specific operations while randomizing other fields. Specifically:

- Generate only **`opcode == 2` or `3`** operations.
- Randomize other fields without any constraints.
- Demonstrate that **constrained transactions** are generated during simulation.

-----
# Solution:

The solution is implemented as follows:

```systemverilog
