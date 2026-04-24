// Code your testbench here 
// or browse Examples 

module Array_Ordering_Methods;

  int arr[8] = '{76, 26, 40, 13, 8, 66, 84, 57};

  initial begin

    $display("Original Statements: %p", arr);

    // reverse() – reverses the array
    arr.reverse();
    $display("After reverse : %p", arr);

    // sort() – sorts in ascending order
    arr.sort();
    $display("After sort : %p", arr);

    // rsort() – sorts in descending order
    arr.rsort();
    $display("After rsort : %p", arr);

    // shuffle() – randomizes the order
    arr.shuffle();
    $display("After shuffle : %p", arr);

  end
endmodule
