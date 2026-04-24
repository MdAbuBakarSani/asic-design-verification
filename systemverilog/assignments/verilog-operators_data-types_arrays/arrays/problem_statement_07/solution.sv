// Code your testbench here 
// or browse Examples 

module Dynamic_Array_Example;

  int arr[];

  initial begin

    // Allocate memory
    arr = new[5];

    // Assign values
    arr = '{5, 10, 15, 20, 25};

    // Display elements
    $display("Array Elements:");
    foreach (arr[i])
      $display("Array[%0d] = %0d", i, arr[i]);

    // Display size
    $display("Size of the array is: %0d", arr.size());

    // Delete array
    arr.delete();

    // Display size after delete
    $display("Size of the array after delete: %0d", arr.size());

  end
endmodule
