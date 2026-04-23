// Code your testbench here 
// or browse Examples 

module semaphore_demo;

  // Create semaphores with different key counts
  semaphore sema1 = new(1);
  semaphore sema2 = new(2);
  semaphore sema4 = new(4);
  
  // Task that uses a semaphore
  task automatic semaphore_task(string name, int id, semaphore sema);
   
    sema.get(1);    // Acquire 1 key
    $display("%s: Task %0d start at %0tns.", name, id, $time);
    
    #10;
  
    $display("%s: Task %0d end at %0tns.", name, id, $time);
    sema.put(1);   // Release key 
  endtask
  
  
  initial begin
  
    $display("Created semaphores with 1, 2, and 4 keys");
   
    fork
      // Semaphore with 1 key (mutual exclusion)
      semaphore_task("Sema1", 1, sema1); 
      semaphore_task("Sema1", 2, sema1);
     
      // Semaphore with 2 keys (2 tasks can run in parallel)
      semaphore_task("Sema2", 1, sema2);
      semaphore_task("Sema2", 2, sema2);
      semaphore_task("Sema2", 3, sema2);
     
      // Semaphore with 4 keys (up to 4 tasks concurrently)
      semaphore_task("Sema4", 1, sema4);
      semaphore_task("Sema4", 2, sema4); 
      semaphore_task("Sema4", 3, sema4);    
      semaphore_task("Sema4", 4, sema4); 
      semaphore_task("Sema4", 5, sema4);
    join
    
    #50; 
  end
endmodule
