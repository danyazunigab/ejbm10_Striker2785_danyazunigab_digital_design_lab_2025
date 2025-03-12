module testbench();

	parameter N = 6;

	logic clk;
	logic rst_async;
	logic [N-1:0] init_number;
	logic [N-1:0] count;

	ContadorRegresivo #(.N(N)) uut (
		.clk(clk),
		.rst_async(rst_async),
		.init_number(init_number),
		.count(count)
	);

	always #5 clk = ~clk;

	initial begin

		clk = 0;
		
		init_number = 6'b100110;
		
		rst_async = 0;
		#10 rst_async = 1;

		#1000;
		
		rst_async = 0;
		#10 rst_async = 1;
		
		#100;

		$stop;
	end
endmodule

