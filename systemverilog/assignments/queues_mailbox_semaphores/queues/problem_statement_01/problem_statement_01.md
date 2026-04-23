# Problem 01: Create Queues for String, Integer and `bit [3:0]`

## Problem Statement:

Create separate **queues** for the following data types:

- `string`
- `integer`
- `bit [3:0]`


---

## Solution:
The solution is implemented as follows:
```systemverilog
// Code your testbench here 
// or browse Examples 

module Queue_Data_Types;

  // Declare queues of different data types
  string  str_queue[$];
  integer int_queue[$];
  bit [3:0] bit_queue[$];

  initial begin

    // String queue
    str_queue.push_back("Book");
    str_queue.push_back("Pencil");
    str_queue.push_back("Eraser");

    // Integer queue
    int_queue.push_back(100);
    int_queue.push_back(200);
    int_queue.push_back(300);

    // Bit queue
    bit_queue.push_back(4'b0101);
    bit_queue.push_back(4'b1010);
    bit_queue.push_back(4'b0111);

    // Display string queue
    $display("String Queue:");
    foreach (str_queue[i])
      $display("[%0d] = %s", i, str_queue[i]);

    // Display integer queue
    $display("Integer Queue:");
    foreach (int_queue[i])
      $display("[%0d] = %0d", i, int_queue[i]);

    // Display bit queue
    $display("Bit Queue:");
    foreach (bit_queue[i])
      $display("[%0d] = %b", i, bit_queue[i]);
  end
endmodule
```
---

## Sample Output:
```text
String Queue:
[0] = Book
[1] = Pencil
[2] = Eraser

Integer Queue:
[0] = 100
[1] = 200
[2] = 300

Bit Queue:
[0] = 0101
[1] = 1010
[2] = 0111
```
---

## Observation:

The queues successfully store different data types independently. Using push_back() inserts elements in order, and foreach allows easy iteration and display of all queue contents with their indices.
