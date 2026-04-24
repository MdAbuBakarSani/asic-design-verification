// Code your testbench here 
// or browse Examples 

module Static_Packed_Array;

  // 8x8 packed array (64 bits total)
  bit [7:0][7:0] array_8x8;

  initial begin

    $display("Static Packed Array Elements:");

    // Assign 64-bit value
    array_8x8 = 64'hFACE_B00C_DEAD_BEEF;

    // Display full value
    $display("array_8x8 = 0x%0h", array_8x8);

    // Display each 8-bit element
    foreach (array_8x8[i])
      $display("array_8x8[%0d] = %b (0x%0h)", i, array_8x8[i], array_8x8[i]);

  end
endmodule
