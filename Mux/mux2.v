`timescale 1ns / 1ps

module mux2(
    input a,
    input b,
    input sel,
    output  y
    );
    assign y= (a&~sel)|(b&sel);
endmodule