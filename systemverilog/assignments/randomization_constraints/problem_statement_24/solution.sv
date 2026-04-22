// Code your testbench here 
// or browse Examples 

// Define name as enum
typedef enum {Alice, Bob, Diana, Charlie, Max}name_t;

class StudentProfile;

  // Random variables
  rand int age, marks;
  rand name_t name;
 
  // Constraint block
  constraint range_conditions{
    age inside {[15:25]};
    marks inside {[0:100]};
   
    // Conditional constraint
    if (age < 20) marks > 70;
  }
 
  // Method to randomize and display values
  function void display();
    if (!this.randomize()) 
      $display("Randomization failed!");
    else
      $display("Name: %p | Age: %0d | Marks: %0d",name, age, marks);
  endfunction
endclass

// Testbench
module tb;
  StudentProfile data;
  initial begin
    data = new();
    // Generate 15 student profiles
    repeat(15) begin
      data.display();
    end
  end
endmodule
