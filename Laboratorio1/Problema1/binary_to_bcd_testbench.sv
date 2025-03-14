`timescale 1ns/1ps

module binary_to_bcd_tb();
    logic [3:0] binary_in;
    logic [7:0] bcd_out;
    
    binary_to_bcd dut(
        .binary_in(binary_in),
        .bcd_out(bcd_out)
    );
    
    function void display_results;
        $display("Binario: %4b (%0d) -> BCD: %4b %4b (%0d%0d)", 
                 binary_in, binary_in, 
                 bcd_out[7:4], bcd_out[3:0], 
                 bcd_out[7:4], bcd_out[3:0]);
    endfunction
    
    initial begin
        $display("Iniciando testbench: binario a BCD");
        // Prueba para todos los 16 valores posibles, del 0 al 15.
        
        for (int i = 0; i < 16; i++) begin
            binary_in = i[3:0];
            #10; // Esperar para estabilización
            display_results();
        end
        $display("Fin del testbench");
        $finish;
    end
endmodule