module full_substractor(
	input logic A,
	input logic B,
	input logic Bin,
	output logic D,
	output logic Bout
);

	assign D = A ^ B ^ Bin;
	
	logic negA, negB;
	logic and1, and2, and3;
	
	assign negA = ~A;
	assign negB = ~B;
	
	assign and1 = negA & Bin;
	assign and2 = negA & B;
	assign and3 = B & Bin;
	
	assign Bout = and1 | and2 | and3;
endmodule
