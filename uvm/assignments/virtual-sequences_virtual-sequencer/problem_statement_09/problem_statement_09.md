# Problem 09: Simulate Ordered Execution of Three Sequences Across Two Agents Using a Virtual Sequence

## Problem Statement:

Simulate a scenario where **three sequences** need to run in a **specific order** across **two agents**.

- Run **`seq_A`** on the **read agent**
- Then run **`seq_B`** on the **write agent**
- Then run **`seq_C`** on the **read agent**
- Maintain the exact execution order
- Implement the complete sequencing inside a **virtual sequence**

-----

# Solution:

The solution is implemented as follows:

```systemverilog
