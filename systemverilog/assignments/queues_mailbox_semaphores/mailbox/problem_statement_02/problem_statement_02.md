# Problem 02: Demonstrate Mailbox Built-in Methods

## Problem Statement:

Implement and demonstrate the usage of **SystemVerilog mailbox built-in methods**:

- `new()` → create mailbox with size
- `num()` → check number of elements
- `put()` → insert data (blocking)
- `get()` → retrieve data (blocking)
- `try_put()` → insert data (non-blocking)
- `try_get()` → retrieve data (non-blocking)
- `peek()` → view next element without removing it


---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module mailbox_methods_demo;
  
  mailbox mb;

  int data1 = 10;
  int data2 = 20;
  int data3 = 30;   
 
  initial begin
    
    // Create mailbox with capacity 2
    mb = new (2);
    $display("Mailbox created. Initial count: %0d", mb.num());
    
    // Blocking put
    mb.put(data1);
    $display("Put data: %0d | count = %0d", data1, mb.num());
    
    mb.put(data2);
    $display("Put data: %0d | count = %0d", data2, mb.num());
    
    // Non-blocking put (should fail when full)
    if (!mb.try_put(data3)) 
      $display("Try put %0d failed - mailbox full. | count = %0d", data3, mb.num());
    else
      $display("Try put %0d success.", data3);
    
    // Peek without removing
    mb.peek(data1);
    $display("Peeked value: %0d | count = %0d", data1, mb.num());
        
    // Blocking get
    mb.get(data1);
    $display("Retrieved data: %0d | count = %0d", data1, mb.num());
        
    // Non-blocking get (success)
    if (mb.try_get(data2))
      $display("try_get(): %0d successfull. | count = %0d", data2, mb.num());
    else
      $display("try_get() failed - mailbox empty.");
    
    // Non-blocking get (should fail)
    if (mb.try_get(data3))
      $display("try_get(): %0d successfull. | count = %0d", data3, mb.num());
    else
      $display("try_get() failed - mailbox empty.");
  end
endmodule
```
---

## Sample Output:
```text
Mailbox created. Initial count: 0

Put data: 10 | count = 1

Put data: 20 | count = 2

Try put 30 failed - mailbox full. | count = 2

Peeked value: 10 | count = 2

Retrieved data: 10 | count = 1

try_get(): 20 successful. | count = 0

try_get() failed - mailbox empty.
```
---

## Observation:

The mailbox correctly demonstrates both blocking and non-blocking behaviors. put() and get() wait until operations succeed, while try_put() and try_get() return immediately based on mailbox state. The peek() method allows inspection without removing data, and num() accurately tracks the number of stored elements.
