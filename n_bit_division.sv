module divider #(parameter N = 8) (
    input logic [N-1:0] dividend, 
    input logic [N-1:0] divisor,
    output logic [N-1:0] quotient, 
    output logic [N-1:0] remainder
);
    logic [N:0] temp_remainder;  // Un bit extra para evitar desbordamiento
    logic [N-1:0] temp_quotient;
    
    always_comb begin
        temp_remainder = 0;
        temp_quotient  = 0;

        for (int i = N-1; i >= 0; i--) begin
            // Desplazamos el remainder a la izquierda y añadimos el bit más significativo del dividendo
            temp_remainder = {temp_remainder[N-2:0], dividend[i]}; 

            // Si el residuo acumulado es mayor o igual al divisor, restamos y ponemos un 1 en el cociente
            if (temp_remainder[N-1:0] >= divisor) begin
                temp_remainder = temp_remainder - divisor;
                temp_quotient[i] = 1;
            end
        end

        quotient  = temp_quotient;
        remainder = temp_remainder[N-1:0];
    end
endmodule
