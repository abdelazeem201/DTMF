
module decode_i (
    clk,
    reset,
    phi_1,
    phi_2,
    phi_3,
    phi_4,
    phi_5,
    phi_6,
    decode,
    p_data_out,
    ir,
    skip_one,
    read_prog,
    go_prog,
    read_data,
    go_data,
    read_port,
    go_port,
    decode_skip_one
    );

/*
 *
 *  @(#) decode_i.v 16.1@(#)
 *  5/31/96  15:15:39
 *
 */

/*
 * Tiny DSP Instruction Decoder
 *
 * Tiny DSP,
 *  mimics some of the instruction set functionality of the
 *  TMS320 DSP family
 *
 * Author:  Mark A. Indovina
 *          Cadence Design Systems, Inc.
 *          CSD-IC Technology Laboratory
 *
 */

// fetch defines
`include "tdsp.h"

// types...
input               clk,                    // System clock
                    reset,                  // System reset
                    phi_1,                  // cycle phase 1
                    phi_2,                  // cycle phase 2
                    phi_3,                  // cycle phase 3
                    phi_4,                  // cycle phase 4
                    phi_5,                  // cycle phase 5
                    phi_6,                  // cycle phase 6
                    skip_one;               // execute_i skip one cycle
input   [`MSB:0]    p_data_out;             // program bus data

output              read_prog,              // read program bus
                    go_prog,                // program bus mach. go flag
                    read_data,              // read data bus
                    go_data,                // data bus mach. go flag
                    read_port,              // read port bus
                    go_port,                // port bus mach. go flag
                    decode_skip_one;        // decode_i skip one cycle
output  [`MSB:0]    decode,                 // Decode Holding Register
                    ir;                     // Instruction Holding Register
reg                 read_data,
                    read_prog,
                    read_port,
                    go_data,
                    go_prog,
                    go_port,
                    two_cycle,
                    decode_skip_one,
                    null_op;                // should be optimized out...
reg     [`MSB:0]    decode,
                    ir;

wire                clk,                    // System clock
                    reset,                  // System reset
                    phi_1,
                    phi_2,
                    phi_3,
                    phi_4,
                    phi_5,
                    phi_6,
                    skip_one;
