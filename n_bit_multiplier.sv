module n_bit_multiplier #(parameter N = 4) (
	input logic [N-1:0] A,
	input logic [N-1:0] B,
	output logic [2*N-1:0] M
);
	
	logic [2*N-1:0] partial_sums [N-2:0];
	logic [2*N-2:0] rows [N-1:0];
	
	generate
		genvar i, j;
		for (i = 0; i < N; i++) begin : loop1
			for (j = 0; j < 2*N-1; j++) begin : loop2
				if (j < i || j > i + N - 1)
					assign rows[i][j] = 0;
				else
					assign rows[i][j] = A[j-i] & B[i];
			end
		end
	endgenerate
	
	generate
		genvar k;
		for (k = 0; k < N - 1; k++) begin : loop3
			n_bit_adder #(.N(2*N-1)) adder1 (
				.A((k == 0) ? rows[k] : partial_sums[k - 1]),
				.B(rows[k + 1]),
				.S(partial_sums[k])
			);
		end
	endgenerate
	
	assign M = partial_sums[N-2];
endmodule
