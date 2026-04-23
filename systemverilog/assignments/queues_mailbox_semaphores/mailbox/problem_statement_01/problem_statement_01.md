# Problem 01: Transfer Mixed Data Types Using Mailbox

## Problem Statement:

Create a **SystemVerilog mailbox** to transfer different types of data between two processes:

- Integer (`int`)
- String (`string`)
- 8-bit data (`bit [7:0]`)


---

## Solution:

The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

module mailbox_mixed_data;

  // Create mailbox with size 3 
  mailbox mb = new(3);

  // Producer process
  task process_A();

    int value = 3;
    string name = "Example";
    bit [7:0] data = 8'b10101011;
   
    // Put data into mailbox
    mb.put(value);
    $display("Put data: %0d", value);
    
    mb.put(name);  
    $display("Put data: %s", name);
   
    mb.put(data);
    $display("Put data: %0d", data);
  endtask

  // Consumer process
  task process_B();

    int value;
    string name;
    bit [7:0] data;
    
    // Retrieve data from mailbox
    mb.get(value);
    $display("Retrieved data: %0d", value);
  
    mb.get(name);
    $display("Retrieved data: %s", name);
    
    mb.get(data);
    $display("Retrieved data: %0d", data);
  endtask

  
  initial begin
    // Run both processes in parallel
    fork
      process_A();
      process_B();
    join  
  end
endmodule
```
---

## Sample Output:
```text
Put data: 3
Put data: Example
Put data: 10101011

Retrieved data: 3
Retrieved data: Example
Retrieved data: 10101011
```
---

## Observation:

The mailbox successfully transfers multiple data types between parallel processes. Data is retrieved in the same order it was inserted, demonstrating FIFO behavior and proper synchronization using put() and get() operations.
