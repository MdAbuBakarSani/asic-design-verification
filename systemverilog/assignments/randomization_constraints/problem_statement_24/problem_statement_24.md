# Problem 24: Generate a Student Profile with Conditional Constraints

## Problem Statement:

Randomize a **student profile** with the following fields:

- **Name** (enum type)
- **Age** between 15 and 25
- **Marks** between 0 and 100
- Apply a condition:
  - If **age < 20**, then **marks must be greater than 70**
- Display the generated student details

---

## Solution:

```systemverilog

// Code your testbench here 
// or browse Examples 

// Define name as enum
typedef enum {Alice, Bob, Diana, Charlie, Max}name_t;

class StudentProfile;

  // Random variables
  rand int age, marks;
  rand name_t name;
 
  // Constraint block
  constraint range_conditions{
    age inside {[15:25]};
    marks inside {[0:100]};
   
    if (age < 20) marks > 70;     // Conditional constraint
  }
 
  // Method to randomize and display values
  function void display();
    if (!this.randomize()) 
      $display("Randomization failed!");
    else
      $display("Name: %p | Age: %0d | Marks: %0d",name, age, marks);
  endfunction
endclass

// Testbench
module tb;
  StudentProfile data;
  initial begin
    data = new();
    // Generate 15 student profiles
    repeat(15) begin
      data.display();
    end
  end
endmodule
```
---

## Sample Output:
```text
Name: Alice | Age: 21 | Marks: 74
Name: Bob | Age: 24 | Marks: 65
Name: Diana | Age: 22 | Marks: 68
Name: Charlie | Age: 20 | Marks: 45
Name: Diana | Age: 24 | Marks: 4
Name: Diana | Age: 22 | Marks: 14
Name: Diana | Age: 24 | Marks: 97
Name: Charlie | Age: 20 | Marks: 8
Name: Diana | Age: 24 | Marks: 46
Name: Diana | Age: 25 | Marks: 86
Name: Diana | Age: 20 | Marks: 76
Name: Bob | Age: 19 | Marks: 95
Name: Bob | Age: 20 | Marks: 33
Name: Diana | Age: 25 | Marks: 57
Name: Bob | Age: 17 | Marks: 90
```
---

## Observation:

All generated profiles follow the defined constraints. When age is less than 20, marks are always greater than 70, confirming correct implementation of conditional dependency between variables.
