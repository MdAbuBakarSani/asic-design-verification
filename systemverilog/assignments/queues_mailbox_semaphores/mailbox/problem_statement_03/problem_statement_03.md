# Problem 03: Producer-Consumer Model Using Mailbox

## Problem Statement:

Implement a **Producer-Consumer model** using a **SystemVerilog mailbox**:

- A **producer** generates data and sends it to the mailbox
- A **consumer** retrieves data from the mailbox
- Use a **bounded mailbox** to demonstrate synchronization
- Display:
  - When data is sent
  - When data is received
  - Current mailbox count

---

## Solution:
The solution is implemented as follows:
```systemverilog


// Code your testbench here 
// or browse Examples 

module mailbox_producer_consumer_model;
 
  // Mailbox with capacity 3
  mailbox mb = new(3);
  
  // Producer task
  task producer();
  
    int i;
   
    for (i = 1; i <=5; i++) begin
      $display ("[Producer] Trying to send: %0d", i);
    
      mb.put(i);     // Blocking if mailbox is full   
      $display ("[Producer] Sent: %0d  | Mailbox count: %0d", i, mb.num());
    
      #2;            // Delay to simulate production time  
    end
  endtask

  
  // Consumer task
  task consumer();
   
    int data;
   
    repeat(5) begin 
      #7;               // Delay to simulate consumption time
     
      mb.get(data);     // Blocking if mailbox is empty
      $display ("[Consumer] Recieved: %0d  | Mailbox count: %0d", data, mb.num());   
    end
  endtask
  
 
  initial begin
    $display ("Starting Producer-Consumer Mailbox Model Simulation: ");
    
    // Run producer and consumer in parallel
    fork
      producer();
      consumer();
    join
   
    $display ("Simulation Successfully complete.");
  end
endmodule
```
---

## Sample Output:
```text
Starting Producer-Consumer Mailbox Model Simulation:

[Producer] Trying to send: 1

[Producer] Sent: 1 | Mailbox count: 1

[Producer] Trying to send: 2

[Producer] Sent: 2 | Mailbox count: 2

[Producer] Trying to send: 3

[Producer] Sent: 3 | Mailbox count: 3

[Producer] Trying to send: 4

[Consumer] Received: 1 | Mailbox count: 3

[Producer] Sent: 4 | Mailbox count: 3

[Producer] Trying to send: 5

[Consumer] Received: 2 | Mailbox count: 3

[Producer] Sent: 5 | Mailbox count: 3

[Consumer] Received: 3 | Mailbox count: 2

[Consumer] Received: 4 | Mailbox count: 1

[Consumer] Received: 5 | Mailbox count: 0

Simulation successfully complete.
```
---

## Observation:

The mailbox ensures proper synchronization between producer and consumer. When the mailbox is full, the producer blocks until space becomes available, and when it is empty, the consumer waits for data. This demonstrates correct FIFO behavior and blocking communication using put() and get().
