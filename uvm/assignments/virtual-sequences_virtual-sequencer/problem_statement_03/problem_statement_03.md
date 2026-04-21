# Problem 03: Run Read Sequence First, Then Start Write Sequence from a Virtual Sequence

## Problem Statement:

Implement a system where the **virtual sequence**:

- runs one sequence on the **read sequencer**
- waits for it to complete
- then starts another sequence on the **write sequencer**

Also, log the transaction flow clearly during execution.

------

# Solution:

The solution is implemented as follows:

```systemverilog

