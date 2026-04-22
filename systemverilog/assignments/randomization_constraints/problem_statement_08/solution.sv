// Code your testbench here 
// or browse Examples 

class AlphaNumericString;

  // Random array of 6 characters
  rand byte str [6];

  // Constraint block
  constraint range {
    foreach (str[i]) 
      str[i] inside {[48:57], [65:90], [97:122]};    // Allow only digits, uppercase, and lowercase characters
  }

  // Method to randomize and display string
  function void display();  
    if (!this.randomize()) 
      $display("Randomization failed!");
    else begin 
      $display("Random 6-character alphaneumeric string: ");

      // Print characters one by one
      foreach (str[i])
        $write("%c", str[i]);
      $display("");
    end
  endfunction
endclass


// Testbench
module tb_alpha_neumeric_string;
  AlphaNumericString character;
  initial begin
    character = new();
    // Generate 5 random strings 
    repeat(5) begin
      character.display();
    end
  end
endmodule
