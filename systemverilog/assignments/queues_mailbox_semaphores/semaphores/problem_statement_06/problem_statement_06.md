# Problem 06: Process Synchronization Using Semaphore

## Problem Statement:

Create a **synchronization mechanism** between two parallel processes using a **SystemVerilog semaphore**.

- One process (**Mechanism 1**) should perform some work and then signal completion
- Another process (**Mechanism 2**) should wait for that signal before proceeding
- Use a semaphore initialized with **0 keys** to enforce synchronization
- Display:
  - when the first process is ready
  - when the signal is sent
  - when the second process receives the signal and continues execution

---

## Solution:
The solution is implemented as follows:
```systemverilog

// Code your testbench here 
// or browse Examples 

module semaphore_synchronization_mechanism_demo;
  
  // Semaphore initialized with 0 keys 
  semaphore sema = new(0);
  

  // First process: sends signal
  task mechanism1(string name);
    $display("%s getting ready at %0tns.", name, $time);
 
    #10;
     
    sema.put(1);       
    $display("%s send signal at %0tns.", name, $time);
  endtask
    
 
  // Second process: waits for signal
  task mechanism2(string name);
    
    $display("%s waiting....", name);
    sema.get(1);        // Wait until signal is available
  
    #10;
    $display("%s recieved signal at %0tns.", name, $time);
 
    #10;
    $display("%s finished at %0tns.", name, $time); 
  endtask
  
  
  initial begin
   
    // Run both processes in parallel
    fork
      mechanism1 ("Mechanism 1");
      mechanism2 ("Mechanism 2");
    join
  end
endmodule
```
---

## Sample Output:
```text
Mechanism 1 getting ready at 0ns.

Mechanism 2 waiting....

Mechanism 1 send signal at 10ns.

Mechanism 2 received signal at 20ns.

Mechanism 2 finished at 30ns.
```
---

## Observation:

The semaphore acts as a synchronization signal between processes. The second process remains blocked until the first process releases a key, ensuring correct execution order and coordination between parallel threads.
