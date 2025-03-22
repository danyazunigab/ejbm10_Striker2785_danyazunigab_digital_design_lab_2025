module tb();
	
	parameter N = 8;
	logic clk, mux1, mux2, op1, op2, op3, eq;
	logic [N-1:0] number;
	logic [6:0] segs1, segs2, segs3, segs4;
	
	always #10 clk = ~clk;
	
	ALU #(.N(N)) dut(
		.clk(clk),
		.number(number),
		.mux1(mux1),
		.mux2(mux2),
		.op1(op1),
		.op2(op2),
		.op3(op3),
		.eq(eq),
		.segs1(segs1),
		.segs2(segs2),
		.segs3(segs3),
		.segs4(segs4)
	);
	
	initial begin
		clk = 0;
		number = 8'b00101101;
		op1 = 0;
		eq = 0;
		
		
		#100;
		
		op1 = 1;
		
		#100;
		
		number = 8'b11110000;
		
		#100;
		
		eq = 1;
		
		#100;
		
	end
endmodule
