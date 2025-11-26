
import float_pkg::*;
module fp_sorter_tb;
    float a;
    float b;
    float big_number;
    float small_number;

    fp_sorter DUT(.a(a), .b(b), .bign(big_number), .smalln(small_number));
	initial 
	begin


	// Case 1: Positive vs Positive
    a = fpnumberfromshortreal(3.5);
    b = fpnumberfromshortreal(7.2);
    #10;
    $display("a=%f, b=%f => big=%f, small=%f",
             shortrealfromfpnumber(a),
             shortrealfromfpnumber(b),
             shortrealfromfpnumber(big_number),
             shortrealfromfpnumber(small_number));
			 
	// case 2 Negative vs Negative
    a = fpnumberfromshortreal(-4.0);
    b = fpnumberfromshortreal(-5.0);
    #10;
    $display("a=%f, b=%f => big=%f, small=%f",
             shortrealfromfpnumber(a),
             shortrealfromfpnumber(b),
             shortrealfromfpnumber(big_number),
             shortrealfromfpnumber(small_number));

	// Case 3: Positive vs Negative
    a = fpnumberfromshortreal(3.0);
    b = fpnumberfromshortreal(-5.0);
    #10;
    $display("a=%f, b=%f => big=%f, small=%f",
             shortrealfromfpnumber(a),
             shortrealfromfpnumber(b),
             shortrealfromfpnumber(big_number),
             shortrealfromfpnumber(small_number));

	$finish; // end simulation
	end
	
endmodule