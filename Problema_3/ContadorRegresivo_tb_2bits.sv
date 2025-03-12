module ContadorRegresivo_tb_2bits();

	parameter N = 2;

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

	always #100 clk = ~clk;

	initial begin

		clk = 0;
		
		init_number = 2'b11;
		
		rst_async = 0;
		#10 rst_async = 1;

		#100;

		$stop;
	end
endmodule
