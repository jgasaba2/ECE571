// Code your testbench here
// or browse Examples
// systemverilog testbench for 1-bit full adder
module tb_onebitFA;
  logic a, b, cin;
  logic sum, carry;

  // instantiate the full adder module
  onebitFA DUT (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
  );

  // apply all posdsiblke 8 input combinations 
  initial begin
    $display("a b cin | sum carry");  // header row
	
	$monitor("%t %b %b  %b  |  %b    %b" $time, a, b, cin, sum, carry);

    // test case 0: 0 + 0 + 0
    a = 0; b = 0; cin = 0; #1;
    //$display("%b %b  %b  |  %b    %b", a, b, cin, sum, carry);

    // test case 1: 0 + 0 + 1
    a = 0; b = 0; cin = 1; #1;
    ///$display("%b %b  %b  |  %b    %b", a, b, cin, sum, carry);

    // test case 2: 0 + 1 + 0
    a = 0; b = 1; cin = 0; #1;
    //$display("%b %b  %b  |  %b    %b", a, b, cin, sum, carry);

    // test case 3: 0 + 1 + 1
    a = 0; b = 1; cin = 1; #1;
    //$display("%b %b  %b  |  %b    %b", a, b, cin, sum, carry);

    // test case 4: 1 + 0 + 0
    a = 1; b = 0; cin = 0; #1;
    //$display("%b %b  %b  |  %b    %b", a, b, cin, sum, carry);

    // test case 5: 1 + 0 + 1
    a = 1; b = 0; cin = 1; #1;
    //$display("%b %b  %b  |  %b    %b", a, b, cin, sum, carry);

    // test case 6: 1 + 1 + 0
    a = 1; b = 1; cin = 0; #1;
    //$display("%b %b  %b  |  %b    %b", a, b, cin, sum, carry);

    // test case 7: 1 + 1 + 1
    a = 1; b = 1; cin = 1; #1;
   

    $finish;  // end simulation
  end

endmodule
