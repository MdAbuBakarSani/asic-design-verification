// Code your testbench here 
// or browse Examples 

class OddAscendingArray;

  // Random array of 4 integers
  rand int arr[4];

  // Constraint block
  constraint rules{
    
    // Range constraint (optional but keeps values reasonable)
    foreach (arr[i]) arr[i] inside {[1:49]};
    
    // Ensure all elements are odd
    foreach (arr[i]) arr[i] % 2 == 1;
  
    // Ascending order constraints
    arr[0] < arr[1];
    arr[1] < arr[2];
    arr[2] < arr[3];
  }

  // Method to randomize and display array
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else begin
      $write("Random 4-element Odd Ascending Array: ");
      foreach (arr[i])
        $write("%0d, ", arr[i]);
      $display("");
    end
  endfunction
endclass

// Testbench
module tb;
  OddAscendingArray obj;
  initial begin
    obj = new();
    // Generate 5 arrays
    repeat(5) begin
      obj.display();
    end
  end
endmodule
