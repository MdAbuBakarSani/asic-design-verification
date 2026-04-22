// Code your testbench here 
// or browse Examples

class Array;

  // Random array of 5 integers
  rand int arr[5];

  // Constraint block
  constraint range{
    foreach (arr[i]) arr[i] inside {[21:79]};       // Each element must be between 21 and 79
  }

  // Method to randomize and display array
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

// Testbench
module tb_array;
  Array elements;
  initial begin
    elements = new();
    // Generate 5 arrays
    repeat(5) begin 
      elements.display(); 
    end
  end
endmodule
