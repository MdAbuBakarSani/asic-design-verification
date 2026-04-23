// Code your testbench here 
// or browse Examples 

module semaphore_wait_resources_demo;
 
 // Semaphore with 4 available keys
  semaphore sema = new(4);
 
 // Function to define how many keys each procedure needs
  function int id_serial(int id);
    case (id)
      1: return 3;
      2: return 2;
      3: return 1;
      4: return 2;
      5: return 1;
      default: return 1;
    endcase
  endfunction
  
 
 // Task representing a process waiting for resources
  task automatic wait_resources (string name, int id);
   
    int ID = id_serial(id);
   
    $display("%s [%0d] requests %0d key(s) at %0t ns.", name, id, ID, $time);
   
   sema.get(ID);    
   
    $display("%s [%0d] ACQUIRED %0d at %0t ns.", name, id, ID, $time);
   
    #10;

   sema.put(ID);              
   
    $display("%s [%0d] RELEASED %0d at %0t ns.", name, id, ID, $time);
  endtask
  
  
  initial begin
    
    fork
      wait_resources ("Procedure", 1);
      wait_resources ("Procedure", 2);
      wait_resources ("Procedure", 3);
      wait_resources ("Procedure", 4);
      wait_resources ("Procedure", 5);
    join
  end
endmodule
