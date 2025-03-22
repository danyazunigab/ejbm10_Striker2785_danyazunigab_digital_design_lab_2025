module ALU #(parameter N = 8) (
	input logic clk,
	input logic [N-1:0] number,
	input logic mux1,
	input logic mux2,
	input logic op1,
	input logic op2,
	input logic op3,
	input logic eq,
	output logic [6:0] segs1,
	output logic [6:0] segs2,
	output logic [6:0] segs3,
	output logic [6:0] segs4
);
	
	logic load1, load2;
	logic [N-1:0] first_number;
	logic [N-1:0] second_number;
	
	assign load1 = 0;
	assign load2 = 0;
	
	logic [] operations;
	
	always_ff @(posedge clk) begin
		if (op1) begin
			first_number <= number;
			load1 <= 1;
		end
		else if (eq && load1) begin
			second_number <= number;
			load2 <= 1;
		end
	end
endmodule
