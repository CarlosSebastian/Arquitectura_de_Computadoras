`timescale 1ns / 1ps

module mux(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,sel,y);
    input [0:15] a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16;
    input [0:3] sel;
    output reg [0:15]y;
    
    always@(*)
    begin
        case(sel)
            4'b0000: y=a1;
            4'b0001: y=a2;
            4'b0010: y=a3;
            4'b0011: y=a4;
            4'b0100: y=a5;
            4'b0101: y=a6;
            4'b0110: y=a7;
            4'b0111: y=a8;
            4'b1000: y=a9;
            4'b1001: y=a10;
            4'b1010: y=a11;
            4'b1011: y=a12;
            4'b1100: y=a13;
            4'b1101: y=a14;
            4'b1110: y=a15;
            4'b1111: y=a16;
        endcase
    end
    
endmodule
