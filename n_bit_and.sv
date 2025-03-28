module n_bit_and #(parameter N = 4) (
	input logic [N-1:0] A,
	input logic [N-1:0] B,
	output logic [N-1:0] Y
);

	generate
		genvar i;
		for (i = 0; i < N; i++) begin : and_i
			assign Y[i] = A[i] & B[i];
		end
	endgenerate
	
endmodule
