// Code your testbench here 
// or browse Examples 

module semaphore_shared_resource_demo;
 
  // Semaphore with 1 key for exclusive access
  semaphore sema = new(1);
  
  // Task that accesses shared resource
  task automatic shared_resource (string name);
   
    int id = 1;
    
    sema.get(1);    // Acquire resource
    $display("%s: Task %0d start at %0tns.", name, id, $time);
    
    #10;
  
    sema.put(1); // Release resource
    $display("%s: Task %0d end at %0tns.", name, id, $time);
  endtask
  
 
  initial begin
    
    // Multiple tasks try to access the same resource
    fork
      shared_resource ("Resource 1");
      shared_resource ("Resource 2");
      shared_resource ("Resource 3");
      shared_resource ("Resource 4");
      shared_resource ("Resource 5");
    join 
  end
endmodule
