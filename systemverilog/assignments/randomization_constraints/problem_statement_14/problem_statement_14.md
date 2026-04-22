# Problem 14: Generate a 4-Digit PIN with Non-Sequential Digits

## Problem Statement:

Generate a **4-digit PIN** such that:

- Each digit is between **0 and 9**
- The 4-digit PIN must **not** be in sequential order
- Sequential examples such as **1234**, **4567**, **9876**, etc. must be avoided
- Display the generated PIN

---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

class NonsequentialDigitPin;

    // Random array of 4 digits
    rand bit [3:0] pin [4];

    // Constraint block 
    constraint range{
        foreach (pin[i]) pin[i] inside {[0:9]};    //each digit must be between 0 and 9
    }

    // Constraint: prevent ascending or descending sequential patterns
    constraint no_sequential{
        !(pin[1] == pin[0] +1 && pin[2] == pin[1] + 1 && pin[3] == pin[2] + 1);
        
        !(pin[1] == pin[0] -1 && pin[2] == pin[1] - 1 && pin[3] == pin[2] - 1);
    }

    // Method to randomize and display the PIN
    function void display();
        if (!this.randomize())
            $display("Randomization failed!");
        else begin
            $write("Random 4-digit pin (non-sequential): ");
            foreach (pin[i])
                $write("%0d", pin[i]);
            $display("");
        end
    endfunction
endclass

// Testbench
module tb_nonsequential_digit_pin;
    NonsequentialDigitPin value;
    initial begin
        value = new();
        // Generate 5 random PINs
        repeat(5) begin
            value.display();
        end
    end
endmodule
```
---

## Sample Output:
```text
Random 4-digit pin (non-sequential): 2694
Random 4-digit pin (non-sequential): 5114
Random 4-digit pin (non-sequential): 4216
Random 4-digit pin (non-sequential): 3444
Random 4-digit pin (non-sequential): 6697
```
---

## Observation:

All generated PINs contain digits within the valid range 0 to 9 and avoid strictly ascending or descending sequential patterns, confirming correct implementation of the non-sequential constraint.
