`timescale 1ns / 1ps


module Queue_tb();

localparam N = 3;
    reg clk;
    reg  reset_n;
    reg Signal_front ;
    reg Signal_e ;
    reg [N-1:0 ] Tcount;
    wire empty_flag;  
    wire Full_flag;
    wire [2*N : 0 ] Wtime;
    wire [N-1:0 ] Pcounted;
    
    TOP #(.N(N)) TOP_DUT(
         
          .clk(clk), 
          .reset_n(reset_n),
          .Signal_end(Signal_e),
          .Signal_front(Signal_front),
          .Tcount(Tcount),
          .Pcount(Pcounted),
          .Wtime(Wtime),
          .empty_flag(empty_flag),
          .Full_flag(Full_flag)
        );
    
    
    localparam T = 8;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    reg [2:0] num ;
    initial
    begin
        Tcount = 3'B011;
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        reset_n = 1'b0;
        #2
        reset_n = 1'b1;
        
        // clint come
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        #2
        Signal_e = 1'b0;
        Signal_front = 1'b1;
        //
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 1;
        #2
        if(num != Pcounted) 
           begin
            $monitor("Error");
            $stop ;
            end
        else
            $monitor("add one client success total 1");
         
         #2 // clint 2 come
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        #2
        Signal_e = 1'b0;
        Signal_front = 1'b1;
          #2 // clint 2 come
        Signal_e = 1'b1;
        Signal_front = 1'b1;
         num = 2;
         #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
         else
         $monitor("add one client success total 2");
         // client out 
         #2 // clint 2 come
        Signal_e = 1'b1;
        Signal_front = 1'b0;
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
         num = 1;
         #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
         else
         $monitor("remove one client success total 1");
        #2 // clint 3 come
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        #2
        Signal_e = 1'b0;
        Signal_front = 1'b1;
          #2 // clint 2 come
        Signal_e = 1'b1;
        Signal_front = 1'b1;
         num = 2;
         #2
        if(num != Pcounted) 
           begin
            $monitor("Error");
            $stop ;
            end
         else
         $monitor("add one client success total 2");
        #2 // clint 4 come
        Signal_e = 1'b0;
        Signal_front = 1'b1;
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
         num = 3;
         #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
         else
         $monitor("add one client success total 3");
        // client out 
         #2 // clint 2 out
        Signal_e = 1'b1;
        Signal_front = 1'b0;
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 2;
        #2
        if(num != Pcounted) 
           begin
            $monitor("Error");
            $stop ;
            end
         else
         $monitor("remove one client success total 2");
        #2 // clint 2 out
        Signal_e = 1'b0;
        Signal_front = 1'b0;
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 2;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
         else
         $monitor("add and remove one at same time client success total 2");
         #2
        Signal_e = 1'b0;
        Signal_front = 1'b1;
        //
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 3;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
        else
            $monitor("add one client success total 3");
            
          #2
        Signal_e = 1'b0;
        Signal_front = 1'b1;
        //
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 4;
        #2
        if(num != Pcounted) 
           begin
            $monitor("Error");
            $stop ;
            end
        else
            $monitor("add one client success total 4");
          #2
        Signal_e = 1'b0;
        Signal_front = 1'b1;
        //
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 5;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
        else
            $monitor("add one client success total 5");
         #2
        Signal_e = 1'b0;
        Signal_front = 1'b1;
        //
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 6;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
        else
            $monitor("add one client success total 6");
         #2
        Signal_e = 1'b0;
        Signal_front = 1'b1;
        //
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 7;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
        else
            $monitor("add one client success total 7");
         if(Full_flag != 1) 
           begin
            $monitor("Error");
            $stop ;
            end
        else
            $monitor("full flag fires");
          #2
        Signal_e = 1'b0;
        Signal_front = 1'b1;
        //
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 7;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
        else
            $monitor("don't add client because completed total 7");
         if(Full_flag != 1) 
            begin
            $monitor("Error");
            $stop ;
            end
        else
            $monitor("full flag fires");
          
          #2 // clint 2 out
        Signal_e = 1'b1;
        Signal_front = 1'b0;
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 6;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
         else
         $monitor("remove one client success total 6");
        
         #2 // clint 2 out
        Signal_e = 1'b1;
        Signal_front = 1'b0;
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 5;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
         else
         $monitor("remove one client success total 5");
         
          #2 // clint 2 out
        Signal_e = 1'b1;
        Signal_front = 1'b0;
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 4;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
         else
         $monitor("remove one client success total 4");
         
          #2 // clint 2 out
        Signal_e = 1'b1;
        Signal_front = 1'b0;
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 3;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
         else
         $monitor("remove one client success total 3");
         
          #2 // clint 2 out
        Signal_e = 1'b1;
        Signal_front = 1'b0;
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 2;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
         else
         $monitor("remove one client success total 2");
         
          #2 // clint 2 out
        Signal_e = 1'b1;
        Signal_front = 1'b0;
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 1;
        #2
        if(num != Pcounted) 
           begin
            $monitor("Error");
            $stop ;
            end
         else
         $monitor("remove one client success total 1");
         
          #2 // clint 2 out
        Signal_e = 1'b1;
        Signal_front = 1'b0;
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 0;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
         else
         $monitor("remove one client success total 0");
        if(empty_flag != 1) 
            begin
            $monitor("Error");
            $stop ;
            end
        else
            $monitor("empty flag fires");
        #2
        Signal_e = 1'b0;
        Signal_front = 1'b1;
        //
        #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
        num = 1;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
        else
            $monitor("add one client success total 1");
            
        #2
        Signal_e = 1'b0;
        Signal_front = 1'b0;
         num = 1;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
        else
            $monitor("total 1");
            
         #2
        Signal_e = 1'b0;
        Signal_front = 1'b1;
        num = 0;
        #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
         else
         $monitor("remove one client success total 0");
        if(empty_flag != 1) 
            begin
            $monitor("Error");
            $stop ;
            end        else
            $monitor("empty flag fires");
            
         #2
        Signal_e = 1'b1;
        Signal_front = 1'b1;
         num = 1;
         #2
        if(num != Pcounted) 
            begin
            $monitor("Error");
            $stop ;
            end
        else
            $monitor("add one client success total 1");
        
        
       $monitor("--------ALL success----");
        
    end
endmodule
