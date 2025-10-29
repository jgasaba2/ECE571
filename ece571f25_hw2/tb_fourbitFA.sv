module tb_fourbitFA;
logic [3:0] a, b, cin;
logic [3:0] sum;
logic carry;

//instantiation the DUT
fourbitFA DUT(
 .a(a),
 .b(b),
 .cin(cin),
 .sum(sum),
 .carry(carry)
);

initial begin
$display("a b cin | sum carry"); 

$monitor("%t %b + %b + %b  |  %b    %b" $time, a, b, cin, sum, carry);

    a = 4'd3; b = 4'd5; cin = 1'b0; #1;		// Test 1: 3 + 5 + 0 = 8
    a = 4'd7; b = 4'd8; cin = 1'b1; #1;		// Test 2: 7 + 8 + 1 = 16
    a = 4'd15; b = 4'd15; cin = 1'b1; #1;	// Test 3: 15 + 15 + 1 = 31
    a = 4'd0; b = 4'd0; cin = 1'b0; #1;	   // Test 4: 0 + 0 + 0 = 0
    a = 4'd9; b = 4'd6; cin = 1'b0; #1;	    // Test 5: 9 + 6 + 0 = 15

$finish;  // end simulation

end
endmodule 
