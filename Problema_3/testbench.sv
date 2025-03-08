module testbench();

	logic a, b, c, z;
	
	and_gate3 compuerta(a,b,c,z);
	
	initial begin
	
	a = 0;
	b = 0;
	c = 0;
	#1000
	a = 0;
	b = 0;
	c = 1;
	#1000
	a = 1;
	b = 0;
	c = 1;
	#1000
	a = 1;
	b = 1;
	c = 1;
	
	end
endmodule
