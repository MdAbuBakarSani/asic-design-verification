// Code your testbench here 
// or browse Examples



class Array;

  rand int arr[5];

  constraint range{
    
    foreach (arr[i]) arr[i] inside {[21:79]};

  }

  function void display();
   
    if (!this.randomize())
      
      $display("Randomization failed!");
    
    else begin
      
      $display("Randomized array with elements greater than 20 and less than 80: ");
       
      foreach (arr[i])
      
        $write("%0d ", arr[i]);
      
      $display("");
   
    end

  endfunction

endclass


module tb_array;

  Array elements;
  
  initial begin
    
    elements = new();
     
    repeat(5) begin
      
      elements.display();
      
    end
    
  end

endmodule
