# Problem 02: Demonstrate Queue Built-in Methods

## Problem Statement:

Write a SystemVerilog program to demonstrate various **queue built-in methods**:

- `size()`
- `insert()` at:
  - n/2 position
  - n position
  - n-1 position
  - n/n position
- `delete()`
- `pop_front()`
- `pop_back()`
- `push_front()`
- `push_back()`


---

## Solution:
The solution is implemented as follows:
```systemverilog


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
```
---

## Sample Output:
```text
Queue Initial Elements: '{10, 20, 30, 40, 50, 60}

Size of Queue = 6

After insert at n/2 position (index 3): '{10, 20, 30, 35, 40, 50, 60}

After insert at n position (index 6): '{10, 20, 30, 35, 40, 50, 80, 60}

After insert at n-1 position (index 5): '{10, 20, 30, 35, 40, 42, 50, 80, 60}

After insert at n/n position (index 1): '{10, 70, 20, 30, 35, 40, 42, 50, 80, 60}

After delete at index 2: '{10, 70, 30, 35, 40, 42, 50, 80, 60}

After pop_front: '{70, 30, 35, 40, 42, 50, 80, 60}

After pop_back: '{70, 30, 35, 40, 42, 50, 80}

After push_front: '{5, 70, 30, 35, 40, 42, 50, 80}

After push_back: '{5, 70, 30, 35, 40, 42, 50, 80, 70}
```
---

## Observation:

Queue operations dynamically modify the structure of the queue. Methods like insert() and delete() allow positional control, while push_front() and push_back() manage entry points. pop_front() and pop_back() remove elements from respective ends, demonstrating the flexibility of queues in data manipulation.
