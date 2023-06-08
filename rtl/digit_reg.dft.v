
module digit_reg (
    reset,
    clk,
    digit_in,
    digit_out,
    flag_in,
    flag_out
    ) ;
 
/*
 *
 *  @(#) digit_reg.v 15.1@(#)
 *  4/1/23  09:09:52
 *
 */

/*
 *
 * ASCII Digit Register
 *
 * Author:  Ahmed Abdelazeem
 *          Zagazig University.
 *          
 */

input
    reset,                // system reset
    clk ;                 // write strobe

input [7:0]
    digit_in ;                  // data input

output [7:0]
    digit_out ;                 // data output

input
    flag_in ;             // data change flag input

output
    flag_out ;            // data change flag output

reg
    flag_out ;

reg [7:0]
    digit_out ;

always @(posedge clk or posedge reset)
    if (reset)
        begin
        digit_out <= 8'hff ;
        flag_out <= 1 ;
        end
    else
        begin
        digit_out <= digit_in ;
        flag_out <= flag_in ;
        end
        
endmodule // digit_reg
