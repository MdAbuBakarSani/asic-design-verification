# Problem 02: Build a Virtual Sequencer with Multiple Lower-Level Sequencer Handles

## Problem Statement:

Build a **virtual sequencer** class that contains handles to multiple lower-level sequencers such as:

- **`read_sqr`**
- **`write_sqr`**

Pass the virtual sequencer to the **virtual sequence** using **`uvm_config_db`**.

- The virtual sequencer should store handles to both child sequencers
- The virtual sequence should retrieve or access the virtual sequencer
- Use the virtual sequencer to control both child sequencers inside the virtual sequence

-----

## Status:
Not Solved Yet
