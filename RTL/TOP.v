`timescale 1ns / 1ps

module TOP
    #(parameter N= 3 )(
    input clk, reset_n,
    input Signal_end,
    input Signal_front,
    input [N-1 : 0 ] Tcount,
    output [N-1 : 0 ] Pcount,
    output [ 2*N  : 0 ] Wtime,
    output empty_flag,
    output Full_flag
    );
    
   wire up,down;
   wire [N - 1:0] Q ;
    FSM_module FSM_END(
    .clk(clk),
    .reset_n(reset_n),
    .signal_in(Signal_end),
    .signal_out(up)
    );
    
    FSM_module FSM_FRONT(
    .clk(clk),
    .reset_n(reset_n),
    .signal_in(Signal_front),
    .signal_out(down)
    );
    
    UP_Down_Counter #(.BITS(N)) UP_Down(
        .clk(clk),
        .reset_n(reset_n),
        .up(up),
        .down(down),
        .Q(Q)
           );
           
    LUP_T #(.N(N))LUP_T1(
        .Tcount(Tcount),
        .Pcount(Q),
        .Wtime(Wtime)
    );
    
    assign Pcount = Q;
    assign empty_flag = (Q==0);
    assign Full_flag = (Q== 3'b111);
endmodule
