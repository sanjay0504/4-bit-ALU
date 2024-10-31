module adder_subtractor(
	input [3:0]a,b,
	input  sub,
	output [3:0]out, 
	output carry_out);

	wire [3:0] b_nxt,cout;
	
	assign b_nxt = b ^ {4{sub}};
	
	full_adder one(.a(a[0]), .b(b_nxt[0]), .c_in(sub), .val(out[0]), .c_out(cout[0]));
	full_adder two(.a(a[1]), .b(b_nxt[1]), .c_in(cout[0]), .val(out[1]), .c_out(cout[1]));
	full_adder three(.a(a[2]), .b(b_nxt[2]), .c_in(cout[1]), .val(out[2]), .c_out(cout[2]));
	full_adder four(.a(a[3]), .b(b_nxt[3]), .c_in(cout[2]), .val(out[3]), .c_out(cout[3]));
	
	assign carry_out = cout[3];

	
endmodule