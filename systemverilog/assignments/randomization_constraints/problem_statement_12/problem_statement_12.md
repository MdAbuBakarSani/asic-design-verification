# Problem 12: Generate a Valid Random Time in 24-Hour Format

## Problem Statement:

Write a **SystemVerilog class** to generate a random **time (hh:mm)** such that:

- The time follows a valid **24-hour format**
- Hour is between **0 and 23**
- Minute is between **0 and 59**
- Display the time in **hh:mm format**

---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

class Time24HourFormat;
 
  // Random variables
  rand int hour, minute;

  // Constraint block
  constraint range {
    
    // Valid hour range (24-hour format)
    hour inside {[0:23]};
  
    // Valid minute range
    minute inside {[0:59]};   
  }

  // Method to randomize and display time
  function void display();
    if(!this.randomize()) 
      $display("Randomization failed!");
    else
      $display("Random Time (24-hour format): %02d:%02d", hour, minute);
  endfunction
endclass

// Testbench
module tb_time_24_hour_format;
  Time24HourFormat obj;
  initial begin
    obj = new();
    // Generate 5 random times
    repeat(5) begin
      obj.display(); 
    end 
  end
endmodule
```
---

## Sample Output:
```text
Random Time (24-hour format): 07:37
Random Time (24-hour format): 06:33
Random Time (24-hour format): 17:24
Random Time (24-hour format): 10:05
Random Time (24-hour format): 21:00
```
---

## Observation:

All generated times follow valid 24-hour format rules. Hours remain within 0–23 and minutes within 0–59, confirming correct implementation of time-based constraints.
