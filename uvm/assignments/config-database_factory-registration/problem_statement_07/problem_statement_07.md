# Problem 07: Override a Driver Class Using `set_type_override_by_type()`

## Problem Statement:

Register a child class of the driver such as **`custom_driver`** using the factory override method **`set_type_override_by_type()`**.

- Create a base driver class
- Create a child driver class such as **`custom_driver`**
- Use **`set_type_override_by_type()`** to override the base driver with the child driver
- Instantiate the driver in the **environment** using the factory
- Verify at runtime that the **custom driver** is actually used

-----

## Solution:

The solution is implemented as follows:

```systemverilog
