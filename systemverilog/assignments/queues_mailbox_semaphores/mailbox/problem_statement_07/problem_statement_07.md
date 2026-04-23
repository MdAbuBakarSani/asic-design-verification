# Problem 07: Blocking vs Non-Blocking Mailbox Operations

## Problem Statement:

Create a testbench to demonstrate **blocking and non-blocking mailbox operations** using:

- `get()` → blocking retrieval
- `try_get()` → non-blocking retrieval

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module mailbox_Method_demo;
  
  mailbox mb;
 
  int value1 = 3;
  int value2 = 5;

  initial begin
  
    // Create mailbox with capacity 2
    mb = new(2);
    $display("Mailbox created. Initial Count: %0d", mb.num());
    
    // Insert data
    mb.put(value1);
    $display("Put data: %0d | Count= %0d", value1, mb.num());
    
    mb.put(value2);
    $display("Put data: %0d | Count= %0d", value2, mb.num());
    
    // Blocking get
    mb.get(value1);
    $display("Recieved data: %0d | Count= %0d", value1, mb.num());
    
    // Non-blocking get
    if(mb.try_get(value2))
      $display("try_get(): %0d successfull | Count= %0d", value2, mb.num());
    else
      $display("try_get() failed - mailbox empty.");
  end
endmodule
```
---

## Sample Output:
```text
Mailbox created. Initial Count: 0

Put data: 3 | Count = 1

Put data: 5 | Count = 2

Received data: 3 | Count = 1

try_get(): 5 successful | Count = 0

```
---

## Observation:

The get() method blocks until data is available and successfully retrieves the first value. The try_get() method retrieves data without blocking and returns immediately based on mailbox state. This demonstrates the difference between blocking and non-blocking mailbox operations.
