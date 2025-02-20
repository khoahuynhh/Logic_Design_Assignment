//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 11:19:20 PM
// Design Name: 
// Module Name: hamming_decoder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module hamming_decoder_tb;
    reg [6:0] received;
    wire [3:0] data;
    wire [2:0] error;
    
    hamming_decoder a1(received, data, error);
    
    initial
    $monitor(
        "time %t: data3=%b,data2=%b,data1=%b,data0=%b\n",
        $time,data[3],data[2],data[1],data[0]
    );
    
    initial begin 
    received=7'b1011000; // false case
    #5 received=7'b1010101; // true case
    #5 received=7'b1100011; // true case
    #5 received=7'b1110110; // false case
    end
    
    initial #50 $stop;
endmodule


