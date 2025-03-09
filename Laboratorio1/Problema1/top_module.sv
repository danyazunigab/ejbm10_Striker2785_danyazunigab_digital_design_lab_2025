module top_module(
    input logic [3:0] switches,  // 4 switches para la entrada binaria
    output logic [6:0] seg      // 7 segmentos para el display
);
    // Señales internas
    logic [3:0] bcd;
    
    // Instancia del decodificador binario a BCD
    binary_to_bcd decoder(
        .binary_in(switches),
        .bcd_out(bcd)
    );
    
    // Decodificador de 7 segmentos
    seven_segment_decoder decoder_display(
        .bcd_in(bcd),
        .segments(seg)
    );
endmodule