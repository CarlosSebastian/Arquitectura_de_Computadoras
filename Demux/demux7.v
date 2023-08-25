`timescale 1ns / 1ps

module demux7(sel,in,out0,out1,out2,out3,out4,out5,out6);
    input [12:0]in;
    input [2:0]sel;
    output reg [12:0] out0,out1,out2,out3,out4,out5,out6;

    always@(*)
    begin
        case(sel)
            3'b000: out0=in;
            3'b001: out1=in;
            3'b010: out2=in;
            3'b011: out3=in;
            3'b100: out4=in;
            3'b101: out5=in;
            3'b110: out6=in;
        endcase
    end
endmodule