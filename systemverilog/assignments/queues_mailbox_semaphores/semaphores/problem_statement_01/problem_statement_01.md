# Problem 01: Demonstrate Semaphores with Different Key Counts

## Problem Statement:

Create **semaphores** with different numbers of keys:

- Semaphore with **1 key**
- Semaphore with **2 keys**
- Semaphore with **4 keys**


---

## Solution:

```systemverilog

// Code your testbench here 
// or browse Examples 

module semaphore_demo;

  // Create semaphores with different key counts
  semaphore sema1 = new(1);
  semaphore sema2 = new(2);
  semaphore sema4 = new(4);
  
  // Task that uses a semaphore
  task automatic semaphore_task(string name, int id, semaphore sema);
   
    sema.get(1);    // Acquire 1 key
    $display("%s: Task %0d start at %0tns.", name, id, $time);
    
    #10;
  
    $display("%s: Task %0d end at %0tns.", name, id, $time);
    sema.put(1);   // Release key 
  endtask
  
  
  initial begin
  
    $display("Created semaphores with 1, 2, and 4 keys");
   
    fork
      // Semaphore with 1 key (mutual exclusion)
      semaphore_task("Sema1", 1, sema1); 
      semaphore_task("Sema1", 2, sema1);
     
      // Semaphore with 2 keys (2 tasks can run in parallel)
      semaphore_task("Sema2", 1, sema2);
      semaphore_task("Sema2", 2, sema2);
      semaphore_task("Sema2", 3, sema2);
     
      // Semaphore with 4 keys (up to 4 tasks concurrently)
      semaphore_task("Sema4", 1, sema4);
      semaphore_task("Sema4", 2, sema4); 
      semaphore_task("Sema4", 3, sema4);    
      semaphore_task("Sema4", 4, sema4); 
      semaphore_task("Sema4", 5, sema4);
    join
    
    #50; 
  end
endmodule
```
---

## Sample Output:
```text
Created semaphores with 1, 2, and 4 keys

Sema1: Task 1 start at 0ns.

Sema2: Task 1 start at 0ns.

Sema2: Task 2 start at 0ns.

Sema4: Task 1 start at 0ns.

Sema4: Task 2 start at 0ns.

Sema4: Task 3 start at 0ns.

Sema4: Task 4 start at 0ns.

Sema1: Task 1 end at 10ns.

Sema2: Task 1 end at 10ns.

Sema2: Task 2 end at 10ns.

Sema4: Task 1 end at 10ns.

Sema4: Task 2 end at 10ns.

Sema4: Task 3 end at 10ns.

Sema4: Task 4 end at 10ns.

Sema1: Task 2 start at 10ns.

Sema2: Task 3 start at 10ns.

Sema4: Task 5 start at 10ns.

Sema1: Task 2 end at 20ns.

Sema2: Task 3 end at 20ns.

Sema4: Task 5 end at 20ns.
```
---

## Observation:

The number of semaphore keys directly controls how many tasks can execute simultaneously. A semaphore with 1 key enforces strict mutual exclusion, while semaphores with multiple keys allow limited parallel execution, demonstrating controlled resource sharing.
