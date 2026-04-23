// Code your testbench here 
// or browse Examples 

module inter_thread_mailbox_tb;
  
  mailbox mb = new();
  
 
  task Thread_1();
   
    int i;
  
    for (i = 1; i <=5; i++) begin
    
      $display ("Thread 1 --> Sending data: %0d", i);
     
      mb.put(i);
     
      #7;
  
    end
 
  endtask
  
 
  task Thread_2();
   
    int data;
   
    #3;
    
    repeat(5) begin
     
      mb.get(data);
      
      $display("Thread 2 --> Data recieved: %0d", data);
   
    end

  endtask
  
  
  initial begin
   
    $display("Starting Inter-Thread Mailbox Communication Simulation...");
   
    fork
     
      Thread_1();
     
      Thread_2();
   
    join
    
    $display("Simulation successfully complete.");
 
  end

endmodule
