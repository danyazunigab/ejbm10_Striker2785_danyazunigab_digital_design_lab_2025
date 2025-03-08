module testbench();

	logic a, b, cin, d, bo;
	
	Restador modulo_restador(a,b,cin,d,bo);
	
	initial begin
	
	a = 0;
	b = 0;
	cin = 0;
	#1000
	a = 0;
	b = 1;
	cin = 0;
	#1000
	a = 1;
	b = 0;
	cin = 0;
	#1000
	a = 1;
	b = 1;
	cin = 0;
	
	end
endmodule
