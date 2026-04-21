# Problem 10: Pass Virtual Sequencer Handle from Environment to Test Using `uvm_config_db`

## Problem Statement:

Pass the **virtual sequencer handle** from the **environment** to the **test** using **`uvm_config_db`**, and access it in the **virtual sequence**.

- Pass the **virtual sequencer handle** from the environment
- Retrieve it in the **test**
- Start the **virtual sequence** using that handle
- Verify that all sequencer handles are properly initialized before starting child sequences
- Ensure **`read_sqr`** and **`write_sqr`** are not null before calling `start()`

-----

# Solution:

The solution is implemented as follows:

```systemverilog
