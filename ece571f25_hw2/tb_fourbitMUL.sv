module tb_fourbitMUL;

  // Declare inputs and output for the DUT
  logic [3:0] a, b;
  logic [7:0] product;

  // Instantiate the DUT (Device Under Test)
  fourbitMUL DUT (
    .a(a),
    .b(b),
    .product(product)
  );

  initial begin
    $display("a   b   | product");
    
    // Monitor prints every time a, b, or product changes
    $monitor("%t %b × %b = %b", $time, a, b, product);

    // Apply test vectors
    a = 4'd2;  b = 4'd3;  #1;   // 2 × 3 = 6
    a = 4'd4;  b = 4'd5;  #1;   // 4 × 5 = 20
    a = 4'd7;  b = 4'd7;  #1;   // 7 × 7 = 49
    a = 4'd0;  b = 4'd9;  #1;   // 0 × 9 = 0
    a = 4'd15; b = 4'd15; #1;   // 15 × 15 = 225

    $finish;  // End simulation
  end

endmodule