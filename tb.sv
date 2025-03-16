module tb();
	
	parameter N = 5;
	logic [N-1:0] A, B;
	logic [2*N-2:0] M1, M2, M3, M4, M5;
	
	n_bit_multiplier #(.N(N)) dut(
		.A(A),
		.B(B),
		.M1(M1),
		.M2(M2),
		.M3(M3),
		.M4(M4),
		.M5(M5)
	);
	
	initial begin
		A = 5'b11101;
		B = 5'b10011;
		
		#500;
	end
endmodule
