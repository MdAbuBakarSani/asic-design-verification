# Problem 01: Create a Virtual Sequence to Control Two Sequences in Parallel

## Problem Statement:

Create a **virtual sequence** that controls two different sequences such as:

- **`read_seq`**
- **`write_seq`**

These sequences should run on two different sequencers, for example:

- one sequencer for the **read agent**
- one sequencer for the **write agent**

Coordinate both sequences to run **in parallel**.

## Status:
⚠️ Partially Solved

## Note:
The main parallel-sequence idea is correct, but the sequence should usually access the virtual sequencer through **`p_sequencer`** using `` `uvm_declare_p_sequencer(virtual_sequencer) `` instead of keeping a local `vseqr` handle that is never assigned.

-------

# Solution:

The solution is implemented as follows:

```systemverilog
