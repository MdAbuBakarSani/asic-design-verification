// Code your testbench here 
// or browse Examples 

module Logic_Assignments;

  logic a, b;
  logic blocking_assignment;
  logic nonblocking_assignment;

  // Continuous assignment
  assign a = 1'b1;
  assign b = 1'b0;

  initial begin

    $display("Continuous, Blocking and Non-blocking Assignments in SystemVerilog");
    $display("Input Values: a = %b, b = %b", a, b);

    // Blocking Assignment
    blocking_assignment = a | b;
    $display("Blocking Assignment : a | b = %b", blocking_assignment);

    #1;

    // Non-blocking Assignment
    nonblocking_assignment <= a ^ b;

    #1;
    $display("NonBlocking Assignment : a ^ b = %b", nonblocking_assignment);

  end
endmodule