wire    [`MSB:0]    p_data_out;

parameter Z = 16'bz;

//
// reset machine
//
always @(posedge reset or posedge clk)
    begin
    if (reset)
        begin
         decode <= `NOP;
         ir <= `NOP;
         read_prog <= 0;
         go_prog <= 0;
         read_data <= 0;
         go_data <= 0;
         read_port <= 0;
         go_port <= 0;
         two_cycle <= 0;
         decode_skip_one <= 0;
        end // if
          
//
// decode instruction
//

    else
        begin
        if (phi_3)
            begin
            read_prog <= 0;
            go_prog <= 0;
            read_data <= 0;
            go_data <= 0;
            read_port <= 0;
            go_port <= 0;
            two_cycle <= 0;
            end
        if (phi_6 && ! skip_one)
            begin
            decode <= p_data_out ;
            ir <= decode ;
            if ( ! two_cycle && ! decode_skip_one  )
                begin
                go_prog <= 1 ;
                read_prog <= 1 ;
                case (decode[`S_OP_LINE]) // synopsys full_case parallel_case
                `OP_LINE_0: begin
                    case (decode[`S_HI_NIB]) // synopsys full_case parallel_case
                    `HI_NIB_0: begin
                        // asm:ADD
                        read_data <= 1;
                        go_data <= 1;
                        end
                    `HI_NIB_1: begin
                        // asm:SUB
                        read_data <= 1;
                        go_data <= 1;
                        end
                    default: begin
                        null_op <= 0 ;
                        end
                    endcase
                    end
                `OP_LINE_1: begin
                    case (decode[`S_HI_NIB]) // synopsys full_case parallel_case
                    `HI_NIB_2: begin
                        // asm:LAC
                        read_data <= 1;
                        go_data <= 1;
                        end
                    `HI_NIB_3: begin
                        case (decode[`S_OP]) // synopsys full_case parallel_case
                        // asm:LAR
                        `LAR0,
                        `LAR1: begin
                            read_data <= 1;
                            go_data <= 1;
                            end
                        // asm:SAR
                        `SAR0,
                        `SAR1: begin
                            read_data <= 0;
                            go_data <= 1;
                            end
                        default: begin
                            null_op <= 0 ;
                            end
                        endcase
                        end
                    default: begin
                        null_op <= 0 ;
                        end
                    endcase
                    end
                `OP_LINE_2: begin
                    case (decode[`S_HI_NIB]) // synopsys full_case parallel_case
                    `HI_NIB_4: begin
                        case (decode[`S_OP]) // synopsys full_case parallel_case
                        `DMOV: begin
                            // asm:DMOV
                            go_prog <= 0 ;
                            read_data <= 1;
                            go_data <= 1;
                            two_cycle <= 1 ;
                            end
                        // asm:LT
                        // asm:LTA
                        // asm:LTD
                        // asm:LTP
                        // asm:LTS
                        `LT,
                        `LTA,
                        `LTD,
                        `LTP,
                        `LTS: begin
                            read_data <= 1;
                            go_data <= 1;
                            end
                        default: begin
                            null_op <= 0 ;
                            end
                        endcase
                        end
                    `HI_NIB_5: begin
                        // asm:SACL
                        // asm:SACH
                        read_data <= 0;
                        go_data <= 1;
                        end
                    default: begin
                        null_op <= 0 ;
                        end
                    endcase
                    end
                `OP_LINE_3: begin
                    case (decode[`S_HI_NIB]) // synopsys full_case parallel_case
                    `HI_NIB_6: begin
                        case (decode[`S_OP]) // synopsys full_case parallel_case
                        // asm:ADDH
                        // asm:ADDS
                        // asm:LDP
                        // asm:MPY
                        // asm:SUBH
                        // asm:SUBS
                        // asm:ZALH
                        // asm:ZALS
                        `ADDH,
                        `ADDS,
                        `LDP,
                        `MPY,
                        `SUBH,
                        `SUBS,
                        `ZALH,
                        `ZALS: begin
                            read_data <= 1;
                            go_data <= 1;
                            end
                        default: begin
                            null_op <= 0 ;
                            end
                        endcase
                        end
                    `HI_NIB_7: begin
                        case (decode[`S_OP]) // synopsys full_case parallel_case
                        // asm:NOP
                        // asm:AND
                        // asm:OR
                        // asm:XOR
                        `AND,
                        `OR,
                        `XOR: begin
                            read_data <= 1;
                            go_data <= 1;
                            end
                        default: begin
                            null_op <= 0 ;
                            end
                        endcase
                        end
                    default: begin
                        null_op <= 0 ;
                        end
                    endcase
                    end
                `OP_LINE_4: begin
                    case (decode[`S_HI_NIB]) // synopsys full_case parallel_case
                    `HI_NIB_8: begin
                        null_op <= 0 ;
                        end
                    `HI_NIB_9: begin
                        null_op <= 0 ;
                        end
                    default: begin
                        null_op <= 0 ;
                        end
                    endcase
                    end
                `OP_LINE_5: begin
                    case (decode[`S_HI_NIB]) // synopsys full_case parallel_case
                    `HI_NIB_A: begin
                        // asm:IN
                        go_prog <= 0 ;
                        read_port <= 1 ;
                        go_port <= 1 ;
                        two_cycle <= 1 ;
                        end
                    `HI_NIB_B: begin
                        // asm:OUT
                        go_prog <= 0 ;
                        read_data <= 1 ;
                        go_data <= 1 ;
                        two_cycle <= 1 ;
                        end
                    default: begin
                        null_op <= 0 ;
                        end
                    endcase
                    end
                `OP_LINE_6: begin
                    case (decode[`S_HI_NIB]) // synopsys full_case parallel_case
                    `HI_NIB_C: begin
                        case (decode[`S_OP]) // synopsys full_case parallel_case
                        // asm:MAC
                        `MAC: begin
                            read_data <= 1;
                            go_data <= 1;
                            end
                        default: begin
                            null_op <= 0 ;
                            end
                        endcase
                        end
                    `HI_NIB_D: begin
                        null_op <= 0 ;
                        end
                    default: begin
                        null_op <= 0 ;
                        end
                    endcase
                    end
                `OP_LINE_7: begin
                    case (decode[`S_HI_NIB]) // synopsys full_case parallel_case
                    `HI_NIB_E: begin
                        case (decode[`S_OP]) // synopsys full_case parallel_case
                        // asm:TBLR
                        `TBLR: begin
                            read_prog <= 1 ;
                            go_prog <= 1 ;
                            two_cycle <= 1 ;
                            end
                        // asm:TBLW
                        `TBLW: begin
                            go_prog <= 0 ;
                            read_data <= 1 ;
                            go_data <= 1 ;
                            two_cycle <= 1 ;
                            end
                        default: begin
                            null_op <= 0 ;
                            end
                        endcase
                        end
                    `HI_NIB_F: begin
                        case (decode[`S_OP]) // synopsys full_case parallel_case
                        // asm:B
                        // asm:BIOZ
                        // asm:BZ
                        // asm:BNZ
                        // asm:BGEZ
                        // asm:BGZ
                        // asm:BLEZ
                        // asm:BLZ
                        // asm:BV
                        // asm:BANZ
                        `B,
                        `BIOZ,
                        `BZ,
                        `BNZ,
                        `BGEZ,
                        `BGZ,
                        `BLEZ,
                        `BLZ,
                        `BV,
                        `BANZ: begin
                            decode_skip_one <= 1 ;
                            end
                        default: begin
                            null_op <= 0 ;
                            end
                        endcase
                        end
                    default: begin
                        null_op <= 0 ;
                        end
                    endcase
                    end
                default: begin
                    null_op <= 0 ;
                    end
                endcase
                end
            else if (decode_skip_one)
                begin
                go_prog <= 1 ;
                read_prog <= 1 ;
                decode_skip_one <= 0 ;
                end
            end
        end
end

endmodule // decode_i
