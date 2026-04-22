# Problem 06: Generate a Random Date with Valid Month-Day Constraints

## Problem Statement:

Create a **SystemVerilog class** that generates a random **date** with:

- Day between **1 to 31**
- Month between **1 to 12**
- Year fixed at **2024**
- Ensure **February has at most 29 days**
- Ensure months with 30 days are handled correctly

---

## Solution:

```systemverilog
// Code your testbench here 
// or browse Examples 

class RandomDateMonthYear;
 
  // Random variables
  rand int date, month;

  // Fixed year
  int year = 2024;

  // Constraint block
  constraint d_m_y {
    date inside {[1:31]};
    month inside {[1:12]};
    
    if (month == 2)   
      date <= 29;        // February (leap year case)

    else if (month inside {4, 6, 9, 11})    
      date <= 30;        // Months with 30 days

    else       
      date <= 31;        // Months with 31 days
  }

  // Method to randomize and display values
  function void display();
    if (!this.randomize())
      $display ("Randomization failed");  
    else
      $display ("Date - Month - Year : %0d - %0d - %0d", date, month, year);
  endfunction   
endclass

// Testbench   
module tb_d_m_y;  
  RandomDateMonthYear obj;   
  initial begin
    obj = new();
    // Generate 5 random dates 
    repeat(5) begin
      obj.display();
    end
  end
endmodule
```
---
## Sample Output:
```text
Date - Month - Year : 7 - 5 - 2024
Date - Month - Year : 25 - 8 - 2024
Date - Month - Year : 18 - 5 - 2024
Date - Month - Year : 24 - 6 - 2024
Date - Month - Year : 2 - 4 - 2024
```
---
## Observation:

All generated dates follow valid calendar constraints. February is limited to 29 days, months with 30 days are correctly restricted, and the year remains fixed at 2024, confirming proper conditional constraint handling.
