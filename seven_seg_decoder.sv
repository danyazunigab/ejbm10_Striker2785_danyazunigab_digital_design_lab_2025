module seven_seg_decoder #(parameter N = 4)(
	input logic [2*N-1:0] n,
	output logic [6:0] seven_seg1,
	output logic [6:0] seven_seg2
);
	
	assign seven_seg1[0] = (~n[3] & ~n[2] & ~n[1] & n[0]) | (~n[3] & n[2] & ~n[1] & ~n[0]) | (n[3] & ~n[2] & n[1] & n[0]) | (n[3] & n[2] & ~n[1] & n[0]);
	assign seven_seg1[1] = (n[2] & n[1] & ~n[0]) | (n[3] & n[1] & n[0]) | (n[3] & n[2] & ~n[0]) | (~n[3] & n[2] & ~n[1] & n[0]);
	assign seven_seg1[2] = (n[3] & n[2] & ~n[0]) | (n[3] & n[2] & n[1]) | (~n[3] & ~n[2] & n[1] & ~n[0]);
	assign seven_seg1[3] = (~n[2] & ~n[1] & n[0]) | (n[2] & n[1] & n[0]) | (~n[3] & n[2] & ~n[1] & ~n[0]) | (n[3] & ~n[2] & n[1] & ~n[0]);
	assign seven_seg1[4] = (~n[3] & n[0]) | (~n[2] & ~n[1] & n[0]) | (~n[3] & n[2] & ~n[1]);
	assign seven_seg1[5] = (~n[3] & ~n[2] & n[0]) | (~n[3] & ~n[2] & n[1]) | (~n[3] & n[1] & n[0]) | (n[3] & n[2] & ~n[1] & n[0]);
	assign seven_seg1[6] = (~n[3] & ~n[2] & ~n[1]) | (~n[3] & n[2] & n[1] & n[0]) | (n[3] & n[2] & ~n[1] & ~n[0]);
	
	assign seven_seg2[0] = (~n[7] & ~n[6] & ~n[5] & n[4]) | (~n[7] & n[6] & ~n[5] & ~n[4]) | (n[7] & ~n[6] & n[5] & n[4]) | (n[7] & n[6] & ~n[5] & n[4]);
	assign seven_seg2[1] = (n[6] & n[5] & ~n[4]) | (n[7] & n[5] & n[4]) | (n[7] & n[6] & ~n[4]) | (~n[7] & n[6] & ~n[5] & n[4]);
	assign seven_seg2[2] = (n[7] & n[6] & ~n[4]) | (n[7] & n[6] & n[5]) | (~n[7] & ~n[6] & n[5] & ~n[4]);
	assign seven_seg2[3] = (~n[6] & ~n[5] & n[4]) | (n[6] & n[5] & n[4]) | (~n[7] & n[6] & ~n[5] & ~n[4]) | (n[7] & ~n[6] & n[5] & ~n[4]);
	assign seven_seg2[4] = (~n[7] & n[4]) | (~n[6] & ~n[5] & n[4]) | (~n[7] & n[6] & ~n[5]);
	assign seven_seg2[5] = (~n[7] & ~n[6] & n[4]) | (~n[7] & ~n[6] & n[5]) | (~n[7] & n[5] & n[4]) | (n[7] & n[6] & ~n[5] & n[4]);
	assign seven_seg2[6] = (~n[7] & ~n[6] & ~n[5]) | (~n[7] & n[6] & n[5] & n[4]) | (n[7] & n[6] & ~n[5] & ~n[4]);
	
endmodule
