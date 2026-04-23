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
