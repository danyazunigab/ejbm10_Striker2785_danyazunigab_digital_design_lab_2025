module testbench();

	parameter N = 8;
    logic clk;
    logic rst_async;
    logic [N-1:0] init_number;
    logic [N-1:0] count;

    ContadorRegresivo #(.N(N)) uut (
        .clk(clk),
        .rst_async(rst_async),
        .init_number(init_number),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk; // 10 time units clock period

    initial begin
        // Initialize signals
        clk = 0;
			rst_async = 0;
		  init_number = 8'd6;
			#10 rst_async = 1;
			
        // Let the counter decrement
        #100;

		  $stop;
    end
endmodule

