// Code your testbench here 
// or browse Examples 

class Arrays;

  // Random array of 10 integers
  rand int arr[10];

  int total;

  // Constraint block
  constraint elements {
    foreach (arr[i]) arr[i] inside {[1:50]};      // Each element between 1 and 50
    (arr.sum()) < 300;                            // Sum of array elements less than 300
  }

  // Method to randomize and display values
  function void display();  
    if (!this.randomize())   
      $display ("Randomization failed!");
    else begin   
      total = arr.sum();
      $display ("Random array of 10 integers between 1 and 50: ");
      foreach (arr[i])
        $write ("%0d, ", arr[i]);
      $display("");
      $display("Total sum (less than 300) = %0d", total);
    end   
  endfunction
endclass

// Testbench
module tb_array;
  Arrays obj; 
  initial begin  
    obj = new(); 
    // Generate 5 different arrays
    repeat(5) begin
      obj.display();
    end
  end
endmodule
