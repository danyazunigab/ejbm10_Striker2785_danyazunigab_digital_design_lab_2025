module ALU_tb();
	
	parameter N = 4;
	
	logic clk, rst, mux1, mux2, mux3, mux4, load1, load2, equal;
	logic [N-1:0] number;
	logic [6:0] segs1, segs2, segs3;
	logic [3:0] flags;
	
	always #5 clk = ~clk;
	
	ALU #(.N(N)) dut (
		.clk(clk),
		.rst(rst),
		.number(number),
		.mux1(mux1),
		.mux2(mux2),
		.mux3(mux3),
		.mux4(mux4),
		.load1(load1),
		.load2(load2),
		.equal(equal),
		.segs1(segs1),
		.segs2(segs2),
		.segs3(segs3),
		.flags(flags)
	);

	initial begin
		clk = 0;
		rst = 1;
		mux1 = 0;
		mux2 = 0;
		mux3 = 0;
		mux4 = 0;
		load1 = 1;
		load2 = 1;
		equal = 1;
		
		number = 4'b0101;
		
		#100;
		
		load1 = 0;
		#10 load1 = 1;
		
		number = 4'b0011;
		
		#100;
		
		load2 = 0;
		#10 load2 = 1;
		
		equal = 0;
		#10 equal = 1;
		
		// Suma
		#100;
		
		// Resta
		mux4 = 1;
		
		#100;
		
		// Multiplicacion
		mux4 = 0;
		mux3 = 1;
		
		#100
		
		// Division
		mux4 = 1;
		
		#100;
		
		// Modulo
		mux4 = 0;
		mux2 = 1;
		mux3 = 0;
		
		#100;
		
		// Shift Left
		mux1 = 1;
		mux2 = 0;
		
		#100;
		
		// Shift Right
		mux4 = 1;
		
		#100;
	end
endmodule

		
		