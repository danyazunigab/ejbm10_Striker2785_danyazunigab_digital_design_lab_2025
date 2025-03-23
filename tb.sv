module tb();
	
	parameter N = 3;
	
	logic [N-1:0] A, B;
	logic [2*N-1:0] M;
	
	n_bit_multiplier #(.N(N)) dut (
		.A(A),
		.B(B),
		.M(M)
	);
	
	initial begin
		A = 3'b011;
		B = 3'b101;
		
		#100;
		
	end
endmodule
