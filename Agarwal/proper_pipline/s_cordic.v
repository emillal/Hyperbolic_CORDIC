`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2024 08:50:08 PM
// Design Name: 
// Module Name: s_cordic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top_pip(input [15:0] X,Y,
input [3:0] sn_1,
input clk,
input reset,
input [15:0] theta_in,
output reg [3:0] sn_op,
output reg [15:0] theta_op,
output reg [15:0] Xo,Yo);

wire [15:0] Xin_r1,Yin_r1,theta_in_r1;
reg [15:0] Xin_r2,Yin_r2,theta_in_r2;
reg [15:0] Xin_r3,Yin_r3,theta_in_r3;
reg [15:0] Xin_r4,Yin_r4,theta_in_r4;
reg [15:0] Xin_r5,Yin_r5,theta_in_r5;
reg [15:0] Xin_r6,Yin_r6,theta_in_r6;
reg [15:0] Xin_r7,Yin_r7,theta_in_r7;
reg [15:0] Xin_r8,Yin_r8,theta_in_r8;
reg [15:0] Xin_r9,Yin_r9,theta_in_r9;
reg [15:0] Xin_r10,Yin_r10,theta_in_r10;
reg [15:0] Xin_r11,Yin_r11,theta_in_r11;

wire [3:0] sn_l_r1;
reg [3:0] sn_l_r2;
reg [3:0] sn_l_r3;
reg [3:0] sn_l_r4;
reg [3:0] sn_l_r5;
reg [3:0] sn_l_r6;
reg [3:0] sn_l_r7;
reg [3:0] sn_l_r8;
reg [3:0] sn_l_r9;
reg [3:0] sn_l_r10;
reg [3:0] sn_l_r11;



wire [15:0] Xo_w1,Yo_w1,theta_op_w1;
wire [15:0] Xo_w2,Yo_w2,theta_op_w2;
wire [15:0] Xo_w3,Yo_w3,theta_op_w3;
wire [15:0] Xo_w4,Yo_w4,theta_op_w4;
wire [15:0] Xo_w5,Yo_w5,theta_op_w5;
wire [15:0] Xo_w6,Yo_w6,theta_op_w6;
wire [15:0] Xo_w7,Yo_w7,theta_op_w7;
wire [15:0] Xo_w8,Yo_w8,theta_op_w8;
wire [15:0] Xo_w9,Yo_w9,theta_op_w9;
wire [15:0] Xo_w10,Yo_w10,theta_op_w10;
wire [15:0] Xo_w11,Yo_w11,theta_op_w11;

wire [3:0] sn_op_w1;
wire [3:0] sn_op_w2;
wire [3:0] sn_op_w3;
wire [3:0] sn_op_w4;
wire [3:0] sn_op_w5;
wire [3:0] sn_op_w6;
wire [3:0] sn_op_w7;
wire [3:0] sn_op_w8;
wire [3:0] sn_op_w9;
wire [3:0] sn_op_w10;
wire [3:0] sn_op_w11;


assign Xin_r1 = X;
assign Yin_r1 = Y;
assign theta_in_r1 = theta_in;
assign sn_l_r1 = sn_1;

s_cordic itr_1(.X(Xin_r1),.Y(Yin_r1),.theta_in(theta_in_r1),.sn_1( sn_l_r1),.sn_op(sn_op_w1),.theta_op(theta_op_w1),.Xo(Xo_w1),.Yo(Yo_w1));

s_cordic itr_2(.X(Xin_r2),.Y(Yin_r2),.theta_in(theta_in_r2),.sn_1( sn_l_r2),.sn_op(sn_op_w2),.theta_op(theta_op_w2),.Xo(Xo_w2),.Yo(Yo_w2));

s_cordic itr_3(.X(Xin_r3),.Y(Yin_r3),.theta_in(theta_in_r3),.sn_1( sn_l_r3),.sn_op(sn_op_w3),.theta_op(theta_op_w3),.Xo(Xo_w3),.Yo(Yo_w3));

s_cordic itr_4(.X(Xin_r4),.Y(Yin_r4),.theta_in(theta_in_r4),.sn_1( sn_l_r4),.sn_op(sn_op_w4),.theta_op(theta_op_w4),.Xo(Xo_w4),.Yo(Yo_w4));

s_cordic itr_5(.X(Xin_r5),.Y(Yin_r5),.theta_in(theta_in_r5),.sn_1( sn_l_r5),.sn_op(sn_op_w5),.theta_op(theta_op_w5),.Xo(Xo_w5),.Yo(Yo_w5));

s_cordic itr_6(.X(Xin_r6),.Y(Yin_r6),.theta_in(theta_in_r6),.sn_1( sn_l_r6),.sn_op(sn_op_w6),.theta_op(theta_op_w6),.Xo(Xo_w6),.Yo(Yo_w6));

s_cordic itr_7(.X(Xin_r7),.Y(Yin_r7),.theta_in(theta_in_r7),.sn_1( sn_l_r7),.sn_op(sn_op_w7),.theta_op(theta_op_w7),.Xo(Xo_w7),.Yo(Yo_w7));

s_cordic itr_8(.X(Xin_r8),.Y(Yin_r8),.theta_in(theta_in_r8),.sn_1( sn_l_r8),.sn_op(sn_op_w8),.theta_op(theta_op_w8),.Xo(Xo_w8),.Yo(Yo_w8));

s_cordic itr_9(.X(Xin_r9),.Y(Yin_r9),.theta_in(theta_in_r9),.sn_1( sn_l_r9),.sn_op(sn_op_w9),.theta_op(theta_op_w9),.Xo(Xo_w9),.Yo(Yo_w9));

s_cordic itr_10(.X(Xin_r10),.Y(Yin_r10),.theta_in(theta_in_r10),.sn_1( sn_l_r10),.sn_op(sn_op_w10),.theta_op(theta_op_w10),.Xo(Xo_w10),.Yo(Yo_w10));

//s_cordic itr_11(.X(Xin_r11),.Y(Yin_r11),.theta_in(theta_in_r11),.sn_1( sn_l_r11),.sn_op(sn_op_w11),.theta_op(theta_op_w11),.Xo(Xo_w11),.Yo(Yo_w11));


always@(posedge clk)
	begin
	
	
	if (reset)
	begin
	
	       Xo    <= 0; //cosh
           Yo    <= 0; //sinh
           sn_op <= 0;
           theta_op <= 0;
	end
	   else
	   begin
	   Xin_r2      <= Xo_w1;
	   Yin_r2      <= Yo_w1;
	   theta_in_r2 <= theta_op_w1;
	   sn_l_r2     <= sn_op_w1;
	   
	   Xin_r3      <= Xo_w2;
	   Yin_r3      <= Yo_w2;
	   theta_in_r3 <= theta_op_w2;
	   sn_l_r3     <= sn_op_w2;

	   Xin_r4      <= Xo_w3;
	   Yin_r4      <= Yo_w3;
	   theta_in_r4 <= theta_op_w3;
	   sn_l_r4     <= sn_op_w3;

	   Xin_r5      <= Xo_w4;
	   Yin_r5      <= Yo_w4;
	   theta_in_r5 <= theta_op_w4;
	   sn_l_r5     <= sn_op_w4;
	   
	   Xin_r6      <= Xo_w5;
	   Yin_r6      <= Yo_w5;
	   theta_in_r6 <= theta_op_w5;
	   sn_l_r6     <= sn_op_w5;
	   
	   
	   Xin_r7      <= Xo_w6;
	   Yin_r7      <= Yo_w6;
	   theta_in_r7 <= theta_op_w6;
	   sn_l_r7     <= sn_op_w6;
	   
	   Xin_r8      <= Xo_w7;
	   Yin_r8      <= Yo_w7;
	   theta_in_r8 <= theta_op_w7;
	   sn_l_r8     <= sn_op_w7;
	   
	   
	   Xin_r9      <= Xo_w8;
	   Yin_r9      <= Yo_w8;
	   theta_in_r9 <= theta_op_w8;
	   sn_l_r9     <= sn_op_w8;
	   
	   Xin_r10      <= Xo_w9;
	   Yin_r10      <= Yo_w9;
	   theta_in_r10 <= theta_op_w9;
	   sn_l_r10     <= sn_op_w9;
	   
	   
	   //Xin_r11      <= Xo_w10;
	   //Yin_r11      <= Yo_w10;
	   //theta_in_r11 <= theta_op_w10;
	   //sn_l_r11     <= sn_op_w10;
       
       Xo    <= Xo_w10; //cosh
       Yo    <= Yo_w10; //sinh
       sn_op <= sn_op_w10;
       theta_op <= theta_op_w10;
       end
	
    end
	
endmodule



module s_cordic( input [15:0] X,Y,
input [3:0] sn_1,
input [15:0] theta_in,
output [3:0] sn_op,
output [15:0] theta_op,
output [15:0] Xo,Yo
    );
    


wire [3:0] so;
wire [15:0] theta_o;
(*DONT_TOUCH = "YES"*) micro_sequence_gen inst_micro (.theta(theta_in),.so(so),.theta_o(theta_o));

assign theta_op =  theta_o; //angle output
assign sn_op = so; //s output

wire [3:0] op1;//2s+1
wire [3:0] op2;//3s+2
(*DONT_TOUCH = "YES"*) shift inst_sh (.s_n_1(sn_1),.op1(op1),.op2(op2));


wire [15:0] Xout,Yout;
(*DONT_TOUCH = "YES"*) coordinate_calc inst_cord (.xn(X),.yn(Y),.i(sn_1),
                            .op1(op1),.op2(op2),
                             .xo(Xout),.yo(Yout));

assign Xo = Xout; // cosh value
assign Yo = Yout; // sinh value

endmodule



//Micro-rotation sequence genertor
module micro_sequence_gen(input [15:0]theta,
                          output [3:0] so,  
                          output [15:0] theta_o);
//implementing architecture as given in structure

wire [3:0] x1;
//reg N;
wire [3:0]ML;
integer N = 15; //  16

wire [15:0] Nc;  
assign Nc = N[15:0];

(*DONT_TOUCH = "YES"*) MSODetector instMSO (.data(theta),.MSO(ML));
//Mux operation at end
assign x1 = 15 - ML; // 16 - ML
assign so = (ML == N-1) ? 2 : x1;

//reset fun return theta(n)

wire [15:0] theta_n;
reg [15:0] temp;

always@ *
begin
    temp = 16'h7FFF;// ffff
    temp[ML-1] = 0; // ML
end

assign theta_n = theta & temp;

assign theta_o = (ML == (Nc-4'b0001)) ? (theta - 16'b0010000000000000) :theta_n;

endmodule



//Coordinate calc unit
module coordinate_calc(input [15:0]xn,yn,
                       input [3:0] op1,op2,i,
                       output [15:0]xo,yo);
//xn,yn inputs
//i iteration ?
//xo,yo putputs 
wire [15:0] x1,x2;
wire [15:0] y1,y2;


assign x1 = xn + (xn >> op1);
assign y1 = (xn >> op2) + (xn >> i) ;
assign x2 = (yn >> op2) + (yn >> i) ;
assign y2 = yn + (yn >> op1);


assign xo = x1 + x2;
assign yo = y1 + y2;


endmodule 



//Shift operation
module shift(input [3:0] s_n_1,
output reg [3:0] op1,op2);

//input is the shift operation of the (n-1) iteration

wire [3:0] w1,w2;

assign w1 =  (s_n_1 << 1);
assign w2 =  s_n_1 + 2;

always@(*)begin
 op1 = w1 + 4'b0001;  //2s+1
 op2 = w1 + w2; //3s+2
end



endmodule


module MSODetector (
    input [15:0] data,  // Input data with N bits
    output reg [3:0] MSO       // Output indicating the position of the MSB (0 for all zeros)
);

    parameter integer N = 16;  // Define the width of data (can be changed)
    //integer i;

    always @(data) begin
        // Initialize MSO to 0 (default case: all zeros)
       

        // Loop through bits from MSB to LSB
        //for (i = N-1; i >= 0; i = i - 1) begin
            //if (data[i] == 1'b1) begin
             //   MSO = i;  // Set MSO to the position of the first encountered 1
                     // Exit the loop once a 1 is found
            //end
            
            
//         casex (data)
           
//		16'b1xxxxxxxxxxxxxxx : MSO = 15;
//		16'b01xxxxxxxxxxxxxx : MSO = 14;
//		16'b001xxxxxxxxxxxxx : MSO = 13;
//		16'b0001xxxxxxxxxxxx : MSO = 12;
//		16'b00001xxxxxxxxxxx : MSO = 11;
//		16'b000001xxxxxxxxxx : MSO = 10;
//		16'b0000001xxxxxxxxx : MSO = 9;
//		16'b00000001xxxxxxxx : MSO = 8;
//		16'b000000001xxxxxxx : MSO = 7;
//		16'b0000000001xxxxxx : MSO = 6;
//		16'b00000000001xxxxx : MSO = 5;
//		16'b000000000001xxxx : MSO = 4;
//		16'b0000000000001xxx : MSO = 3;
//		16'b00000000000001xx : MSO = 2;
//		16'b000000000000001x : MSO = 1;
//		16'b0000000000000001 : MSO = 0;
//		default : MSO = 0;
//		endcase  


        casex (data)
           
		16'b01xxxxxxxxxxxxxx : MSO = 14;
		16'b001xxxxxxxxxxxxx : MSO = 13;
		16'b0001xxxxxxxxxxxx : MSO = 12;
		16'b00001xxxxxxxxxxx : MSO = 11;
		16'b000001xxxxxxxxxx : MSO = 10;
		16'b0000001xxxxxxxxx : MSO = 9;
		16'b00000001xxxxxxxx : MSO = 8;
		16'b000000001xxxxxxx : MSO = 7;
		16'b0000000001xxxxxx : MSO = 6;
		16'b00000000001xxxxx : MSO = 5;
		16'b000000000001xxxx : MSO = 4;
		16'b0000000000001xxx : MSO = 3;
		16'b00000000000001xx : MSO = 2;
		16'b000000000000001x : MSO = 1;
		16'b0000000000000001 : MSO = 0;
		default : MSO = 0;
		endcase    
            
            
    end

endmodule