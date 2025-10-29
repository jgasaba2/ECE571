package alu_pkg;
  typedef enum logic [2:0] {
    ADD = 3'b000,
    SUB = 3'b001,
    MUL = 3'b010,
    AND = 3'b011,
    DEC = 3'b100
  } alu_opcode_t;

endpackage