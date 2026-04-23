# Problem 06: Multi-Threaded Communication with Multiple Producers and One Consumer

## Problem Statement:

Implement a **multi-threaded communication system** using a **SystemVerilog mailbox** where:

- Multiple **producers** send data into the mailbox
- A single **consumer** receives data from the mailbox
- Use parallel execution to simulate concurrent activity
- Display:
  - Which producer sends which data
  - What the consumer receives

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module multi_thread_mailbox_communication;

  // Unbounded mailbox
  mailbox mb = new();
  
  // Producer task
  task automatic A (string name, int base_data);
   
    int i, data;
   
    for (i = 0; i < 3; i++) begin
      data = base_data + i;
     
      $display("%s Sending data: %0d", name, data);
     
      mb.put(data);       // Send data to mailbox
     
      #5;      // Delay between sends
    end
  endtask

  
  // Consumer task
  task B ();
    
    int data;
    
    repeat(9) begin
      mb.get(data);       // Receive data from mailbox
     
      $display("Consumer received data: %0d", data);
     
      #2;      // Delay to simulate processing
    end
  endtask
  
  
  initial begin
    
    $display("Starting Multi-Thread Mailbox Simulation....");
   
    // Run multiple producers and one consumer in parallel
    fork
      A ("Person 1", 10);
      A ("Person 2", 100);
      A ("Person 3", 1000);
      B();
    join
   
    #20;
    $display("Simulation successfully completed.");
  end
endmodule
```
---

## Sample Output:
```text
Starting Multi-Thread Mailbox Simulation....

Person 1 Sending data: 10

Person 2 Sending data: 100

Person 3 Sending data: 1000

Consumer received data: 10

Consumer received data: 100

Consumer received data: 1000

Person 1 Sending data: 11

Person 2 Sending data: 101

Person 3 Sending data: 1001

Consumer received data: 11

Consumer received data: 101

Person 1 Sending data: 12

Person 2 Sending data: 102

Person 3 Sending data: 1002

Consumer received data: 1001

Consumer received data: 12

Consumer received data: 102

Consumer received data: 1002

Simulation successfully completed.
```
---

## Observation:

The mailbox successfully handles concurrent communication from multiple producers to a single consumer. All transmitted data is received through the shared mailbox, demonstrating safe inter-thread communication and FIFO-based message passing.

