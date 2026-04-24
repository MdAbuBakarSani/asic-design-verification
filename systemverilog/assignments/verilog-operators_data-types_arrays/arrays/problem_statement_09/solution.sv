// Code your testbench here 
// or browse Examples 

module Array_Locator_Methods;

  int arr[10] = '{65, 92, 50, 44, 71, 80, 92, 42, 71, 65};
  int result[$];

  initial begin

    $display("Original Statements: %p", arr);

    // find() - elements greater than 60
    result = arr.find(x) with (x > 60);
    $display("Greater than 60 : %p", result);

    // find_index() - index of element exactly 80
    result = arr.find_index(item) with (item == 80);
    $display("Index of element 80 : %p", result);

    // find_first() - first element between 55 and 70
    result = arr.find_first(item) with (item >= 55 && item <= 70);
    $display("First element between 55 and 70 : %p", result);

    // find_first_index() - index of first element less than 50
    result = arr.find_first_index(x) with (x < 50);
    $display("Index of first < 50 : %p", result);

    // find_last() - last element greater than or equal to 80
    result = arr.find_last(item) with (item >= 80);
    $display("Find last element greater than or equal to 80 : %p", result);

    // find_last_index() - index of last element less than 50
    result = arr.find_last_index(x) with (x < 50);
    $display("Index of last < 50 : %p", result);

    // min()
    result = arr.min();
    $display("Minimum element : %p", result);

    // max()
    result = arr.max();
    $display("Maximum element : %p", result);

    // unique()
    result = arr.unique();
    $display("Unique elements : %p", result);

    // unique_index()
    result = arr.unique_index();
    $display("Indices of unique elements : %p", result);

  end
endmodule
