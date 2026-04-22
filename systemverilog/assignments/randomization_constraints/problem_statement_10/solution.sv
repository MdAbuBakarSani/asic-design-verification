// Code your testbench here 
// or browse Examples 

// Define mode type using enum
typedef enum { cold, hot } mode_type;

class TemperatureMode;

  // Random variables
  rand int temp;
  rand mode_type mode;

  // Constraint block
  constraint temp_constraints {   
    if (mode == cold)
      temp inside {[0:15]};
    else if (mode == hot)   
      temp inside {[30:45]};
  }

  // Method to randomize and display values
  function void display();
    if (!this.randomize())
      $display("Randomization failed!"); 
    else
      $display ("For mode %s the temperature is %0d", (mode == cold) ? "cold" : "hot", temp);
  endfunction
endclass

// Testbench
module tb_temp_mode;
  TemperatureMode obj; 
  initial begin
    obj = new();
    // Generate 7 random values
    repeat (7) begin
      obj.display();
    end
  end
endmodule
