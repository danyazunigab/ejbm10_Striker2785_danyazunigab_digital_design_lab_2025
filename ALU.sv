module ALU #(parameter N = 4) (
	input logic clk,
	input logic rst,
	input logic [N-1:0] number,
	input logic mux1,
	input logic mux2,
	input logic mux3,
	input logic mux4,
	input logic load,
	input logic equal,
	output logic [6:0] segs1,
	output logic [6:0] segs2,
	output logic [3:0] flags
);
	
	logic load1, load2;
	logic [N-1:0] first_number, second_number, and_res;
	logic [N:0] sum, res;
	logic [2*N-1:0] mul, current_number;
	
	n_bit_adder #(.N(N)) adder (
		.A(first_number),
		.B(second_number),
		.S(sum)
	);
	
	n_bit_substractor #(.N(N)) substractor (
		.A(first_number),
		.B(second_number),
		.D(res)
	);

	n_bit_multiplier #(.N(N)) multiplier (
		.A(first_number),
		.B(second_number),
		.M(mul)
	);
	
	n_bit_and #(.N(N)) andd (
		.A(first_number),
		.B(second_number),
		.Y(and_res)
	);
	
	seven_seg_decoder #(.N(N)) displays (
		.n(current_number),
		.seven_seg1(segs1),
		.seven_seg2(segs2)
	);
	
	always_ff @(posedge clk or negedge rst) begin
		if (!rst) begin
			first_number <= 0;
			second_number <= 0;
			load1 <= 0;
			load2 <= 0;
		end
		else if (!load1 || !load2) begin
			current_number <= number;
		end
		else if (load1 && load2) begin
			if (!mux1 && !mux2 && !mux3 && !mux4 && !equal)
				current_number <= sum;
		end
		else if (!load && !load1) begin
			first_number <= number;
			load1 <= 1;
		end
		else if (!load && !load2) begin
			second_number <= number;
			load2 <= 1;
		end
		
	end
endmodule
