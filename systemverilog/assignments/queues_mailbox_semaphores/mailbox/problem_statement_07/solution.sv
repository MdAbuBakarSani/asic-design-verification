// Code your testbench here 
// or browse Examples 

module mailbox_Method_demo;
  
  mailbox mb;
 
  int value1 = 3;
  int value2 = 5;

  initial begin
  
    // Create mailbox with capacity 2
    mb = new(2);
    $display("Mailbox created. Initial Count: %0d", mb.num());
    
    // Insert data
    mb.put(value1);
    $display("Put data: %0d | Count= %0d", value1, mb.num());
    
    mb.put(value2);
    $display("Put data: %0d | Count= %0d", value2, mb.num());
    
    // Blocking get
    mb.get(value1);
    $display("Recieved data: %0d | Count= %0d", value1, mb.num());
    
    // Non-blocking get
    if(mb.try_get(value2))
      $display("try_get(): %0d successfull | Count= %0d", value2, mb.num());
    else
      $display("try_get() failed - mailbox empty.");
  end
endmodule  
