
module data_sample_mux (
    d_addrs,
    d_datain,
    d_wr,
    t_addrs,
    t_datain,
    t_wr,
    write,
    addrs,
    datain,
    t_grant
    ) ;
 
/*
 *
 *  @(#) data_sample_mux.v 15.1@(#)
 *  4/1/96  09:09:50
 *
 */

/*
 *
 * Data Sample RAM mux
 *
 * Author:  Mark A. Indovina
 *          Cadence Design Systems, Inc.
 *          CSD-IC Technology Laboratory
 *
 */

input
    t_grant,                // tdsp bus grant
    d_wr,                   // dma controller write strobe
    t_wr ;                  // tdsp write strobe

input [7:0]
    d_addrs,                // dma controller address bus
    t_addrs ;               // tdsp address bus

input [15:0]
    d_datain,               // dma controller data bus
    t_datain ;              // tdsp data bus

output
    write ;                 // resolved data sample ram write strobe

output [7:0]
    addrs ;                 // resolved data sample ram address bus

output [15:0]
    datain ;                // resolved data sample ram data bus

reg
    write ;

reg [7:0]
    addrs ;

reg [15:0]
    datain ;

//
// muxes
//
always @(t_grant or d_wr or t_wr)
    if (t_grant)
        write <= t_wr ;
    else
        write <= d_wr ;

always @(t_grant or d_addrs or t_addrs)
    if (t_grant)
        addrs <= t_addrs ;
    else
        addrs <= d_addrs ;

always @(t_grant or d_datain or t_datain)
    if (t_grant)
        datain <= t_datain ;
    else
        datain <= d_datain ;

endmodule // data_sample_mux
