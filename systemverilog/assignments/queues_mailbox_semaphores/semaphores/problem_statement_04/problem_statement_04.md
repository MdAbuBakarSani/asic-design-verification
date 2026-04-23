# Problem 04: Demonstrate Mutual Exclusion Using Semaphore

## Problem Statement:

Write a **testbench** to demonstrate **mutual exclusion** using a **SystemVerilog semaphore**.

- Multiple tasks attempt to access a shared resource
- Only one task should be allowed inside the critical section at a time
- Use a semaphore with a single key
- Display:
  - when a task enters the critical section
  - when a task exits the critical section

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module semaphore_mutual_exclusion_demo;
  
  // Semaphore with 1 key (ensures mutual exclusion)
  semaphore sema = new(1);

  
  task automatic mutual_exclusion (string name, int id);
   
    sema.get(1);     // Acquire key
    $display("%s [%0d] enters at %0tns.", name, id, $time);
   
    #10;
   
    sema.put(1);     // Release key
    $display("%s [%0d] exits at %0tns.", name, id, $time);
  endtask
  
  
  initial begin
  
    // Multiple tasks in parallel
    fork
      mutual_exclusion ("Resource", 1);
      mutual_exclusion ("Resource", 2);
      mutual_exclusion ("Resource", 3);
      mutual_exclusion ("Resource", 4);
      mutual_exclusion ("Resource", 5);
    join  
  end
endmodule
```
---

## Sample Output:
```text
Resource [1] enters at 0ns.

Resource [1] exits at 10ns.

Resource [2] enters at 10ns.

Resource [2] exits at 20ns.

Resource [3] enters at 20ns.

Resource [3] exits at 30ns.

Resource [4] enters at 30ns.

Resource [4] exits at 40ns.

Resource [5] enters at 40ns.

Resource [5] exits at 50ns.
```
---

## Observation:

The semaphore enforces strict mutual exclusion by allowing only one task to enter the critical section at a time. Even though all tasks are initiated concurrently, they execute sequentially, ensuring safe access to the shared resource.
