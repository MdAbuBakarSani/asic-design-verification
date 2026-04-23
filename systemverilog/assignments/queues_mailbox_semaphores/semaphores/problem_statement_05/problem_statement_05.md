# Problem 05: Waiting for Resources Using Semaphore Keys

## Problem Statement:

Implement a scenario where different processes wait for resources using a **SystemVerilog semaphore** and execute only when enough resources are available.

- Create a semaphore with a fixed number of keys
- Different procedures should request different numbers of keys
- A procedure should execute only after acquiring the required keys
- After execution, the procedure should release the keys
- Display:
  - when a procedure requests keys
  - when it acquires keys
  - when it releases keys

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module semaphore_wait_resources_demo;
 
 // Semaphore with 4 available keys
  semaphore sema = new(4);
 
 // Function to define how many keys each procedure needs
  function int id_serial(int id);
    case (id)
      1: return 3;
      2: return 2;
      3: return 1;
      4: return 2;
      5: return 1;
      default: return 1;
    endcase
  endfunction
  
 
 // Task representing a process waiting for resources
  task automatic wait_resources (string name, int id);
   
    int ID = id_serial(id);
   
    $display("%s [%0d] requests %0d key(s) at %0t ns.", name, id, ID, $time);
   
   sema.get(ID);    
   
    $display("%s [%0d] ACQUIRED %0d at %0t ns.", name, id, ID, $time);
   
    #10;

   sema.put(ID);              
   
    $display("%s [%0d] RELEASED %0d at %0t ns.", name, id, ID, $time);
  endtask
  
  
  initial begin
    
    fork
      wait_resources ("Procedure", 1);
      wait_resources ("Procedure", 2);
      wait_resources ("Procedure", 3);
      wait_resources ("Procedure", 4);
      wait_resources ("Procedure", 5);
    join
  end
endmodule
```
---

## Sample Output:
```text
Procedure [1] requests 3 key(s) at 0 ns.

Procedure [1] ACQUIRED 3 at 0 ns.

Procedure [2] requests 2 key(s) at 0 ns.

Procedure [3] requests 1 key(s) at 0 ns.

Procedure [3] ACQUIRED 1 at 0 ns.

Procedure [4] requests 2 key(s) at 0 ns.

Procedure [5] requests 1 key(s) at 0 ns.

Procedure [1] RELEASED 3 at 10 ns.

Procedure [3] RELEASED 1 at 10 ns.

Procedure [2] ACQUIRED 2 at 10 ns.

Procedure [4] ACQUIRED 2 at 10 ns.

Procedure [2] RELEASED 2 at 20 ns.

Procedure [4] RELEASED 2 at 20 ns.

Procedure [5] ACQUIRED 1 at 20 ns.

Procedure [5] RELEASED 1 at 30 ns.
```
---

## Observation:

Processes acquire resources only when enough semaphore keys are available. Procedures requesting fewer keys may execute earlier than others depending on current availability, demonstrating controlled scheduling and resource-based synchronization using semaphores.
