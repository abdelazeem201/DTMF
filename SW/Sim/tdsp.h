
/*
 *
 *  @(#) tdsp.h 16.1@(#)
 *  5/31/96  15:15:53
 *
 */

/*
 * Tiny DSP
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

`define _tdsp_
`define WIDTH       16              // word size in bits
`define W_ACC       33              // accumulator width
`define ACC         32              // accumulator attribute MSB
`define ACCH        31:16           // accumulator high word bit selects
`define ACCL        15:0            // accumulator low word bit selects
`define OP          16              // opcode word size in bits
`define TP          8               // opcode word size in bits (high word)
`define NP          4               // opcode word size in bits (high nibble)
`define P_ADDR      8               // program address attribute MSB
`define ADDR        7               // address attribute MSB
`define IDATA       7               // immediate data attribute MSB
`define HMSB        31              // long word attribute MSB
`define MSB         15              // word attribute MSB
`define S_ACC_OV    32              // accumulator overflow bit
`define S_ACC_SIGN  31              // accumulator sign bit
`define S_ACC_TC    31:0            // accumulator two's comp. bits
`define S_ACC       30:0            // accumulator value bits
`define S_OP        15:8            // opcode bit selects
`define S_IDATA     7:0             // immediate data bit selects
`define S_IADDR     6:0             // immediate address bit selects
`define ADDR_S      7:0             // address attribute size range
`define P_ADDR_S    7:0             // program address attribute size range
`define ALUCMD      3               // ALU command code MSB
`define OPACMD      2               // OPA command code MSB
`define OPBCMD      2               // OPB command code MSB
`define PORT        2               // port address MSB
`define PORTA       3               // port address size
`define SHIFT       4               // operand shift size
`define MPY_K       13              // multiply immediate data size
`define OP_PORTA    10:8            // port address opcode bit selects
`define OP_ACC_SHFT 10:8            // operand acc opcode bit selects
`define OP_SHIFT    11:8            // operand opcode bit selects
`define OP_MPY_K    12:0            // multiply immediate data bit selects
`define PORTA_S     2:0             // port address attribute size range
`define SHIFT_S     3:0             // shift attribute size range
`define S_MPY_K     12:0            // mpy constant attribute bit selects
`define S_MPYK_OC   15:13           // mpy constant opcode bit selects
`define E_PORTA     5'b00000        // zero extend port address
`define MSB_MPY_K   12              // MSB of mpyk constant data

`define ALU_ADD     4'b0000         // ALU add opcode
`define ALU_SUB     4'b0001         // ALU subtract opcode
`define ALU_AND     4'b0010         // ALU logical and opcode
`define ALU_OR      4'b0011         // ALU logical or opcode
`define ALU_XOR     4'b0100         // ALU logical xor opcode
`define ALU_ABS     4'b0101         // ALU absolute value
`define ALU_OPA     4'b0110         // ALU pass operand a opcode
`define ALU_OPB     4'b0111         // ALU pass operand b opcode

`define P_P_A       3'b000          // +op_a, +op_b, a.GT.b
`define P_P_B       3'b001          // +op_a, +op_b, b.GT.a
`define P_N_A       3'b010          // +op_a, -op_b, a.GT.b
`define P_N_B       3'b011          // +op_a, -op_b, b.GT.a
`define N_P_A       3'b100          // -op_a, +op_b, a.GT.b
`define N_P_B       3'b101          // -op_a, +op_b, b.GT.a
`define N_N_A       3'b110          // -op_a, -op_b, a.GT.b
`define N_N_B       3'b111          // -op_a, -op_b, b.GT.a

`define OP_A_MDR    3'b000          // opcode, 
`define OP_A_ACC    3'b001          // opcode, 
`define OP_A_TOP    3'b011          // opcode, 
`define OP_A_IR     3'b111          // opcode, 

`define OP_B_SE     3'b000          // opcode, 
`define OP_B_MDRH   3'b001          // opcode, 
`define OP_B_MDRL   3'b011          // opcode, 
`define OP_B_MDR    3'b111          // opcode, 
`define OP_B_ZE     3'b110          // opcode, 
`define OP_B_P      3'b100          // opcode, 
`define OP_B_EIR    3'b101          // opcode, 

`define AR0_INC     3'b100          // opcode, ar0 increment
`define AR0_DEC     3'b010          // opcode, ar0 decrement
`define AR1_INC     3'b101          // opcode, ar1 increment
`define AR1_DEC     3'b011          // opcode, ar1 decrement

// opcode line codes
`define S_OP_LINE   15:13           // opcode line bit selects
`define OP_LINE_0   3'h0            // opcode line 0
`define OP_LINE_1   3'h1            // opcode line 1
`define OP_LINE_2   3'h2            // opcode line 2
`define OP_LINE_3   3'h3            // opcode line 3
`define OP_LINE_4   3'h4            // opcode line 4
`define OP_LINE_5   3'h5            // opcode line 5
`define OP_LINE_6   3'h6            // opcode line 6
`define OP_LINE_7   3'h7            // opcode line 7

// opcode high nibble codes
`define S_HI_NIB    15:12           // opcode high nibble bit selects
`define HI_NIB_0    4'h0            // opcode high nibble 0
`define HI_NIB_1    4'h1            // opcode high nibble 1
`define HI_NIB_2    4'h2            // opcode high nibble 2
`define HI_NIB_3    4'h3            // opcode high nibble 3
`define HI_NIB_4    4'h4            // opcode high nibble 4
`define HI_NIB_5    4'h5            // opcode high nibble 5
`define HI_NIB_6    4'h6            // opcode high nibble 6
`define HI_NIB_7    4'h7            // opcode high nibble 7
`define HI_NIB_8    4'h8            // opcode high nibble 8
`define HI_NIB_9    4'h9            // opcode high nibble 9
`define HI_NIB_A    4'ha            // opcode high nibble a
`define HI_NIB_B    4'hb            // opcode high nibble b
`define HI_NIB_C    4'hc            // opcode high nibble c
`define HI_NIB_D    4'hd            // opcode high nibble d
`define HI_NIB_E    4'he            // opcode high nibble e
`define HI_NIB_F    4'hf            // opcode high nibble f

// opcode low nibble codes
`define S_LO_NIB    11:8            // opcode low nibble bit selects
`define LO_NIB_0    4'h0            // opcode low nibble 0
`define LO_NIB_1    4'h1            // opcode low nibble 1
`define LO_NIB_2    4'h2            // opcode low nibble 2
`define LO_NIB_3    4'h3            // opcode low nibble 3
`define LO_NIB_4    4'h4            // opcode low nibble 4
`define LO_NIB_5    4'h5            // opcode low nibble 5
`define LO_NIB_6    4'h6            // opcode low nibble 6
`define LO_NIB_7    4'h7            // opcode low nibble 7
`define LO_NIB_8    4'h8            // opcode low nibble 8
`define LO_NIB_9    4'h9            // opcode low nibble 9
`define LO_NIB_A    4'ha            // opcode low nibble a
`define LO_NIB_B    4'hb            // opcode low nibble b
`define LO_NIB_C    4'hc            // opcode low nibble c
`define LO_NIB_D    4'hd            // opcode low nibble d
`define LO_NIB_E    4'he            // opcode low nibble e
`define LO_NIB_F    4'hf            // opcode low nibble f

// start_of_opcodes
`define ABS     16'h7f88   // Absolute value of accumulator
`define ADD     8'h00     // Add to low accumulator
`define ADDH    8'h60     // Add to high accumulator
`define ADDS    8'h61     // Add to low accumulator with sign-extension suppressed
`define AND     8'h79     // And with low accumulator
`define APAC    16'h7f8f   // Add Product to accumulator
`define B       8'hf5     // Branch unconditionally
`define BANZ    8'hf4     // Branch if auxiliary register != 0
`define BGEZ    8'hfd     // Branch if accumulator >= 0
`define BGZ     8'hfc     // Branch if accumulator > 0
`define BIOZ    8'hf6     // Branch if bio == 0
`define BLEZ    8'hfb     // Branch if accumulator <= 0
`define BLZ     8'hfa     // Branch if accumulator < 0
`define BNZ     8'hfe     // Branch if accumulator != 0
`define BV      8'hf9     // Branch on overflow
`define BZ      8'hff     // Branch if accumulator == 0
`define CALA    16'h7f8c   // Call subroutine indirect
`define CALL    8'hf5     // Call subroutine direct
`define DINT    16'h7f81   // Disable interrupts
`define DMOV    8'h45     // Data move in memory
`define EINT    16'h7f82   // Enable interrupts
`define IN      8'ha0     // Input data from port
`define LAC     8'h20     // Load accumulator
`define LACK    8'h7e     // Load accumulator with a constant
`define LAR     8'h38     // Load Auxiliary register
`define LARK    8'h70     // Load Auxiliary register with a constant
`define LARP    8'h68     // Load Auxiliary register pointer
`define LDP     8'h6f     // Load data page pointer
`define LDPK    8'h6e     // Load data page pointer with a constant
`define LST     8'h7b     // Load status from data memory
`define LT      8'h40     // Load multiply temporary operand
`define LTA     8'h42     // Load multiply temporary operand and accumulate previous result
`define LTD     8'h46     // Load multiply temporary operand, accumulate previous result, shift data memory
`define LTP     8'h43     // Load multiply temporary operand, previous result moved to accumulator
`define LTS     8'h44     // Load multiply temporary operand and subtract previous result
`define MAR     8'h68     // Modify auxiliary register
`define MPY     8'h6d     // Multiply
`define MPYK    8'h80     // Multiply immediate
`define MAC     8'hc0     // Multiply and accumulate (not really in tms32010, in tms32020)
`define NOP     16'h7f80   // No operation
`define OR      8'h7a     // Or with low accumulator
`define OUT     8'hb0     // Output data from port
`define PAC     16'h7f8e   // Move Product to accumulator
`define POP     16'h7f9d   // Pop top of stack to accumulator
`define PUSH    16'h7f9c   // Push accumulator onto stack
`define RET     16'h7f8d   // Return from subroutine
`define ROVM    16'h7fa0   // Reset overflow mode register
`define SACH    8'h58     // Store high accumulator
`define SACL    8'h50     // Store low accumulator
`define SAR     8'h30     // Store auxiliary register
`define SOVM    16'h7f8b   // Set overflow mode register
`define SPAC    16'h7f90   // Subtract P register from accumulator
`define SST     8'h7c     // Store status
`define SUB     8'h10     // Subtract from high accumulator
`define SUBC    8'h64     // Conditional subtract
`define SUBH    8'h62     // Subtract from high accumulator
`define SUBS    8'h63     // Subtract from accumulator with sign-extension suppressed
`define TBLR    8'he7     // Table Read
`define TBLW    8'hed     // Table Write
`define XOR     8'h78     // Xor with low accumulator
`define ZAC     8'h7e     // Zero accumulator
`define ZALH    8'h65     // Zero accumulator and load high
`define ZALS    8'h66     // Zero accumulator and load low with sign-extension suppressed
// end_of_opcodes

// expanded opcode encodings
`define FULLOP      8'h7f     // misc, full opcodes
`define ADD_n       4'h0
`define IN_n        4'h4
`define LAC_n       4'h2
`define LAR0        8'h38
`define LAR1        8'h39
`define SAR0        8'h30
`define SAR1        8'h31
`define LARK0       8'h70
`define LARK1       8'h71
`define MPYK_x      3'h4
`define OUT_n       4'h4
`define SACH_n      4'h5
`define SACL_n      4'h5
`define SAR0        8'h30
`define SAR1        8'h31
`define SUB_n       4'h1

// tdsp states
`define TDSP_PHI_1		3'b000
`define TDSP_PHI_2		3'b001
`define TDSP_PHI_3		3'b010
`define TDSP_PHI_4		3'b011
`define TDSP_PHI_5		3'b100
`define TDSP_PHI_6		3'b101
`define TDSP_WAIT		3'b110
`define TDSP_RECOVERY	3'b111
