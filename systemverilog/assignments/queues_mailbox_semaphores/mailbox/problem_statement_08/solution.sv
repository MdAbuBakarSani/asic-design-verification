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
