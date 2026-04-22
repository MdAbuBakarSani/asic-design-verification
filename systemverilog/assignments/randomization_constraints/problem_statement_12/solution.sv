// Code your testbench here 
// or browse Examples 

class Time24HourFormat;
 
  // Random variables
  rand int hour, minute;

  // Constraint block
  constraint range {
    
    // Valid hour range (24-hour format)
    hour inside {[0:23]};
  
    // Valid minute range
    minute inside {[0:59]};   
  }

  // Method to randomize and display time
  function void display();
    if(!this.randomize()) 
      $display("Randomization failed!");
    else
      $display("Random Time (24-hour format): %02d:%02d", hour, minute);
  endfunction
endclass

// Testbench
module tb_time_24_hour_format;
  Time24HourFormat obj;
  initial begin
    obj = new();
    // Generate 5 random times
    repeat(5) begin
      obj.display(); 
    end 
  end
endmodule
