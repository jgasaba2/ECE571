
package float_pkg;

  // Localparams for IEEE 754 single precision
  localparam int EXPONENT_BITS = 8;
  localparam int FRACTION_BITS = 23;

  // Packed struct typedef for float
  typedef struct packed {
    bit                     sign;
    bit [EXPONENT_BITS-1:0] exponent;
    bit [FRACTION_BITS-1:0] fraction;
  } float;


  // construct a floating-point number from components
  function float fpnumberfromcomponents (
    input bit sign,
    input bit [EXPONENT_BITS-1:0] exp,
    input bit [FRACTION_BITS-1:0] frac
  );
    fpnumberfromcomponents.sign     = sign;
    fpnumberfromcomponents.exponent = exp;
    fpnumberfromcomponents.fraction = frac;
  endfunction

  // construct floating point number from shortrea
  function float fpnumberfromshortreal (input shortreal sr);
    bit [31:0] bits;
	bits = $shortrealtobits(sr);
    fpnumberfromshortreal.sign     = bits[31];
    fpnumberfromshortreal.exponent = bits[30:23];
    fpnumberfromshortreal.fraction = bits[22:0];
  endfunction

  //  return shortreal representation of floating-point number (Convert back to shortreal)
  function shortreal shortrealfromfpnumber (input float f);
    bit [31:0] bits;
    bits = {f.sign, f.exponent, f.fraction};
    return $bitstoshortreal(bits);
  endfunction

  // print a floating-point number's components (sign, exponent, fraction) 
  function void printfp (input float f);
    $display("Sign: %0b, Exponent: %0b, Fraction: %0b",
             f.sign, f.exponent, f.fraction);
  endfunction

endpackage : float_pkg