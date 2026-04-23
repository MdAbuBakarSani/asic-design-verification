# Problem 03: Resource Sharing Using a Semaphore

## Problem Statement:

Design a **resource-sharing system** where multiple processes access a **shared resource** using a **semaphore**.

- Multiple tasks should request access to the same resource
- Only one task should access the resource at a time
- Use a semaphore to control access
- Display:
  - when each task starts using the resource
  - when each task finishes using the resource

---

## Solution:
The solution is implemented as follows:
```systemverilog



// Code your testbench here 
// or browse Examples 

module semaphore_shared_resource_demo;
 
  // Semaphore with 1 key for exclusive access
  semaphore sema = new(1);
  
  // Task that accesses shared resource
  task automatic shared_resource (string name);
   
    int id = 1;
    
    sema.get(1);    // Acquire resource
    $display("%s: Task %0d start at %0tns.", name, id, $time);
    
    #10;
  
    sema.put(1); // Release resource
    $display("%s: Task %0d end at %0tns.", name, id, $time);
  endtask
  
 
  initial begin
    
    // Multiple tasks try to access the same resource
    fork
      shared_resource ("Resource 1");
      shared_resource ("Resource 2");
      shared_resource ("Resource 3");
      shared_resource ("Resource 4");
      shared_resource ("Resource 5");
    join 
  end
endmodule
```
---

## Sample Output:
```text
Resource 1: Task 1 start at 0ns.

Resource 1: Task 1 end at 10ns.

Resource 2: Task 1 start at 10ns.

Resource 2: Task 1 end at 20ns.

Resource 3: Task 1 start at 20ns.

Resource 3: Task 1 end at 30ns.

Resource 4: Task 1 start at 30ns.

Resource 4: Task 1 end at 40ns.

Resource 5: Task 1 start at 40ns.

Resource 5: Task 1 end at 50ns.
```
---

## Observation:

The semaphore ensures mutual exclusion by allowing only one task at a time to access the shared resource. Even though all tasks are launched in parallel, they execute one after another because the semaphore has only one key.
