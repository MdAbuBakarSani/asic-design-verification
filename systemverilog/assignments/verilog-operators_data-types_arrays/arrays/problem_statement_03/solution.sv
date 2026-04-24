// Code your testbench here 
// or browse Examples 

module Fixed_Array;

  // Fixed-size array with initialization
  int arr[4] = '{10, 20, 30, 40};

  initial begin

    $display("Fixed-size Array Elements:");

    // Display elements
    foreach (arr[i])
      $display("arr[%0d] = %0d", i, arr[i]);

  end
endmodule
