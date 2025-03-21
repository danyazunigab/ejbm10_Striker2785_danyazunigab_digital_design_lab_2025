module tb();
	
	parameter N = 6;
	logic [N-1:0] A, B, Y;
	
	n_bit_and #(.N(N)) dut(
		.A(A),
		.B(B),
		.Y(Y)
	);
	
	initial begin
		A = 5'b111101;
		B = 5'b010011;
		
		#500;
	end
endmodule
