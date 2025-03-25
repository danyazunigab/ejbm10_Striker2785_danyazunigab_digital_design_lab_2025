module division #(parameter N = 8) (
    input logic [N-1:0] dividend,
    input logic [N-1:0] divisor,
    output logic [N-1:0] quotient,
    output logic [N-1:0] remainder
);
    logic [N-1:0] temp_remainder;
    logic [N-1:0] temp_sub;
    logic [N-1:0] temp_quotient;

    always_comb begin
        temp_remainder = dividend;
        temp_quotient = 0;

        for (int i = N-1; i >= 0; i--) begin
            if (temp_remainder >= divisor) begin
                n_bit_substractor #(.N(N)) sub_inst (
                    .A(temp_remainder),
                    .B(divisor),
                    .D(temp_sub)
                );
                temp_remainder = temp_sub;
                temp_quotient = temp_quotient + 1; // Incrementar el cociente
            end
        end
        
        quotient = temp_quotient;
        remainder = temp_remainder;
    end
endmodule
