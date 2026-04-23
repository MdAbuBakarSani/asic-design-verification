// Code your testbench here 
// or browse Examples 

module semaphore_mutual_exclusion_demo;
  
  // Semaphore with 1 key (ensures mutual exclusion)
  semaphore sema = new(1);

  
  task automatic mutual_exclusion (string name, int id);
   
    sema.get(1);     // Acquire key
    $display("%s [%0d] enters at %0tns.", name, id, $time);
   
    #10;
   
    sema.put(1);     // Release key
    $display("%s [%0d] exits at %0tns.", name, id, $time);
  endtask
  
  
  initial begin
  
    // Multiple tasks in parallel
    fork
      mutual_exclusion ("Resource", 1);
      mutual_exclusion ("Resource", 2);
      mutual_exclusion ("Resource", 3);
      mutual_exclusion ("Resource", 4);
      mutual_exclusion ("Resource", 5);
    join  
  end
endmodule
