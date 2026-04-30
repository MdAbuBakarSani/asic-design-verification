// Code your testbench here 
// or browse Examples 

module Packed_Structure_Example;

  // Packed structure (only bit-level types allowed)
  typedef struct packed {
    shortint shortint_value;   // 16 bits
    byte     byte_value;       // 8 bits
    bit      bit_value;        // 1 bit
    logic    logic_value;      // 1 bit
  } Packed_Struct_t;

  // Instance of packed struct
  Packed_Struct_t packed_structure;

  // Real variable declared separately
  real real_value;

  initial begin

    // Initialize struct members
    packed_structure.shortint_value = 267;
    packed_structure.byte_value     = 27;
    packed_structure.bit_value      = 1;
    packed_structure.logic_value    = 0;

    // Initialize real variable
    real_value = 3.1416;

    // Display values
    $display("Packed Structure Elements:");
    $display("Shortint value = %0d", packed_structure.shortint_value);
    $display("Byte value     = %0d", packed_structure.byte_value);
    $display("Bit value      = %0d", packed_structure.bit_value);
    $display("Logic value    = %0d", packed_structure.logic_value);
    $display("Real value     = %0f", real_value);

  end
endmodule
