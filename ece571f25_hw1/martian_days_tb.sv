`timescale 1ns/1ps
module martian_days_tb;
    // short KISS testbench with comments
    logic [4:0] M;    // month 0..23
    logic       LY;   // leap year
    logic       D27, D28; // DUT outputs

    // DUT (keep name/ports as in your project)
    martian_days DUT (.M(M), .LY(LY), .D27(D27), .D28(D28));
initial begin
        integer m; // loop variable for month
        // simple waveform-oriented sweep: months 0..23, LY=0 then LY=1
        for (m = 0; m < 24; m = m + 1) begin
            M = m;        // drive DUT month input
            LY = 0; #10;  // sample with LY=0
            LY = 1; #10;  // sample with LY=1
        end
        $finish;
end
endmodule

