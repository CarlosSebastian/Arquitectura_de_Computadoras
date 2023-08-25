`timescale 1ns / 1ps

module mux2_tb;
    reg a,b;
    reg sel;
    wire y;
    mux2 mux_2(a,b,sel,y);
    initial begin
    a=0;b=0;sel=0;
    #1 a=0;b=1;sel=0;
    #1 a=1;b=0;sel=0;
    #1 a=1;b=0;sel=1;
    #1 a=0;b=1;sel=1;
    #1 a=0;b=0;sel=0;
    #1 $finish;
    end
    endmodule