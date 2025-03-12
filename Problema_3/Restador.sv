/*
Este es el módulo principal de implementación de un restador completo.
Realiza la resta A - B = D
Retorna el resultado D y el Bo en caso de pedir prestado (Borrow).

Autor: Eduardo Bolívar Minguet
*/
module Restador(
	input logic a, 
	input logic b, 
	input logic cin, 
	output logic d, 
	output logic bo
);

logic not_a, not_b, not_cin;	// Las entradas pasan por inversores
logic not_a_b, not_a_cin, b_cin;	// Pasan por compuertas AND
logic not_a_not_b_cin, not_a_b_not_cin, a_b_cin, a_not_b_not_cin; // Pasan por compuertas AND

// A continuación todo el circuito combinatorio
not_gate not1(
	.a(a),
	.y(not_a)
);

not_gate not2(
	.a(b),
	.y(not_b)
);

not_gate not3(
	.a(cin),
	.y(not_cin)
);

and_gate and1(
	.a(not_a),
	.b(b),
	.y(not_a_b)
);

and_gate and2(
	.a(not_a),
	.b(cin),
	.y(not_a_cin)
);

and_gate and3(
	.a(b),
	.b(cin),
	.y(b_cin)
);

or_gate3 or1(
	.a(not_a_b),
	.b(not_a_cin),
	.c(b_cin),
	.y(bo)
);

and_gate3 and4(
	.a(not_a),
	.b(not_b),
	.c(cin),
	.y(not_a_not_b_cin)
);

and_gate3 and5(
	.a(not_a),
	.b(b),
	.c(not_cin),
	.y(not_a_b_not_cin)
);

and_gate3 and6(
	.a(a),
	.b(b),
	.c(cin),
	.y(a_b_cin)
);

and_gate3 and7(
	.a(a),
	.b(not_b),
	.c(not_cin),
	.y(a_not_b_not_cin)
);

or_gate4 or2(
	.a(not_a_not_b_cin),
	.b(not_a_b_not_cin),
	.c(a_b_cin),
	.d(a_not_b_not_cin),
	.y(d)
);

endmodule
