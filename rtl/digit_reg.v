
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
 *         Zagazig University.
 *         
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
    digit_out;

reg [7:0]
    digit_mux ;

/*
digit_subreg upper(
    .clock(clk), 
    .din(digit_mux[7:4]), 
    .dout(digit_out[7:4]), 
    .reset(reset));

digit_subreg lower(
    .clock(clk), 
    .din(digit_mux[3:0]), 
    .dout(digit_out[3:0]), 
    .reset(reset));
*/

always @(posedge clk or posedge reset)
    if (reset)
        digit_out <= 8'hff ;
    else
        digit_out <= digit_in ;
        
always @(posedge clk or posedge reset)
    if (reset)
        flag_out <= 1 ;
    else
        flag_out <= flag_in ;
        
endmodule // digit_reg
