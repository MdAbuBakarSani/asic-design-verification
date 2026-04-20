# Problem 04: Log Mismatched Transactions Using a `uvm_tlm_fifo` and Print Them in `extract_phase`

## Problem Statement:

Modify your **scoreboard** so that it logs **mismatched transactions** using a **FIFO**.

- Use a **`uvm_tlm_fifo`** to store mismatches
- Store a transaction only when a **mismatch** occurs
- Print all mismatched transactions at the end of simulation
- Perform the printing in **`extract_phase`**

-----

# Solution:

The solution is implemented as follows:

```systemverilog

