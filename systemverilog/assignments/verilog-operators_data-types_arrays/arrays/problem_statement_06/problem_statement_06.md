# Problem 06: Dynamic Arrays for String and Integer

## Problem Statement:

Create **dynamic arrays** for:

- `string`
- `integer`

Initialize each of size 5 and assign some values

---

## Solution:
The solution is implemented as follows:
```systemverilog

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
```
---

## Sample Output:
```text
Dynamic Array Elements:

Name[0] = Micha, Result[0] = 87

Name[1] = Alice, Result[1] = 82

Name[2] = Emily, Result[2] = 97

Name[3] = Alexa, Result[3] = 78

Name[4] = Diana, Result[4] = 66
```
---

## Observation:

Dynamic arrays allow memory allocation at runtime using new[]. They provide flexibility in size management while maintaining structured access through indexing and iteration.
