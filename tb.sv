module tb();
	
	parameter N = 4;
	
	logic clk, rst, mux1, mux2, mux3, mux4, load, equal;
	logic [N-1:0] number;
	logic [6:0] segs1, segs2;
	logic [3:0] flags;
	
	ALU #(.N(N)) dut (
		.clk(clk),
		.rst(rst),
		.number(number),
		.mux1(mux1),
		.mux2(mux2),
		.mux3(mux3),
		.mux4(mux4),
		.load(load),
		.equal(equal),
		.segs1(segs1),
		.segs2(segs2),
		.flags(flags)
	);
	
	always #10 clk = ~clk;
	
	initial begin
		clk = 0;
		rst = 1;
		mux1 = 0;
		mux2 = 0;
		mux3 = 0;
		mux4 = 0;
		load = 1;
		equal = 1;
		
		rst = 0;
		#10 rst = 1;
		
		number = 4'b1011;
		
		#100;
		
		load = 0;
		#10 load = 1;
		
		number = 4'b0111;
		
		#100;
		
		load = 0;
		#10 load = 1;
		
		#100;
		
		equal = 0;
		#10 equal = 1;
		
		#100;
		
	end
endmodule
