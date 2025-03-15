module tb();
	
	parameter N = 4;
	
	logic [N-1:0] A, B, D;
	
	n_bit_substractor #(.N(N)) dut(
		.A(A),
		.B(B),
		.D(D)
	);
	
	initial begin
		A = 4'b1010;
		B = 4'b0110;
		
		#500;
		
		A = 4'b0101;
		B = 4'b1111;
		
		#500;
	end
endmodule
