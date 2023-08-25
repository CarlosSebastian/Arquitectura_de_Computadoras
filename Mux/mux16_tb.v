`timescale 1ns / 1ps

module mux_tb;
    reg [0:15] a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16;
    reg [0:3] sel;
    wire [0:15] y;
    mux mux_16(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,sel,y);
    initial begin
    a1=0;a2=0;a3=0;a4=0;a5=0;a6=0;a7=0;a8=0;a9=0;
    a10=0;a11=0;a12=0;a13=0;a14=0;a15=0;a16=0;sel=0;
    #1 a1=1;sel=0;
    #1 a1=0;a2=2;sel=1;
    #1 a2=0;a3=3;sel=2;
    #1 a3=0;a4=4;sel=3;
    #1 a4=0;a5=5;sel=4;
    #1 a5=0;a6=6;sel=5;
    #1 a6=0;a7=7;sel=6;
    #1 a7=0;a8=8;sel=7;
    #1 a8=0;a9=9;sel=8;
    #1 a9=0;a10=10;sel=9;
    #1 a10=0;a11=11;sel=10;
    #1 a11=0;a12=12;sel=11;
    #1 a12=0;a13=13;sel=12;
    #1 a13=0;a14=14;sel=13;
    #1 a14=0;a15=15;sel=14;
    #1 a15=0;a16=16;sel=15;
    #1 a16=0;sel=0;
    #1 $finish;
    end
endmodule
