import float_pkg::*;

module fp_alignment_tb;

    float bign;
    float smalln;
    float aligned;

    fp_alignment DUT (
        .bign   (bign),
        .smalln (smalln),
        .aligned(aligned)
    );

    initial begin

        // Case 1: 5.0 vs 3.0
        bign   = fpnumberfromshortreal(5.0);
        smalln = fpnumberfromshortreal(3.0);
        #10;
        $display("Case 1: big=%f (exp=%0d)  small=%f (exp=%0d)  aligned=%f (exp=%0d)",
                 shortrealfromfpnumber(bign),   bign.exponent,
                 shortrealfromfpnumber(smalln), smalln.exponent,
                 shortrealfromfpnumber(aligned), aligned.exponent);

        // Case 2: 6.0 vs 3.0
        bign   = fpnumberfromshortreal(6.0);
        smalln = fpnumberfromshortreal(3.0);
        #10;
        $display("Case 2: big=%f (exp=%0d)  small=%f (exp=%0d)  aligned=%f (exp=%0d)",
                 shortrealfromfpnumber(bign),   bign.exponent,
                 shortrealfromfpnumber(smalln), smalln.exponent,
                 shortrealfromfpnumber(aligned), aligned.exponent);

        // Case 3: 32.0 vs 2.0
        bign   = fpnumberfromshortreal(32.0);
        smalln = fpnumberfromshortreal(2.0);
        #10;
        $display("Case 3: big=%f (exp=%0d)  small=%f (exp=%0d)  aligned=%f (exp=%0d)",
                 shortrealfromfpnumber(bign),   bign.exponent,
                 shortrealfromfpnumber(smalln), smalln.exponent,
                 shortrealfromfpnumber(aligned), aligned.exponent);

        // Case 4: -5.5 vs 1.5
        bign   = fpnumberfromshortreal(-5.5);
        smalln = fpnumberfromshortreal(1.5);
        #10;
        $display("Case 4: big=%f (exp=%0d)  small=%f (exp=%0d)  aligned=%f (exp=%0d)",
                 shortrealfromfpnumber(bign),   bign.exponent,
                 shortrealfromfpnumber(smalln), smalln.exponent,
                 shortrealfromfpnumber(aligned), aligned.exponent);

        $finish;
    end

endmodule


