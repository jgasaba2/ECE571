// The alignment module aligns the two numbers so that they have the same exponent. It will adjust the exponent of
//the small number to much the exponent of the big number. The significand of the small number has to shift to the
//right according the difference in exponents.

import float_pkg::*;

module fp_alignment (
    input  float bign,    
    input  float smalln,  
    output float aligned  
);

import float_pkg::*;

module fp_alignment (
    input  float bign,
    input  float smalln,
    output float aligned
);

    logic [EXPONENT_BITS-1:0]  exp_diff;
    logic [FRACTION_BITS:0]    small_sig_ext;
    logic [FRACTION_BITS:0]    shifted_sig;

    assign exp_diff     = bign.exponent - smalln.exponent;
    assign small_sig_ext = {1'b1, smalln.fraction};

    always_comb begin
        if (exp_diff >= (FRACTION_BITS+1))
            shifted_sig = '0;
        else
            shifted_sig = small_sig_ext >> exp_diff;
    end

    assign aligned.sign     = smalln.sign;
    assign aligned.exponent = bign.exponent;
    assign aligned.fraction = shifted_sig[FRACTION_BITS-1:0];

endmodule


