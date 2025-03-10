module ContadorRegresivo #(parameter N = 8) (
	input logic [N - 1:0] init_number,
	output logic [N - 1:0] current_number
);

logic [N-1:0] borrows;

generate
	genvar i;
	for (i = 0; i < N; i++) begin : gen_block
		Restador resta1(
			.a(init_number[i]),
			.b((i == 0) ? 1'b1 : 1'b0),
			.cin((i == 0) ? 1'b0 : borrows[i - 1]),
			.d(current_number[i]),
			.bo(borrows[i])
		);
	end
endgenerate


endmodule
