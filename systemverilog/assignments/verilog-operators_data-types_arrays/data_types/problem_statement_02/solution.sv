// Code your testbench here 
// or browse Examples

module Blocking_NonBlocking_Example;

  reg a, b, c;
  reg x, y, z;

  initial begin

    // Blocking assignment
    a = 1;
    b = a;
    c = b;

    $display("Blocking Assignments:");
    $display("a = %b, b = %b, c = %b", a, b, c);

    // Non-blocking assignment
    #1;
    x <= 1;
    y <= x;
    z <= y;

    #1;
    $display("Non-Blocking Assignments:");
    $display("x = %b, y = %b, z = %b", x, y, z);

  end
endmodule
