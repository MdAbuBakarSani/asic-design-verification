// Code your testbench here 
// or browse Examples 

module String_Compare;

  string str1 = "Verilog";
  string str2 = "SystemVerilog";
  int result;

  initial begin

    $display("String 1: %s", str1);
    $display("String 2: %s", str2);
    $display("Comparing between String 1 and String 2 --->");

    result = str1.compare(str2);

    if (result == 0)
      $display("Result: String 1 and String 2 are equal");
    else if (result < 0)
      $display("Result: String 1 is less than String 2");
    else
      $display("Result: String 1 is greater than String 2");

  end
endmodule
