// Code your testbench here 
// or browse Examples 

module Static_Unpacked_Array;

  // 2D unpacked array (8x8)
  bit array_8x8 [7:0][7:0];

  initial begin

    $display("Static Unpacked Array Elements:");

    // Assign random values (0 or 1)
    foreach (array_8x8[i]) begin
      foreach (array_8x8[i][j]) begin
        array_8x8[i][j] = $urandom_range(0, 1);

        $display("array_8x8[%0d][%0d] = %0b", i, j, array_8x8[i][j]);
      end
    end

    // Full array display
    $display("array_8x8 = %p", array_8x8);

  end
endmodule
