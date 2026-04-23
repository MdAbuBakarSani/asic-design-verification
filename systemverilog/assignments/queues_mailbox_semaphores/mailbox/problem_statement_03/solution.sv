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
