// Code your testbench here 
// or browse Examples 

module Packed_Union_Example;

  // Define packed union
 
  typedef union packed {
    bit [7:0] data_value;
  } data_union;

  // Declare instance
  data_union data;

  initial begin

    // Initialize value
    data.data_value = 8'b10110101;

    // Display result
    $display("Packed Union Elements:");
    $display("data_value = %b", data.data_value);

  end
endmodule
