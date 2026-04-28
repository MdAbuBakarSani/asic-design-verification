// Code your testbench here 
// or browse Examples 

module Increment_Decrement_Operators;

  int a = 7;

  initial begin

    $display("Increment Decrement Operators in SystemVerilog");
    $display("Initial value: a = %0d", a);

    // Post-Increment
    a++;
    $display("After Post-Increment : a = %0d", a);

    // Pre-Increment
    ++a;
    $display("After Pre-Increment : a = %0d", a);

    // Post-Decrement
    a--;
    $display("After Post-Decrement : a = %0d", a);

    // Pre-Decrement
    --a;
    $display("After Pre-Decrement : a = %0d", a);

  end
endmodule
