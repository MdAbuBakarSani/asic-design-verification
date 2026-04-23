// Code your testbench here 
// or browse Examples 

module semaphore_synchronization_mechanism_demo;
  
  // Semaphore initialized with 0 keys 
  semaphore sema = new(0);
  

  // First process: sends signal
  task mechanism1(string name);
    $display("%s getting ready at %0tns.", name, $time);
 
    #10;
     
    sema.put(1);       
    $display("%s send signal at %0tns.", name, $time);
  endtask
    
 
  // Second process: waits for signal
  task mechanism2(string name);
    
    $display("%s waiting....", name);
    sema.get(1);        // Wait until signal is available
  
    #10;
    $display("%s recieved signal at %0tns.", name, $time);
 
    #10;
    $display("%s finished at %0tns.", name, $time); 
  endtask
  
  
  initial begin
   
    // Run both processes in parallel
    fork
      mechanism1 ("Mechanism 1");
      mechanism2 ("Mechanism 2");
    join
  end
endmodule
