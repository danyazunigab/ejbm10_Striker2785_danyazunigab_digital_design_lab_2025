module shiftLeftNbits #(N=4) (
			input logic [N-1:0] aIn,
			input logic [N-1:0] shamt,
			output logic [N-1:0] bOut);
			
logic [N-1:0] temp = 0, zero = 0;
logic [2*N-1:0] temp2 = 0;

genvar i;
generate
	for (i = 0; i < N; i++)  begin : shift_creator
		shift1bit sll (aIn[i], temp[i]);
	end
endgenerate	

always @(*) begin
if (shamt > N)
	bOut = 0;
else begin
	temp2 = {temp, zero};
	$display("temp: %b", temp2);
	bOut = temp2[(2*N-1-shamt) -: N];
end
end
endmodule