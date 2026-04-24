// Code your testbench here 
// or browse Examples 

module Array_Reduction_Methods;

  // Integer array
  int int_arr[] = '{1, 2, 3, 4, 5};

  // Bit array
  bit [3:0] bit_arr[] = '{4'b1010, 4'b0110, 4'b0011};

  initial begin

    // Integer array operations
    $display("Original Statement of Integer Array is : %p", int_arr);

    $display("Sum of Integer Array is : %0d", int_arr.sum());
    $display("Product of Integer Array is : %0d", int_arr.product());

    // Bit array operations
    $display("Original Statement of Bit Array is : %p", bit_arr);

    $display("Bitwise AND of Bit Array is : %b", bit_arr.and());
    $display("Bitwise OR of Bit Array is : %b", bit_arr.or());
    $display("Bitwise XOR of Bit Array is : %b", bit_arr.xor());

  end
endmodule
