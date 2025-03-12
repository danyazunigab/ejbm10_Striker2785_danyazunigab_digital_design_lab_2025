module ContadorRegresivo #(parameter N = 8) (
    input logic clk,
    input logic rst_async,
    input logic [N-1:0] init_number,
    output logic [N-1:0] count
);
	logic [N-1:0] next_number;
	logic [N-1:0] bouts;
	
	generate
		genvar i;
		for (i = 0; i < N; i++) begin : substractor
			Restador r1 (
				.a(count[i]), 
				.b((i == 0) ? 1'b1 : 1'b0),
				.cin((i == 0) ? 1'b0 : bouts[i-1]),
				.d(next_number[i]),
				.bo(bouts[i])
			);
		end
	endgenerate
	
	always_ff @(posedge clk) begin
		if (!rst_async)
			count <= init_number;
		else if (count > 0)
			count <= next_number;
	end
endmodule
