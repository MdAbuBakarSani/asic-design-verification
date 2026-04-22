# Problem 02: Generate Random IP Address Segments with Constraints

## Problem Statement:

Write a **SystemVerilog class** with constraints to generate random **IP address segments (0–255)**.

- Generate **four segments** of an IP address
- Each segment should be in the range **0 to 255**
- The **first segment** must be in the range **1 to 223**
- Exclude **127** from the first segment
- Display the generated IP address

-------

# Solution:

The solution is implemented as follows:

```systemverilog

