module n_bit_substractor #(parameter N = 4)
(
	input logic [N-1:0] A,
	input logic [N-1:0] B,
	output logic [N-1:0] D
);
	
	logic [N-1:0] Bouts;
	
	generate
		genvar i;
		for (i = 0; i < N; i++) begin : substractor
			full_substractor u1(
				.A(A[i]),
				.B(B[i]),
				.Bin((i == 0) ? 1'b0 : Bouts[i - 1]),
				.D(D[i]),
				.Bout(Bouts[i])
			);
		end
	endgenerate
endmodule
