 //This module adds or subtracts the significands of two aligned numbers.

import float_pkg::*;

module fp_sum_significands (
    input  float bign,
    input  float smalln,
    output logic [FRACTION_BITS:0] sum
);

    // Extend both significands to include the hidden 1 bit:
    logic [FRACTION_BITS:0] sig_big, sig_small;
    assign sig_big   = {1'b1, bign.fraction};
    assign sig_small = {1'b1, smalln.fraction};

    // If signs are the same: add significands
    // If signs differ: subtract smaller significand from bigger
    assign sum = (bign.sign == smalln.sign)
               ? (sig_big + sig_small)
               : (sig_big - sig_small);

endmodule


