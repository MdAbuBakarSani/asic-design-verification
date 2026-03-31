# Problem 07: Modify ALU Environment to Include Coverage Collector

## Problem Statement:

Modify the **ALU environment** to include a **coverage collector** that tracks and reports the coverage of the **opcode** field from the sequence item.

- Create a **UVM subscriber** (`opcode_coverage`) that collects **functional coverage** for the **opcode** field.
- The **`opcode_coverage`** subscriber should:
  1. **Sample** the **opcode** value for every transaction.
  2. **Print** the coverage report at the end of the simulation using the **`report_phase()`**.

---

# Solution:

The solution is implemented as follows:

```SystemVerilog

