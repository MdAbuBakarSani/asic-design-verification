# Semaphore Problem 02: Demonstrate Semaphore Built-in Methods

## Problem Statement:

Implement and demonstrate the usage of **SystemVerilog semaphore built-in methods**:

- `new()` → create semaphore with a specific number of keys
- `get()` → acquire keys (blocking)
- `try_get()` → acquire keys (non-blocking)
- `put()` → release keys


---

## Solution:
The solution is implemented as follows:
```systemverilog



// Code your testbench here 
// or browse Examples 

module semaphore_method_demo;

  // Create semaphores
  semaphore sema1 = new(1);
  semaphore sema2 = new(2);
  
  initial begin 
  
    int id = 0;
  
    // Blocking get
    sema1.get(1);
    $display("Sema1: Task %0d start at %0tns.", id, $time);
  
    #10;
   
    sema1.put(1);
    $display("Sema1: Task %0d end at %0tns.", id, $time);

    // Non-blocking get
    if (sema2.try_get(2)) begin
      $display("Sema2 (try_get()): Task %0d start at %0tns.", id, $time);
    
      #10;
      
      sema2.put(2);
      $display("Sema2: Task %0d end at %0tns.", id, $time);
     
    end else begin
      $display("Sema2 (try_get()) failed!"); 
    end   
    $finish;
  end
endmodule
```
---

## Sample Output:
```text
Sema1: Task 0 start at 0ns.

Sema1: Task 0 end at 10ns.

Sema2 (try_get()): Task 0 start at 10ns.

Sema2: Task 0 end at 20ns.
```
---

## Observation:

The get() method blocks until the required keys are available, ensuring exclusive access. The try_get() method attempts to acquire keys without waiting and proceeds only if sufficient keys are available. This demonstrates the difference between blocking and non-blocking semaphore operations.
