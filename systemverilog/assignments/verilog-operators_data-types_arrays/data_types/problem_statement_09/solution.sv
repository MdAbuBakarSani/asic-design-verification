// Code your testbench here 
// or browse Examples 

module Replace_Letters;

  string original = "systemverilog";
  string modified = "";
  byte ch;

  initial begin

    for (int i = 0; i < original.len(); i++) begin
      ch = original[i];

      if (ch == "s")
        ch = "S";
      else if (ch == "v")
        ch = "V";
      else if (ch == "t")
        ch = "T";

      modified = {modified, ch};
    end

    $display("Original string: %s", original);
    $display("Modified string: %s", modified);

  end
endmodule
