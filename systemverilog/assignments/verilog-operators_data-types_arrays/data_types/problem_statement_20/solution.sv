// Code your testbench here 
// or browse Examples 

module Const_Parameter_Example #(
  parameter int WIDTH  = 8,
  parameter int HEIGHT = 4
);

  int area, volume;

  initial begin

    // Constant values (runtime constants)
    const int LENGTH = 8;
    const int DEPTH  = 3;

    // Calculations
    area   = WIDTH * HEIGHT;
    volume = LENGTH * DEPTH * HEIGHT;

    // Display
    $display("Parameter WIDTH  : %0d", WIDTH);
    $display("Parameter HEIGHT : %0d", HEIGHT);

    $display("Constant LENGTH  : %0d", LENGTH);
    $display("Constant DEPTH   : %0d", DEPTH);

    $display("Calculated area (WIDTH * HEIGHT) = (%0d * %0d) = %0d", WIDTH, HEIGHT, area);

    $display("Calculated volume (LENGTH * DEPTH * HEIGHT) = (%0d * %0d * %0d) = %0d", LENGTH, DEPTH, HEIGHT, volume);

  end
endmodule
