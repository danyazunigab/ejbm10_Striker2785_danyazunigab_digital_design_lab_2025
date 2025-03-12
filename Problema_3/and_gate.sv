// Modulo compuerta AND

// Este módulo simula una compuerta AND de dos entradas.
// Autor: Eduardo Bolívar Minguet

module and_gate(
	input logic a, 
	input logic b,
	output logic y
);

assign y = a & b;

endmodule
