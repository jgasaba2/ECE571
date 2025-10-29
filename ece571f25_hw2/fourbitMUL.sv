module fourbitMUL(
input logic [3:0] a,
input logic [3:0] b,
output logic [7:0] product
);

//Procedural assignment
always_comb begin
product = a * b; 
end

endmodule


