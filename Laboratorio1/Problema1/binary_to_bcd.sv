module binary_to_bcd(
    input logic [3:0] binary_in,
    output logic [7:0] bcd_out
);
	logic [3:0] unidades;
	logic [3:0] decenas;
	
	always_comb begin
	
		unidades = 4'b0000;
		decenas = 4'b0000;
		
		//1 si el numero es >= 10
		decenas[0] = binary_in[3] & (binary_in[1] | binary_in[2]);
		
		unidades[3] = binary_in[3] & ~binary_in[2] & ~binary_in[1];
		unidades[2] = ~binary_in[3] & binary_in[2] | binary_in[2] & binary_in[1];
		unidades[1] = binary_in[3] & binary_in[2] & ~binary_in[1] | ~binary_in[3] & binary_in[1];
		unidades[0] = binary_in[0];
		
		bcd_out = {decenas, unidades};
		
		
      end
endmodule