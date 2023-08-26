`timescale 1ns / 1ps

module FSM_module(
    input clk, reset_n,
    input signal_in,
    output signal_out
    );
    
    // Edge detector with Mealy outputs
    reg state_reg, state_next;
    parameter s0 = 0, s1 = 1;
    
    // Sequential state registers
    always @(*)
    begin
        if (~reset_n)
            state_reg = s0;
        else
            state_reg = state_next;
    end
    
    // Next state logic
    always @(*)
    begin
        case(state_reg)
            s0: if (signal_in)
                    state_next = s0;
                else
                    state_next = s1;
            s1: if (signal_in)
                    state_next = s0;
                else
                    state_next = s1;
            default: state_next = s0;                
        endcase
    end
    
    // Output logic
    assign signal_out = (state_reg == s1) & signal_in;

    
endmodule
