module ALU #(parameter N = 4) (
	input logic clk,
	input logic rst,
	input logic [N-1:0] number,
	input logic mux1,
	input logic mux2,
	input logic mux3,
	input logic mux4,
	input logic load1,
	input logic load2,
	input logic equal,
	output logic [6:0] segs1,
	output logic [6:0] segs2,
	output logic [6:0] segs3,
	output logic [3:0] flags
);
	logic show;
	logic [N-1:0] first_number, second_number;
	
	logic [N:0] add_result;
	logic [N:0] sub_result;
	logic [2*N-1:0] mul_result;
	logic [N-1:0] div_result;
	logic [N-1:0] mod_result;
	logic [N-1:0] and_result;
	logic [N-1:0] or_result;
	logic [N-1:0] xor_result;
	logic [N-1:0] shift_right;
	logic [N-1:0] shift_left;
	
	logic [2*N-1:0] current_number;
	
	n_bit_adder #(.N(N)) adder (
		.A(first_number),
		.B(second_number),
		.S(add_result)
	);
	
	n_bit_substractor #(.N(N)) substractor (
		.A(first_number),
		.B(second_number),
		.D(sub_result)
	);

	n_bit_multiplier #(.N(N)) multiplier (
		.A(first_number),
		.B(second_number),
		.M(mul_result)
	);
	
	n_bit_and #(.N(N)) andd (
		.A(first_number),
		.B(second_number),
		.Y(and_result)
	);
	
	seven_seg_decoder #(.N(N)) displays (
		.n(current_number),
		.seven_seg1(segs1),
		.seven_seg2(segs2),
		.seven_seg3(segs3)
	);
	
	always_ff @(posedge clk or negedge rst) begin
		if (!rst) begin
			first_number <= 0;
			second_number <= 0;
			show <= 0;
		end
		else if (!load1)
			first_number <= number;
		else if (!load2)
			second_number <= number;
		else if (!equal)
			show <= 1;
		else if (show) begin
			case ({mux1, mux2, mux3, mux4})
				4'b0000:
					current_number <= add_result;
				4'b0001:
					current_number <= sub_result;
				4'b0010:
					current_number <= mul_result;
				4'b0011:
					current_number <= div_result;
				4'b0100:
					current_number <= mod_result;
				4'b0101:
					current_number <= and_result;
				4'b0110:
					current_number <= or_result;
				4'b1000:
					current_number <= xor_result;
				4'b1001:
					current_number <= shift_right;
				4'b1010:
					current_number <= shift_left;
			endcase
		end
		else
			current_number <= number;
	end
endmodule
