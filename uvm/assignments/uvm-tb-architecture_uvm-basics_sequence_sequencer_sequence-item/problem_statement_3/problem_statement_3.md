# Problem 3: UVM Sequence Item with Constraints

## Problem Statement:

Define a **UVM sequence item** with the following fields:
- `operand_a [3:0]` (4 bits)
- `operand_b [3:0]` (4 bits)
- `opcode [2:0]` (3 bits)

Add constraints to:
- Limit **operand_a** and **operand_b** to values between **0 and 15**.
- Restrict **opcode** to values between **0 and 4**.

Use **`rand`** and **constraint blocks** appropriately to apply these constraints.

## Solution:
The solution is implemented as follows:

