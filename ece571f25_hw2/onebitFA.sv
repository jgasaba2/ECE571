module onebitFA (
  input  logic a,
  input  logic b,
  input  logic cin,
  output logic sum,
  output logic carry
);

  wire w1, w2, w3;  // internal wires for intermediate logic

  xor (w1, a, b);         // w1 = a ^ b
  xor (sum, w1, cin);     // sum = w1 ^ cin
  and (w2, cin, w1);      // w2 = cin & w1
  and (w3, b, a);         // w3 = b & a
  or  (carry, w2, w3);    // carry = w2 | w3

endmodule