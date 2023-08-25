`timescale 1ns / 1ps

module demux7_tb;
    reg [12:0]in;
    reg [2:0]sel;
    wire [12:0] out0,out1,out2,out3,out4,out5,out6;

    demux7 demux7_1(sel,in,out0,out1,out2,out3,out4,out5,out6);

    initial begin
        sel = 3'b000;in=13'b1010101010101;
    #1  sel = 3'b001;in=13'b1010101010101;
    #1  sel = 3'b010;in=13'b1010101010101;
    #1  sel = 3'b011;in=13'b1010101010101;
    #1  sel = 3'b100;in=13'b1010101010101;
    #1  sel = 3'b101;in=13'b1010101010101;
    #1  sel = 3'b110;in=13'b1010101010101;
    #1  sel = 3'b000;in=13'b0000000000000;
    #1  $finish;
    end
endmodule