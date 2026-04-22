// Code your testbench here 
// or browse Examples 

class NoAdjacentOnes;

  // Random 8-bit value
  rand bit [7:0] value;

  // Constraint: no two adjacent bits should both be 1
  constraint rules {
    foreach (value[i]) {
      if (i < 7)
        !(value[i] && value[i+1]);
    }
  }

  // Method to randomize and display value
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else
      $display("Random 8-bit value with no adjacent 1's: %08b", value);
  endfunction
endclass

// Testbench
module tb;
  NoAdjacentOnes obj;
  initial begin
    obj = new();
    // Generate 5 random values
    repeat (5) begin
      obj.display();
    end
  end
endmodule
