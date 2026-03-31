# Problem 04: UVM Sequence for ALU Operations

## Problem Statement:

Create a **UVM sequence** that generates and sends **10 randomized ALU operations** using the sequence item from **Problem 03**.

The sequence should:

- **Randomize** the `operand_a`, `operand_b`, and `opcode` for each operation.
- **Start the sequence** from the **test class** using the **`start()`** method during the **`run_phase()`**.

---

# Solution:

The solution is implemented as follows:

```SystemVerilog






