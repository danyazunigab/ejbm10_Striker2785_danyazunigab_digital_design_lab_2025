module tb();

	logic A, B, Bin, D, Bout;
	
	full_substractor dut(
		.A(A),
		.B(B),
		.Bin(Bin),
		.D(D),
		.Bout(Bout)
	);
	
	initial begin
		A = 0;
		B = 0;
		Bin = 0;
		
		#100;
		
		A = 1;
		B = 1;
		
		#100;
		
		A = 0;
		B = 1;
		
		#100;
		
		B = 0;
		Bin = 1;
		
		#100;
	end
endmodule
