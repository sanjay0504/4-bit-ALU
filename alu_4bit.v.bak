module full_adder(
	input a,b,c_in,
	output val,c_out);
	
	assign val = a ^ b ^ c_in;
	assign c_out = ((a&b) | (b&c_in) | (c_in&a));
	
endmodule