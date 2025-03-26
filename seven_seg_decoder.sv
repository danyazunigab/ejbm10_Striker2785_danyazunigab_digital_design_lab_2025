module seven_seg_decoder #(parameter N = 4)(
	input logic [2*N-1:0] n,
	output logic [6:0] seven_seg1,
	output logic [6:0] seven_seg2,
	output logic [6:0] seven_seg3
);
	
	logic [3:0] digit1, digit2, digit3;
    
    always_comb begin
        int temp;
        temp = n;
        
        digit1 = temp % 10;
        temp = temp / 10;
        
        digit2 = temp % 10;
        temp = temp / 10;
        
        digit3 = temp % 10;
    end
    
    function logic [6:0] bcd_to_7seg(input logic [3:0] bcd);
        case (bcd)
            4'd0: bcd_to_7seg = 7'b1000000;
            4'd1: bcd_to_7seg = 7'b1111001;
            4'd2: bcd_to_7seg = 7'b0100100;
            4'd3: bcd_to_7seg = 7'b0110000;
            4'd4: bcd_to_7seg = 7'b0011001;
            4'd5: bcd_to_7seg = 7'b0010010;
            4'd6: bcd_to_7seg = 7'b0000010;
            4'd7: bcd_to_7seg = 7'b1111000;
            4'd8: bcd_to_7seg = 7'b0000000;
            4'd9: bcd_to_7seg = 7'b0010000;
            default: bcd_to_7seg = 7'b1111111;
        endcase
    endfunction
    
    assign seven_seg1 = bcd_to_7seg(digit1);
    assign seven_seg2 = bcd_to_7seg(digit2);
    assign seven_seg3 = bcd_to_7seg(digit3);
    
endmodule
