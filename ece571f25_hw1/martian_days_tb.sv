`timescale 1ns/1ps
module martian_days_tb;
    // short KISS testbench with comments
    logic [4:0] M;       // month 0..23
    logic       LY;      // leap year
    logic       D27, D28; // DUT outputs

    // DUT (keep name/ports as in your project)
    martian_days DUT (.M(M), .LY(LY), .D27(D27), .D28(D28));

initial begin
    integer m; // loop variable for month
    // simple waveform-oriented sweep: months 0..23, LY=0 then LY=1
    for (int m = 0; m < 24; m = m + 1) begin
        M = m;
        LY = 0; #10;
        $display("Month=%0d, LY=%0d => D27=%0d, D28=%0d", M, LY, D27, D28);

        LY = 1; #10;
        $display("Month=%0d, LY=%0d => D27=%0d, D28=%0d", M, LY, D27, D28);
    end
    $finish;
end
endmodule





