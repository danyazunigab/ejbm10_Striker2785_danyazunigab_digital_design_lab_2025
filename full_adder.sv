module full_adder
(
	input logic A,
	input logic B,
	input logic Cin,
	output logic S,
	output logic Cout
);

	logic negA, negB, negCin;
	logic and1, and2, and3, and4;
	
	assign negA = ~A;
	assign negB = ~B;
	assign negCin = ~Cin;
	
	assign and1 = negA & negB & Cin;
	assign and2 = negA & B & negCin;
	assign and3 = A & negB & negCin;
	assign and4 = A & B & Cin;
	
	assign S = and1 | and2 | and3 | and4;
	
	logic and5, and6, and7;
	
	assign and5 = B & Cin;
	assign and6 = A & Cin;
	assign and7 = A & B;
	
	assign Cout = and5 | and6 | and7;
endmodule
