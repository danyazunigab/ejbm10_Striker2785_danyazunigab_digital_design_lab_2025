module n_bit_adder #(parameter N = 4)
(
	input logic [N-1:0] A,
	input logic [N-1:0] B,
	output logic [N:0] S
);
	
	logic [N-1:0] Couts;
	
	generate
		genvar i;
		for (i = 0; i < N; i++) begin : adder
			full_adder u1(
				.A(A[i]),
				.B(B[i]),
				.Cin((i == 0) ? 1'b0 : Couts[i - 1]),
				.S(S[i]),
				.Cout(Couts[i])
			);
		end
	endgenerate
	
	assign S[N] = Couts[N-1];
endmodule
