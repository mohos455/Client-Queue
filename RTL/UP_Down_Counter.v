`timescale 1ns / 1ps

module UP_Down_Counter #(parameter BITS = 3)(
    input clk,
    input reset_n,
    input up,down, 
    output [BITS - 1:0] Q
    );
    
    reg [BITS - 1:0] Q_reg, Q_next;
    
    always @(*)
    begin
        if (~reset_n)
            Q_reg = 'b0;
        else 
            Q_reg = Q_next;
    end
    
    // Next state logic
    always @(Q_reg, up,down)
    begin
        Q_next = Q_reg;
        if ((up& ~down) & Q_reg < 7 )
            Q_next = Q_reg + 1;
        else if (down & ~up & Q_reg > 0 )
            Q_next = Q_reg - 1;
        else
            Q_next = Q_reg ;
    end
    
    // Output logic
    assign Q = Q_reg;
endmodule
