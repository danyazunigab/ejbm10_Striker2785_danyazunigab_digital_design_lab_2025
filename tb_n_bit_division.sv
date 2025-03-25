module tb_n_bit_division;
    parameter N = 8;
    logic [N-1:0] A, B;
    logic [N-1:0] quotient, remainder;
    
    // Instancia del módulo de división
    division #(.N(N)) div_inst (
        .dividend(A),
        .divisor(B),
        .quotient(quotient),
        .remainder(remainder)
    );

    initial begin
        $display("Test de Division y Modulo en SystemVerilog");
        $display("----------------------------------------");
        
        // Caso 1: 10 / 3
        A = 10; B = 3;
        #10; // Espera para simular
        $display("A = %d, B = %d | A / B = %d, A %% B = %d", A, B, quotient, remainder);

        // Caso 2: 15 / 4
        A = 15; B = 4;
        #10;
        $display("A = %d, B = %d | A / B = %d, A %% B = %d", A, B, quotient, remainder);

        // Caso 3: 20 / 5
        A = 20; B = 5;
        #10;
        $display("A = %d, B = %d | A / B = %d, A %% B = %d", A, B, quotient, remainder);

        // Caso 4: 8 / 2
        A = 8; B = 2;
        #10;
        $display("A = %d, B = %d | A / B = %d, A %% B = %d", A, B, quotient, remainder);

        // Caso 5: 7 / 7
        A = 7; B = 7;
        #10;
        $display("A = %d, B = %d | A / B = %d, A %% B = %d", A, B, quotient, remainder);

        // Caso 6: Divisor mayor que el dividendo
        A = 5; B = 9;
        #10;
        $display("A = %d, B = %d | A / B = %d, A %% B = %d", A, B, quotient, remainder);

        // Caso 7: División entre 1
        A = 12; B = 1;
        #10;
        $display("A = %d, B = %d | A / B = %d, A %% B = %d", A, B, quotient, remainder);

        // Caso 8: División entre 0 (debe manejarse con precaución)
        A = 10; B = 0;
        #10;
        if (B == 0) 
            $display("Error: División por cero no permitida.");
        else 
            $display("A = %d, B = %d | A / B = %d, A %% B = %d", A, B, quotient, remainder);

        $stop; // Detiene la simulación
    end
endmodule
