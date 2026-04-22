# Problem 11: Generate Three Ordered Variables with Range Constraints

## Problem Statement:

Create a **SystemVerilog class** to randomize three variables **a, b, c** such that:

- They are in the range **1 to 50**
- They satisfy the condition **a < b < c**
- Display the generated values

---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

class OrderedABC;

  // Random variables
  rand int a, b, c;
 
  // Constraint block
  constraint range {
   
    // Range constraints
    a inside {[1:50]};
    b inside {[1:50]};
    c inside {[1:50]};

    // Ordering constraints
    a < b;
    b < c;
  }

  // Method to randomize and display values  
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else
      $display("a = %0d < b = %0d < c = %0d", a, b, c);
  endfunction
endclass

// Testbench
module tb_ordered_abc;
  OrderedABC obj;
  initial begin
    obj = new();
    // Generate 5 ordered sets
    repeat(5) begin
      obj.display();
    end
  end
endmodule
```
---

## Sample Output:
```text
a = 26 < b = 42 < c = 49
a = 18 < b = 21 < c = 47
a = 9 < b = 12 < c = 45
a = 4 < b = 31 < c = 41
a = 35 < b = 40 < c = 47
```
---

## Observation:

All generated values satisfy the ordering constraint a < b < c and remain within the specified range of 1 to 50, confirming correct implementation of relational and range constraints.
