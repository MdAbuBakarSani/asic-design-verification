# Problem 08: Task Scheduling Using Mailbox in FIFO Order

## Problem Statement:

Implement a **task scheduling mechanism** where tasks are sent to a **mailbox** and executed in **FIFO order**.

- Create task objects containing:
  - task name
  - task data
- Multiple senders should place tasks into the mailbox
- A scheduler/executor should retrieve tasks from the mailbox
- Tasks must be executed in the same order they are inserted
- Display:
  - when tasks are sent
  - when tasks are executed
  - simulation time for each event

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module task_scheduler_mailbox;

  // Task information class
  class taskinfo;
    string name;
    int data;
    
    function new(string n, int d);
      name = n;
      data= d;
    endfunction
  endclass

  
  // Typed mailbox to store taskinfo objects
  mailbox #(taskinfo)mb = new();

  
  // Producer task
  task automatic sent_task (string name, int value);
  
    int i, data; 
   
    for (i = 0; i <3; i++) begin
      taskinfo info = new(name, value + i);
     
      $display("%s Sending data: %0d at %0tns",info.name, info.data, $time);
     
      mb.put(info);          // Insert task into mailbox
     
      #2; 
    end
  endtask
    
  
  // Consumer / scheduler task
  task execute_task();
   
    taskinfo info;
    
    repeat(6) begin
      mb.get(info);      // Retrieve next task in FIFO order
     
      $display("Executing %s: %0d at %0tns", info.name, info.data, $time);
     
      #2;
    end
  endtask

 
  initial begin
    
    $display("Starting Task Scheduling Simulation...");
    
    // Run senders and executor in parallel
    fork
      sent_task("Task 1", 10);
      sent_task("Task 2", 20);
      execute_task();  
    join
   
    #10;
    $display("Task Scheduling Simulation Complete.");
  end
endmodule
```
---

## Sample Output:
```text
Starting Task Scheduling Simulation...

Task 1 Sending data: 10 at 0ns

Task 2 Sending data: 20 at 0ns

Executing Task 1: 10 at 0ns

Task 1 Sending data: 11 at 2ns

Task 2 Sending data: 21 at 2ns

Executing Task 2: 20 at 2ns

Task 1 Sending data: 12 at 4ns

Task 2 Sending data: 22 at 4ns

Executing Task 1: 11 at 4ns

Executing Task 2: 21 at 6ns

Executing Task 1: 12 at 8ns

Executing Task 2: 22 at 10ns

Task Scheduling Simulation Complete.
```
---

## Observation:

Tasks are executed in the same order they are inserted into the mailbox, confirming correct FIFO scheduling behavior. The typed mailbox also demonstrates safe transfer of class-based task objects between concurrent processes.
