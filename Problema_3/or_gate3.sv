// Módulo Compuerta OR

// Este módulo simula una compuerta OR de tres entradas.
// Autor: Eduardo Bolívar Minguet

module or_gate3(
	input logic a,
	input logic b,
	input logic c,
	output logic y
);
	
assign y = a | b | c;

endmodule
