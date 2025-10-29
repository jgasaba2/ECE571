module tb_fourbitDEC; 
logic [1:0]a;
logic [3:0]y;



//instantiate the DUT
fourbitDEC dut(
.a(a), 
.y(y)
);

initial begin
    $display("a | y");
    
    // Monitor prints every time a, b, or y changes
    $monitor("%t %b %b", $time, a, y); //monitors when output(y) changes
	
//for (int i = 0; i < 4; i++) begin
// a = i; #1;
//end

//teste case 1: a = 00
a = 2'b00; #1;
//teste case 1: a = 01
a = 2'b01; #1;
//teste case 1: a = 10
a = 2'b10; #1;
//teste case 1: a = 11
a = 2'b11; #1;


$finish;
end 
endmodule 
