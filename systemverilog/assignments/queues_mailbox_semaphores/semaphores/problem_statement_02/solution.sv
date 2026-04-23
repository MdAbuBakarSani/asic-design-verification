// Code your testbench here 
// or browse Examples 

module semaphore_method_demo;

  // Create semaphores
  semaphore sema1 = new(1);
  semaphore sema2 = new(2);
  
  initial begin 
  
    int id = 0;
  
    // Blocking get
    sema1.get(1);
    $display("Sema1: Task %0d start at %0tns.", id, $time);
  
    #10;
   
    sema1.put(1);
    $display("Sema1: Task %0d end at %0tns.", id, $time);

    // Non-blocking get
    if (sema2.try_get(2)) begin
      $display("Sema2 (try_get()): Task %0d start at %0tns.", id, $time);
    
      #10;
      
      sema2.put(2);
      $display("Sema2: Task %0d end at %0tns.", id, $time);
     
    end else begin
      $display("Sema2 (try_get()) failed!"); 
    end   
    $finish;
  end
endmodule
