module alu_4bit(
	input [3:0] a,b,
	input [2:0] opcode,
	input in_sel,
	output reg [3:0] out,
	output reg carry,
	output [3:0] inaled,inbled,
	output [2:0] opled,
	output sel_led
);

	wire [3:0]add_out,sub_out,and_out,or_out,xor_out,left_shift_out,right_shift_out;
	wire add_carry, sub_carry;

	adder_subtractor adder(.a(a),.b(b),.sub(1'b0),.out(add_out),.carry_out(add_carry));
	adder_subtractor subtractor(.a(a),.b(b),.sub(1'b1),.out(sub_out),.carry_out(sub_carry));
	logic_operations and_op(.a(a),.b(b),.sel(2'd0),.out(and_out));
	logic_operations or_op(.a(a),.b(b),.sel(2'd1),.out(or_out));
	logic_operations xor_op(.a(a),.b(b),.sel(2'd2),.out(xor_out));
	left_right_shift left(.a((in_sel) ? b : a), .out(left_shift_out), .sel(1'b0));
	left_right_shift right(.a((in_sel) ? b : a), .out(right_shift_out), .sel(1'b1));
	
	always@(*)begin
		case(opcode)
			3'b001: begin
				out = add_out;
				carry = add_carry;
			end
			3'b010: begin
				out = sub_out;
				carry = sub_carry;
			end
			3'b011:begin
				out = and_out;
				carry = 1'b0;
			end
			3'b100:begin
				out = or_out;
				carry = 1'b0;
			end
			3'b101:begin
				out = xor_out;
				carry = 1'b0;
			end
			3'b110:begin
				out = left_shift_out;
				carry = 1'b0;
			end
			3'b111:begin
				out = right_shift_out;
				carry = 1'b0;
			end
			default: begin
				out = 4'b0000;
				carry = 1'b0;
			end
		endcase
	end
	
	assign inaled = a;
	assign inbled = b;
	assign opled = opcode;
	assign sel_led = in_sel;

endmodule