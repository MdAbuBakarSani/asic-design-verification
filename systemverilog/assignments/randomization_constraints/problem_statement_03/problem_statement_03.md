# Problem 03: Generate 5 Unique Random Integers Between 1 and 20

## Problem Statement:

Write a **SystemVerilog class** that generates **5 unique random integers** between **1 and 20**.

- Generate **5 random numbers**
- Ensure all numbers are **unique**
- Restrict values to the range **1 to 20**
- Display the generated values

------

# Solution:

The solution is implemented as follows:

```systemverilog

// Code your testbench here 
// or browse Examples

class UniqueRandom5;

// === Array of 5 random integers ===
rand bit [4:0] arr[5];

// === Constraint block ===
constraint range {
    unique {arr};
    foreach (arr[i]) arr[i] inside {[1:20]};
}

// === Method to randomize and display the value ===    
function void display();
    if (!this.randomize())
        $display ("Randomization failed!");
    else begin
        $display ("5 unique random numbers between 1 to 20");
        foreach (arr[i])
        $write ("%0d, ", arr[i]);
        $display("");
    end
endfunction
endclass

// === Testbench ===
module tb_unique_random_5;
UniqueRandom5 values;
    initial begin
        values = new();

// === Generate 5 different sets ===
        repeat(5) begin
        values.display();
    end
end
endmodule
