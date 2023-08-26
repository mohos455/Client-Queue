`timescale 1ns / 1ps

module LUP_T
    #(parameter N= 3 )(
        
    input [N-1 : 0 ] Tcount,
    input [N-1 : 0 ] Pcount ,
    output  reg [ 2*N  : 0 ] Wtime 
    );
    
    always@(*)
    begin
    if(Pcount ==0 )
        Wtime = 0;
     else
        Wtime = 3*(Tcount+Pcount-1)/Tcount;
     end
     
endmodule
