//Ripple Carry
module fourbitFA (
  input  logic [3:0] a,
  input  logic [3:0] b,
  input  logic       cin,
  output logic [3:0] sum,
  output logic       carry
);
logic c1, c2, c3;
// the numbers in [] reprents bit positions
  onebitFA one (
    .a(a[0]),
    .b(b[0]),
    .cin(cin),
    .sum(sum[0]),
    .carry(c1)
  );

  onebitFA two (
    .a(a[1]),
    .b(b[1]),
    .cin(c1),
    .sum(sum[1]),
    .carry(c2)
  );

  onebitFA three (
    .a(a[2]),
    .b(b[2]),
    .cin(c2),
    .sum(sum[2]),
    .carry(c3)
  );

  onebitFA four (
    .a(a[3]),
    .b(b[3]),
    .cin(c3),
    .sum(sum[3]),
    .carry(carry)
  );

endmodule


