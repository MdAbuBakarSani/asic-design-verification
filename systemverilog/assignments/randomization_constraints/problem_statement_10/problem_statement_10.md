# Problem 10: Generate Temperature Based on Mode Using Conditional Constraints

## Problem Statement:

Create a **SystemVerilog class** that randomizes a variable **temp** such that:

- If `mode == cold` → **0 ≤ temp ≤ 15**
- If `mode == hot` → **30 ≤ temp ≤ 45**
- Use an **enum** to represent the mode
- Display the generated temperature along with its mode

---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

// Define mode type using enum
typedef enum { cold, hot } mode_type;

class TemperatureMode;

  // Random variables
  rand int temp;
  rand mode_type mode;

  // Constraint block
  constraint temp_constraints {   
    if (mode == cold)
      temp inside {[0:15]};
    else if (mode == hot)   
      temp inside {[30:45]};
  }

  // Method to randomize and display values
  function void display();
    if (!this.randomize())
      $display("Randomization failed!"); 
    else
      $display ("For mode %s the temperature is %0d", (mode == cold) ? "cold" : "hot", temp);
  endfunction
endclass

// Testbench
module tb_temp_mode;
  TemperatureMode obj; 
  initial begin
    obj = new();
    // Generate 7 random values
    repeat (7) begin
      obj.display();
    end
  end
endmodule
```
---

## Sample Output:
```text
For mode cold the temperature is 6
For mode cold the temperature is 13
For mode cold the temperature is 4
For mode hot the temperature is 45
For mode hot the temperature is 40
For mode cold the temperature is 4
For mode hot the temperature is 39
```
---

## Observation:

The temperature values correctly follow the mode-based constraints. When the mode is cold, the temperature stays within 0–15, and when the mode is hot, it falls within 30–45, confirming proper conditional constraint behavior.
