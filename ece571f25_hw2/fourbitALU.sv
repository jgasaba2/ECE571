import alu_pkg::*;  // Import ALU operation enum definitions

module fourbitALU #(parameter N = 8) (
  input  logic [3:0] a,             // First 4-bit operand
  input  logic [3:0] b,             // Second 4-bit operand
  input alu_opcode_t opcode,           // Operation selector (enum type)
  output logic [N-1:0] result       // Final ALU result (parameterized width)
);

  // Internal wires to hold submodule outputs
  logic [N-1:0] sum;                // Output from full adder
  logic [N-1:0] product;            // Output from multiplier
  logic [N-1:0] y;                  // Output from decoder
  logic carry;                     // Carry-out from full adder

  // Instantiate 4-bit Full Adder
  // Computes a + b with carry-in (set to 0 here)
  fourbitFA alu1 (
    .a(a),
    .b(b),
    .cin(1'b0),                    // No carry-in for basic ALU
    .sum(sum),
    .carry(carry)
  );

  // Instantiate 4-bit Multiplier
  // Computes a * b
  fourbitMUL alu2 (
    .a(a),
    .b(b),
    .product(product)
  );

  // Instantiate 2-to-4 Decoder
  fourbitDEC alu3 (
    .a(a),
    .y(y)
  );

  // ALU operation selector
  always_comb begin
    case (opcode)
      ADD:    result = sum;              // Use full adder output
      SUB:    result = a - b;            // Direct subtraction
      MUL:    result = product;          // Use multiplier output
      AND:    result = a & b;            // Bitwise AND
      DEC:    result = y;                // Use decoder output
      default: result = 8'b00000000;     // Default to zero on invalid opcode
    endcase
  end

endmodule