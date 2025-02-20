//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2023 02:25:04 PM
// Design Name: 
// Module Name: top_example
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
`timescale 1ns / 1ps

module hamming_decoder (
    input [6:0] received,           
    output [3:0] data,
    output reg [2:0] error
);

    reg [6:0] corrected;
    reg [2:0] check;
    reg [2:0] index;
    
    always @(received) begin
        // Calculate check
        check[2] = received[1] ^ received[2] ^ received[3] ^ received[6];
        check[1] = received[0] ^ received[2] ^ received[3] ^ received[5];
        check[0] = received[0] ^ received[1] ^ received[3] ^ received[4];
        
        error = check;
        corrected = received;
        
        if (check != 3'b000) begin
        // If error != 0, there is a fault
            if (check == 3'b100) begin
                index = 0;
            end
            
            if (check == 3'b010) begin
                index = 1;
            end
            
            if (check == 3'b110) begin
                index = 2;
            end
            
            if (check == 3'b001) begin
                index = 3;
            end
            
            if (check == 3'b101) begin
                index = 4;
            end
            
            if (check == 3'b011) begin
                index = 5;
            end
            
            if (check == 3'b111) begin
                index = 6;
            end
            
            corrected[index] = ~received[index];  
        end
    end

    assign data = corrected[3:0];
endmodule

