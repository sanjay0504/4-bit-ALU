module left_right_shift(
    input [3:0] a,
    output [3:0] out,
    input sel
    );
    
    assign out = (sel) ? a >> 1 : a << 1;
    
endmodule