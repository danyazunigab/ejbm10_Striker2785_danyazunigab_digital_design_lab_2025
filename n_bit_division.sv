module divider #(parameter N = 8) (
    input  logic [N-1:0] dividend, 
    input  logic [N-1:0] divisor,
    output logic [N-1:0] quotient, 
    output logic [N-1:0] remainder
);
    logic [N:0] temp_remainder;  
    logic [N-1:0] temp_quotient;

    always_comb begin
        temp_remainder = 0;
        temp_quotient  = 0;

        if (divisor != 0) begin
            for (int i = N-1; i >= 0; i--) begin
                temp_remainder = {temp_remainder[N-2:0], dividend[i]}; 
                if (temp_remainder[N-1:0] >= divisor) begin
                    temp_remainder = temp_remainder - divisor;
                    temp_quotient[i] = 1;
                end
            end
        end else begin
            temp_quotient = 0;
            temp_remainder = 0;
        end

        quotient  = temp_quotient;
        remainder = temp_remainder[N-1:0];
    end
endmodule
