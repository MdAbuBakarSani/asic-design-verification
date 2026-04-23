# Problem 05: Inter-Thread Communication Using Mailbox

## Problem Statement:

Create a **testbench** to demonstrate **inter-thread communication** using a **SystemVerilog mailbox**:

- One thread (**Thread 1**) sends data into the mailbox
- Another thread (**Thread 2**) receives data from the mailbox
- Use parallel execution to simulate real-time communication
- Display:
  - When data is sent
  - When data is received

---

## Solution:

```systemverilog


// Code your testbench here 
// or browse Examples 

module inter_thread_mailbox_tb;
  
  // Unbounded mailbox
  mailbox mb = new();

  // Thread 1: Producer
  task Thread_1();
   
    int i;
  
    for (i = 1; i <=5; i++) begin
      $display ("Thread 1 --> Sending data: %0d", i);
     
      mb.put(i);         // Send data
     
      #7;         // Delay between sends
    end
  endtask

  
  // Thread 2: Consumer
  task Thread_2();
   
    int data;
   
    #3;       // Start slightly later
    
    repeat(5) begin  
      mb.get(data);     // Receive data
      
      $display("Thread 2 --> Data recieved: %0d", data);
    end
  endtask
  
  
  initial begin
   
    $display("Starting Inter-Thread Mailbox Communication Simulation...");
  
    // Run both threads in parallel
    fork
      Thread_1();
      Thread_2();
    join
    
    $display("Simulation successfully complete.");
  end
endmodule
```
---

## Sample Output:
```text
Starting Inter-Thread Mailbox Communication Simulation...

Thread 1 --> Sending data: 1

Thread 2 --> Data received: 1

Thread 1 --> Sending data: 2

Thread 2 --> Data received: 2

Thread 1 --> Sending data: 3

Thread 2 --> Data received: 3

Thread 1 --> Sending data: 4

Thread 2 --> Data received: 4

Thread 1 --> Sending data: 5

Thread 2 --> Data received: 5

Simulation successfully complete.
```
---

## Observation:

The mailbox enables synchronized communication between two parallel threads. Data sent by Thread 1 is received in the same order by Thread 2, demonstrating FIFO behavior and proper inter-thread coordination using put() and get().

