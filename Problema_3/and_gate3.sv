// Módulo Compuerta AND

// Este módulo simula una compuerta AND de tres entradas.
// Autor: Eduardo Bolívar Minguet

module and_gate3 (
	input logic a,
	input logic b,
	input logic c,
	output logic y
);
	
assign y = a & b & c;

endmodule
