module fourbitDEC(
input logic [1:0] a,
output logic [3:0]y

);

always_comb begin
    y = 4'b0000; // Reset output to all zeros
   //checks the value of
   case (a)
        2'b00: y = 4'b0001; // Activate y[0]
        2'b01: y = 4'b0010; // Activate y[1]
        2'b10: y = 4'b0100; // Activate y[2]
        2'b11: y = 4'b1000; // Activate y[3]
    endcase
end

endmodule