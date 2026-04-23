// Code your testbench here 
// or browse Examples 

module Queue_Methods;

  int queue[$];
  int n;

  initial begin

    // Initial queue elements
    queue.push_back(10);
    queue.push_back(20);
    queue.push_back(30);
    queue.push_back(40);
    queue.push_back(50);
    queue.push_back(60);

    $display("Queue Initial Elements: %p", queue);

    // Size
    n = queue.size();
    $display("Size of Queue = %0d", n);

    // Insert at n/2 position
    queue.insert(n/2, 35);
    $display("After insert at n/2 position (index %0d): %p", n/2, queue);

    // Insert at n position
    queue.insert(n, 80);
    $display("After insert at n position (index %0d): %p", n, queue);

    // Insert at n-1 position
    queue.insert(n-1, 42);
    $display("After insert at n-1 position (index %0d): %p", n-1, queue);

    // Insert at n/n position
    queue.insert(n/n, 70);
    $display("After insert at n/n position (index %0d): %p", n/n, queue);

    // Delete element at index 2
    queue.delete(2);
    $display("After delete at index 2: %p", queue);

    // pop_front
    queue.pop_front();
    $display("After pop_front: %p", queue);

    // pop_back
    queue.pop_back();
    $display("After pop_back: %p", queue);

    // push_front
    queue.push_front(5);
    $display("After push_front: %p", queue);

    // push_back
    queue.push_back(70);
    $display("After push_back: %p", queue);

  end
endmodule
