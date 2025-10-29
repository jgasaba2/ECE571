import alu_pkg::*;  // enum alu_opcode_t: ADD=000, SUB=001, MUL=010, AND=011, DEC=100

module tb_fourbitALU;

  logic [3:0] a, b;
  logic [4:0] result;         // 5-bit to capture overflow from MUL or ADD
  logic [4:0] expected;
  alu_opcode_t op_code;

  // Instantiate DUT
  fourbitALU dut (
    .a(a),
    .b(b),
    .op(op_code),
    .result(result)
  );

  initial begin
    $display("Time | Opcode | a    | b    | Result | Expected | Overflow | Pass");

    // Sweep opcodes
    for (int i = 0; i < 5; i++) begin
      op_code = alu_opcode_t'(i);
      a = 4'b1010;  // Example input
      b = 4'b0011;

      // Compute expected result
      case (op_code)
        ADD: expected = a + b;
        SUB: expected = a - b;
        MUL: expected = a * b;
        AND: expected = a & b;
        DEC: expected = a - 1;
        default: expected = '0;
      endcase

      #10;

      bit overflow = (expected > 4'b1111);
      $display("%t | %b     | %b | %b | %b   | %b     | %b       | %s",
               $time, op_code, a, b, result, expected, overflow,
               (result === expected) ? "PASS" : "FAIL");

      assert(result === expected)
        else $error("FAIL: op=%b a=%b b=%b result=%b expected=%b", op_code, a, b, result, expected);
    end

    $finish;
  end

endmodule