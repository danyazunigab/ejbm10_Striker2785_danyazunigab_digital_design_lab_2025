module tb();
	
	parameter N = 5;
	logic [N-1:0] A, B;
	logic [2*N-1:0] M;
	
	n_bit_multiplier #(.N(N)) dut(
		.A(A),
		.B(B),
		.M(M)
	);
	
	initial begin
		A = 5'b11101;
		B = 5'b10011;
		
		#500;
	end
endmodule
