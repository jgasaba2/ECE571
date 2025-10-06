module martian_days (
    input logic [4:0] M,     // encoded value for month vector 0-23
    input logic LY,          // 1 if leap year, 0 otherwise
    output logic D27, D28    // value 1 for D27 if month has 27 days and value 1 for D28 if month has 28 days
);
// Continuous assignments
    // D28: True for even months OR month 23 in leap year
    //assign D28 = ~M[0] | ((M == 5'd23) & LY);
    assign D28 = ~M0·(M4 & ~M3 & M2 & M1 & ~M0 & LY)
    // D27: Complement of D28
    assign D27 = M0·(~M4 & M3 & ~M2 & ~M1 & ~M0 & ~LY);
    //D27 = ~D28;
endmodule