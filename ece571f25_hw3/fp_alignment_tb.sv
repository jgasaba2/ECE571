import float_pkg::*;

module fp_alignment_tb;

    float bign;
    float smalln;
    float aligned;

    // instantiation
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
        $display("Case 1: big=%f  small=%f  aligned=%f",
                 shortrealfromfpnumber(bign),
                 shortrealfromfpnumber(smalln),
                 shortrealfromfpnumber(aligned));

        // Case 2: 6.0 vs 3.0
        bign   = fpnumberfromshortreal(6.0);
        smalln = fpnumberfromshortreal(3.0);
        #10;
        $display("Case 2: big=%f  small=%f  aligned=%f",
                 shortrealfromfpnumber(bign),
                 shortrealfromfpnumber(smalln),
                 shortrealfromfpnumber(aligned));

        // Case 3: 32.0 vs 2.0
        bign   = fpnumberfromshortreal(32.0);
        smalln = fpnumberfromshortreal(2.0);
        #10;
        $display("Case 3: big=%f  small=%f  aligned=%f",
                 shortrealfromfpnumber(bign),
                 shortrealfromfpnumber(smalln),
                 shortrealfromfpnumber(aligned));

        // Case 4: -5.5 vs 1.5
        bign   = fpnumberfromshortreal(-5.5);
        smalln = fpnumberfromshortreal(1.5);
        #10;
        $display("Case 4: big=%f  small=%f  aligned=%f",
                 shortrealfromfpnumber(bign),
                 shortrealfromfpnumber(smalln),
                 shortrealfromfpnumber(aligned));

        $finish; // end simulation
    end

endmodule
