// Code your testbench here 
// or browse Examples 

module String_Operators;

  string str1 = "System";
  string str2 = "Verilog";
  string str3;
  byte index;

  initial begin

    $display("String Operations in SystemVerilog");

    // Equality
    $display("Equality (str1 == str2): %0b", (str1 == str2));

    // Inequality
    $display("Inequality (str1 != str2): %0b", (str1 != str2));

    // Comparison
    $display("Comparison (str1 < str2): %0b", (str1 < str2));
    $display("Comparison (str1 > str2): %0b", (str1 > str2));

    // Concatenation
    str3 = {str1, str2};
    $display("Concatenation (str1 + str2): %s", str3);

    // Replication
    str3 = {3{str1}};
    $display("Replication (3 times str1): %s", str3);

    // Indexing
    index = str1[3];
    $display("Indexing (str1[3]): %s", index);

  end
endmodule
