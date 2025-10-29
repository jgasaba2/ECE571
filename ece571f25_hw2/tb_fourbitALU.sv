import alu_pkg::*;
module tb_fourbitALU;
  logic [3:0] a, b;
  logic [7:0] result, expected;
  alu_opcode_t op_code;
  bit overflow;
  int i;
  fourbitALU dut (
    .a(a),
    .b(b),
    .opcode(op_code),
    .result(result)
  );
  initial begin
    $display("Time | Opcode | a    | b    | Result | Expected | Overflow | Pass");
    for (i = 0; i < 5; i++) begin
      op_code = alu_opcode_t'(i);
      a = 4'b1010;
      b = 4'b0011;
      case (op_code)
        ADD: expected = a + b;
        SUB: expected = a - b;
        MUL: expected = a * b;
        AND: expected = a & b;
        DEC: expected = 4'b0001 << a[1:0];
        default: expected = 5'b00000;
      endcase
      overflow = (expected > 5'b01111);
      #10;
      $display("%t | %b | %b | %b | %b | %b | %b | %s",
               $time, op_code, a, b, result, expected, overflow,
               (result === expected) ? "PASS" : "FAIL");
      assert(result === expected)
        else $error("FAIL: op=%0d a=%b b=%b result=%b expected=%b", op_code, a, b, result, expected);
    end
    $finish;
  end
endmodule


