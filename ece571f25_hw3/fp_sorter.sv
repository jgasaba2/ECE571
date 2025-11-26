// The sorter module assigns the number with the larger magnitude to big_number output 
// and assigned the number with the smaller magnitude to small number output

import float_pkg::*;

module fp_sorter (
    input  float a,
    input  float b,
    output float bign,
    output float smalln
);

    logic [EXPONENT_BITS+FRACTION_BITS-1:0] mag_a, mag_b;

    assign mag_a = {a.exponent, a.fraction};
    assign mag_b = {b.exponent, b.fraction};

    assign bign   = (mag_a >= mag_b) ? a : b;
    assign smalln = (mag_a <  mag_b) ? a : b;

endmodule

