
module ulaw_lin_conv (
    upcm,
    lpcm
    ) ;
 
/*
 *
 *  @(#) ulaw_lin_conv.v 15.2@(#)
 *  4/8/96  11:29:01
 *
 */

/*
 *
 * Expand u-Law compressed pulse-code-modulation (PCM)
 * data per CCITT G.711
 *
 * Author:  Mark A. Indovina
 *          Cadence Design Systems, Inc.
 *          CSD-IC Technology Laboratory
 *
 */

    output [15:0] lpcm ;                // linear pcm output
    input [7:0] upcm ;                  // u-law compressed pcm input
 
    wire [7:0] upcm ;                   // u-law compressed pcm input
    wire [7:0] inv_upcm = ~upcm ;       // u-law compressed pcm input, inverted
    wire [15:0] lpcm ;                  // computed linear pcm
    wire [13:0] SS ;                    // "un-signed" sample

    wire sign = inv_upcm[7] ;           // sample sign
    wire [2:0] seg = inv_upcm[6:4] ;    // sample normalized segment
    wire [3:0] mag = inv_upcm[3:0] ;    // sample normalized magnitude
 
    assign SS = (((mag<<1) + 33) << seg) - 33 ;

    assign lpcm = sign  ? (17'h10000 - SS) : SS ;

endmodule // ulaw_lin_conv
