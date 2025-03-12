module top_module(
    input logic [3:0] switches,  // 4 switches para la entrada binaria
    output logic [6:0] seg_units,	// 7 segmentos para unidades
    output logic [6:0] seg_tens//,	// 7 segmentos para decenas
);
    logic [7:0] bcd;
	 logic [3:0] digit_units;
	 logic [3:0] digit_tens;
    
    // Instancia del decodificador binario a BCD
    binary_to_bcd decoder(
        .binary_in(switches),
        .bcd_out(bcd)
    );
	 
	 assign digit_units = bcd[3:0];
	 assign digit_tens = bcd[7:4];
    
    // Decodificador de 7 segmentos unidades
    seven_segment_decoder decoder_units(
        .bcd_in(digit_units),
        .segments(seg_units)
    );
	 
	 // Decodificador de 7 segmentos decenas
    seven_segment_decoder decoder_tens(
        .bcd_in(digit_tens),
        .segments(seg_tens)
    );
	 
endmodule		