`define NO_DIGIT 0	// no digit flag
`define R_697	0	// frequency bin 697Hz
`define R_770	1	// frequency bin 770Hz
`define R_852	2	// frequency bin 852Hz
`define R_941	3	// frequency bin 941Hz
`define R_1200	4	// frequency bin 1200Hz
`define R_1336	5	// frequency bin 1336Hz
`define R_1477	6	// frequency bin 1477Hz
`define R_1633	7	// frequency bin 1633Hz
`define GO_FLAG	8	// dummy register,
`define V_697	2'd0
`define V_770	2'd1
`define V_852	2'd2
`define V_941	2'd3
`define V_1200	2'd0
`define V_1336	2'd1
`define V_1477	2'd2
`define V_1633	2'd3
// 4x4 keypad key index
parameter key_1     = {`V_697, `V_1200} ;
parameter key_2     = {`V_697, `V_1336} ;
parameter key_3     = {`V_697, `V_1477} ;
parameter key_a     = {`V_697, `V_1633} ;
parameter key_4     = {`V_770, `V_1200} ;
parameter key_5     = {`V_770, `V_1336} ;
parameter key_6     = {`V_770, `V_1477} ;
parameter key_b     = {`V_770, `V_1633} ;
parameter key_7     = {`V_852, `V_1200} ;
parameter key_8     = {`V_852, `V_1336} ;
parameter key_9     = {`V_852, `V_1477} ;
parameter key_c     = {`V_852, `V_1633} ;
parameter key_star  = {`V_941, `V_1200} ;
parameter key_0     = {`V_941, `V_1336} ;
parameter key_pound = {`V_941, `V_1477} ;
parameter key_d     = {`V_941, `V_1633} ;

// resolved key ascii representation
parameter val_key_1     = "1" ;
parameter val_key_2     = "2" ;
parameter val_key_3     = "3" ;
parameter val_key_a     = "a" ;
parameter val_key_4     = "4" ;
parameter val_key_5     = "5" ;
parameter val_key_6     = "6" ;
parameter val_key_b     = "b" ;
parameter val_key_7     = "7" ;
parameter val_key_8     = "8" ;
parameter val_key_9     = "9" ;
parameter val_key_c     = "c" ;
parameter val_key_star  = "*" ;
parameter val_key_0     = "0" ;
parameter val_key_pound = "#" ;
parameter val_key_d     = "d" ;

//State definitions
`define IDLE      		     4'b0000
`define F1		      		 4'b0001
`define F2	     			 4'b0100
`define F3		    		 4'b0010
`define F4       			 4'b0011
`define F5    	 			 4'b0101
`define F6       			 4'b0110
`define F7         			 4'b0111
`define F8         			 4'b1000
`define CHECK         		 4'b1001
`define OK       			 4'b1010
`define CHARACTER       	 4'b1011
`define P1       			 4'b1100
`define P2       			 4'b1101
`define P3       			 4'b1110
