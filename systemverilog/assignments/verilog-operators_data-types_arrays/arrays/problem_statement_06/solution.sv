// Code your testbench here 
// or browse Examples 

module Dynamic_Array_Example;

  // Dynamic arrays
  string names[];
  int    result[];

  initial begin

    // Allocate memory
    names  = new[5];
    result = new[5];

    // Assign values
    names[0] = "Micha";   result[0] = 87;
    names[1] = "Alice";   result[1] = 82;
    names[2] = "Emily";   result[2] = 97;
    names[3] = "Alexa";   result[3] = 78;
    names[4] = "Diana";   result[4] = 66;

    // Display values
    $display("Dynamic Array Elements:");

    foreach (names[i])
      $display("Name[%0d] = %s, Result[%0d] = %0d", i, names[i], i, result[i]);

  end
endmodule
