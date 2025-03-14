/*
Módulo del contador regresivo

Utiliza el módulo de resta para decrementar la cantidad del contador.

Parámetros:
	- N (para simulación): determina la cantidad de bits de los números.
	- clk: El reloj del sistema.
	- rst_async: Señal de reset para reiniciar el contador a su valor inicial.
	- init_number: Número desde dónde empieza el contador.
	- count: Registro que almacena la cuenta.
	
Autor: Eduardo Bolívar Minguet
*/

module ContadorRegresivo #(parameter N = 10) (
    input logic clk,
    input logic rst_async,
    input logic [N-1:0] init_number,
    output logic [N-1:0] count
);
	logic [N-1:0] next_number;
	logic [N-1:0] bouts;
	
	// Se generan N módulos restadores para los N bits del minuendo y el sustraendo.
	generate
		genvar i;
		for (i = 0; i < N; i++) begin : substractor
			Restador r1 (
				.a(count[i]), 
				.b((i == 0) ? 1'b1 : 1'b0),
				.cin((i == 0) ? 1'b0 : bouts[i-1]),
				.d(next_number[i]),
				.bo(bouts[i])
			);
		end
	endgenerate
	
	// Flip flop que disminuye la cuenta en cada ciclo del reloj
	always_ff @(posedge clk or negedge rst_async) begin
		if (!rst_async)
			count <= init_number;
		else if (count > 0)
			count <= next_number;
	end
endmodule
