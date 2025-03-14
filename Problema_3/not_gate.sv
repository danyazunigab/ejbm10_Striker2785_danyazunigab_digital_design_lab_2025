// Módulo Inversor

// Este módulo simula una compuerta NOT.
// Autor: Eduardo Bolívar Minguet

module not_gate(
	input logic a,
	output logic y
);
	
assign y = ~a;

endmodule
