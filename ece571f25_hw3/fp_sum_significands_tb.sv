import float_pkg::*;

module fp_sum_significands_tb;

    float bign;
    float smalln;
    logic [FRACTION_BITS:0] sum;

    // Instantiate DUT
    fp_sum_significands DUT (
        .bign(bign),
        .smalln(smalln),
        .sum(sum)
    );

    initial begin
	
        // Case 1:
        bign   = fpnumberfromshortreal(5.0);
        smalln = fpnumberfromshortreal(3.0);
        #10;
        $display("Case 1: 5.0 + 3.0 → sum=%b", sum);

        // Case 2: 
        bign   = fpnumberfromshortreal(-5.0);
        smalln = fpnumberfromshortreal(-2.0);
        #10;
        $display("Case 2: -5.0 + -2.0 → sum=%b", sum);

        // Case 3: 
        bign   = fpnumberfromshortreal(5.0);
        smalln = fpnumberfromshortreal(-3.0);
        #10;
        $display("Case 3: 5.0 - 3.0 → sum=%b", sum);

        // Case 4:
        bign   = fpnumberfromshortreal(-5.0);
        smalln = fpnumberfromshortreal(2.0);
        #10;
        $display("Case 4: -5.0 + 2.0 → sum=%b", sum);

        $finish;
    end

endmodule