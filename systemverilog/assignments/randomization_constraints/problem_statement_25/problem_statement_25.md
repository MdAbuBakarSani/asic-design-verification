

// Code your testbench here 
// or browse Examples 

class Unique6ElementsArray;

  // Random array of 6 integers
  rand int arr [6];
 
  // Constraint block
  constraint range{

    // All elements must be unique
    unique {arr};    
    
    // Each element must be between 10 and 20 
    foreach (arr[i]) arr[i] inside {[10:20]};
  }
 
  // Method to randomize and display array
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else begin
      $display("Randomized array of 6 elements: ");
      foreach (arr[i])
        $write("%0d ", arr[i]);
      $display("");
    end
  endfunction
endclass

// Testbench
module tb;
  Unique6ElementsArray obj;
  initial begin
    obj = new();
    // Generate 5 random arrays
    repeat(5) begin
      obj.display();
    end
  end
endmodule
