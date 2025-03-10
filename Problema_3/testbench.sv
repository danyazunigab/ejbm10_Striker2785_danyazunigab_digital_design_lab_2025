module testbench();
	parameter N = 8;
	
	logic [N-1:0] init_number, current_number;
	
	ContadorRegresivo #(.N(N)) c1 (
		.init_number(init_number),
		.current_number(current_number)
	);
	
	initial begin
	
	init_number = 8'b00110101;
	
	#1000;
	
	end
endmodule
