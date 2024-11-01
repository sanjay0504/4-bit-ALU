module logic_operations(
	input [3:0] a,b,
	output reg [3:0] out,
	input [1:0] sel
);

	always@(*)begin
		case(sel)
			2'd0 : out = a & b;
			2'd1 : out = a | b;
			2'd2 : out = a ^ b;
			default : out = 4'bx;
		endcase
	end
endmodule