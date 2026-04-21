Pass an **integer value** such as **`transfer_count`** via **`uvm_config_db`** from the **test** to the **virtual sequence**.

- Set `transfer_count` in the **test**
- Retrieve it inside the **virtual sequence**
- Use that value inside a **loop**
- Start the child sequences that many times

-----

# Solution:

The solution is implemented as follows:

```systemverilog
