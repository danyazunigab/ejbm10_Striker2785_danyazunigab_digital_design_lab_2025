// Módulo decodificador de BCD a 7 segmentos
module seven_segment_decoder(
    input logic [3:0] bcd_in,
    output logic [6:0] segments
);
    // segments[6:0] corresponde a gfedcba
    always_comb begin
        case(bcd_in)
            4'b0000: segments = 7'b1000000; // 0
            4'b0001: segments = 7'b1111001; // 1
            4'b0010: segments = 7'b0100100; // 2
            4'b0011: segments = 7'b0110000; // 3
            4'b0100: segments = 7'b0011001; // 4
            4'b0101: segments = 7'b0010010; // 5
            4'b0110: segments = 7'b0000010; // 6
            4'b0111: segments = 7'b1111000; // 7
            4'b1000: segments = 7'b0000000; // 8
            4'b1001: segments = 7'b0010000; // 9
            default: segments = 7'b1111111; // Apagado para valores incorrectos
        endcase
    end
endmodule