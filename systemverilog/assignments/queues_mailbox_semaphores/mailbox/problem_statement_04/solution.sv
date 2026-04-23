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
