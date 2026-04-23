// Code your testbench here 
// or browse Examples 

module mailbox_mixed_data;

  // Create mailbox with size 3 
  mailbox mb = new(3);

  // Producer process
  task process_A();

    int value = 3;
    string name = "Example";
    bit [7:0] data = 8'b10101011;
   
    // Put data into mailbox
    mb.put(value);
    $display("Put data: %0d", value);
    
    mb.put(name);  
    $display("Put data: %s", name);
   
    mb.put(data);
    $display("Put data: %0d", data);
  endtask

  // Consumer process
  task process_B();

    int value;
    string name;
    bit [7:0] data;
    
    // Retrieve data from mailbox
    mb.get(value);
    $display("Retrieved data: %0d", value);
  
    mb.get(name);
    $display("Retrieved data: %s", name);
    
    mb.get(data);
    $display("Retrieved data: %0d", data);
  endtask

  
  initial begin
    // Run both processes in parallel
    fork
      process_A();
      process_B();
    join  
  end
endmodule
