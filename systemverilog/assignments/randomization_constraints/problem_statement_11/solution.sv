// Code your testbench here 
// or browse Examples 

class OrderedABC;

  // Random variables
  rand int a, b, c;
 
  // Constraint block
  constraint range {
   
    // Range constraints
    a inside {[1:50]};
    b inside {[1:50]};
    c inside {[1:50]};

    // Ordering constraints
    a < b;
    b < c;
  }

  // Method to randomize and display values  
  function void display();
    if (!this.randomize())
      $display("Randomization failed!");
    else
      $display("a = %0d < b = %0d < c = %0d", a, b, c);
  endfunction
endclass

// Testbench
module tb_ordered_abc;
  OrderedABC obj;
  initial begin
    obj = new();
    // Generate 5 ordered sets
    repeat(5) begin
      obj.display();
    end
  end
endmodule
