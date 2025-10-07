module martian_days (
    input  logic [4:0] M,     // Encoded month value (0–23)
    input  logic       LY,    // 1 if leap year, 0 otherwise
    output logic       D27,   // 1 if month has 27 days
    output logic       D28    // 1 if month has 28 days
);

// Continuous assignments
    // D28: True for even months OR month 23 in leap year
    //assign D28 = ~M[0] | ((M == 5'd23) & LY);
    assign D28 = ~M[0] & (M[4] & ~M[3] & M[2] & M[1] & ~M[0] & LY);
    // D27: Complement of D28
   assign D27 = M[0] & (~M[4] & M[3] & ~M[2] & ~M[1] & ~M[0] & ~LY);
    //D27 = ~D28;

endmodule

