`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2024 11:01:19 AM
// Design Name: 
// Module Name: flow
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


module flow(
    input clk,
    //input [15:0] X0,
    //input [15:0] Y0,
    input [15:0] theta0,
    output reg [15:0] cosh_r,
    output reg [15:0] sinh_r
    );
    
    integer a;
   
    wire [15:0] X0,Y0;
    assign Y0 = a[31:16];
    assign X0 = a[16:0];
    
    wire [15:0] X1, Y1, X2, Y2, X3, Y3;
	wire [15:0] theta1, theta2, theta3;
	wire [15:0] cosh,sinh;
	
	
	reg [15:0] X1_r, Y1_r, X2_r, Y2_r, X3_r, Y3_r;
	reg [15:0] theta1_r, theta2_r, theta3_r;
	
	//wire [15:0]t_abs;
	//wire s_bit;
	
	//abs1 inst(theta0,t_abs, s_bit);
	
	stage_1 s1(X0, Y0, theta0, X1, Y1, theta1);
	
	stage_2 s2(X1_r, Y1_r, theta1_r, X2, Y2, theta2);

	stage_3 s3(X2_r, Y2_r, theta2_r, X3, Y3, theta3);
	
	stage_4 s4(X3_r, Y3_r, theta3_r, cosh, sinh);


    initial a = 16384;
	
	always@(posedge clk)
	begin
	   
	   theta1_r <= theta1;
	   theta2_r <= theta2;
	   theta3_r <= theta3;
	   
	   
	   X1_r <= X1;
       X2_r <= X2;
       X3_r <= X3;
        	
       Y1_r <= Y1;
       Y2_r <= Y2;
       Y3_r <= Y3;
       
       cosh_r <= cosh;
       sinh_r <= sinh;
	
	end
	
	
    
endmodule





//stage 1

module stage_1(
	input [15:0] X0, Y0, t0,
	output reg [15:0] X1, Y1, t1);

	wire [15:0] t_abs;
	wire s_bit;
	
	wire [15:0] xs, xc, ys, yc;
	
	
	(*DONT_TOUCH = "YES"*) abs1 inst1 (t0, t_abs, s_bit);
	(*DONT_TOUCH = "YES"*) shift_1 inst2  (X0,Y0,xc,ys);
	(*DONT_TOUCH = "YES"*) shift_1 inst3 (Y0,X0,yc,xs);
	
	
	//wire [15:0] xs_c,ys_c;
	//two_c inst_c1(xs,ys,xs_c,ys_c);
	
	
	
	always@(*)begin
		if(t_abs <=16'b0001000000000000)
		begin
			X1 = X0;
			Y1 = Y0;
			t1 = t0;	
		end
		else
		begin
		     X1 = (s_bit) ? xc-ys : xc+ys ;
		     //X1 = xc+ys;
		     Y1 = (s_bit) ? yc-xs : yc+xs ;
		     t1 = (s_bit) ? t0 +16'b0010000000000000 : t0 - 16'b0010000000000000 ;
		end
		
		
		
	end

endmodule



// stage 2

module stage_2(
	input [15:0]X,Y,t,
	output reg [15:0] Xn, Yn, tn);
	
	wire [15:0] t_abs;
	wire s_bit;
	
	(*DONT_TOUCH = "YES"*) abs1 inst4(t,t_abs,s_bit);
	
	wire [15:0] xc,ys, yc, xs;
	
	(*DONT_TOUCH = "YES"*) shift_2 inst5(X,Y,t_abs,xc,ys);
	(*DONT_TOUCH = "YES"*) shift_2 inst6(Y,X,t_abs,yc,xs);
	
	
	//wire [15:0] xs_c,ys_c;
	//two_c inst_c2(xs,ys,xs_c,ys_c);
	
	
	always@(*)begin
		if(t_abs <= 16'b0000010000000000)
		begin
			Xn = X;
			Yn = Y;
			tn = t;
			
		end
		else
		begin
		
			Xn = (s_bit)? (xc-ys) : (xc+ys) ;
			//Xn = xc + ys;
			Yn = (s_bit)? (yc-xs) : (yc+xs) ;
			
			if (t_abs > 16'b0000110000000000)
			begin
				tn = (s_bit) ? (t+16'b0001000000000000) : (t-16'b0001000000000000) ;
			end
			else
			begin
				tn = (s_bit) ? (t+16'b0000100000000000) : (t-16'b0000100000000000) ;
			end
			
		end
	end
	
	
endmodule

// stage 3

module stage_3(
	input [15:0]X,Y,t,
	output reg [15:0] Xn, Yn, tn);
	
	wire [15:0] t_abs;
	wire s_bit;
	
	(*DONT_TOUCH = "YES"*) abs1 inst7(t,t_abs,s_bit);
	
	wire [15:0] xc,ys, yc, xs;
	
	(*DONT_TOUCH = "YES"*) shift_3 inst8(X,Y,t_abs,xc,ys);
	(*DONT_TOUCH = "YES"*) shift_3 inst9(Y,X,t_abs,yc,xs);
	
	//wire [15:0] xs_c,ys_c;
	//two_c inst_c3(xs,ys,xs_c,ys_c);
	
	
	always@(*)begin
		if(t_abs <= 16'b0000000100000000)
		begin
			Xn = X;
			Yn = Y;
			tn = t;
			
		end
		else
		begin
		
			Xn = (s_bit)? (xc-ys) : (xc+ys) ;
			//Xn = xc+ys;
			Yn = (s_bit)? (yc-xs) : (yc+xs) ;
			
			if (t_abs > 16'b0000001100000000)
			begin
				tn = (s_bit) ? (t+16'b0000010000000000) : (t-16'b0000010000000000) ;
			end
			else
			begin
				tn = (s_bit) ? (t+16'b0000001000000000) : (t-16'b0000001000000000) ;
			end
			
		end
	end
	
	
endmodule


//// stage 4

// stage 4




module stage_4(
	input [15:0] X,Y,t,
	output [15:0] Xn, Yn);
	
	wire [15:0] t_abs;
	wire s_bit;
	
	wire [3:0] kc;
	
	(*DONT_TOUCH = "YES"*)abs1 inst10(t,t_abs,s_bit);
	
	//assign kc = 4'b0001;   
	//assign ks = 4'b0001;
	
	wire [15:0] X_sh, Y_sh;
	
	assign X_sh = (X>>7);
	assign Y_sh = (Y>>7);
	
	assign Xn = (s_bit) ? (X + (X>>13) -Y_sh) : (X + (X>>13) +Y_sh) ; 
	assign Yn = (s_bit) ? (Y + (Y>>13) -X_sh) : (Y + (Y>>13) +X_sh) ; //Yn_t
	
endmodule


// shift 1

module shift_1 (
	input [15:0] x,y,
	output [15:0] xs, ys);
	
	//sinh shift
	
	//wire [15:0] ws1, ws2, ws3;
	
	//assign ws1 = (y>>2) + y;
	//assign ws2 = (y>>6) + (ws1>>4) + ws1;
	//assign ws3 = (ws2>>5) + y;
	//assign ys = (ws3>>1); //(rsinh(2^-1))

	assign ys = (y>>1) + (y>>6) + (y>>8) + (y>>10) + (y>>11);
	
	
	
	//cosh shift
	
	//wire [15:0] wc1, wc2, wc3;
	
	//assign wc1 = (x>>3) + x;
	//assign wc2 = (x>>2) + x;   
	//assign wc3 = (wc2>>2) + x;
	//assign xs = (wc3>>9) + wc1; //(rcosh(2^-1))
   
   	assign xs = (x) + (x>>3) + (x>>9) + (x>>11) + (x>>13) + (x>>15);
	
endmodule

// shift 2

module shift_2(
	input [15:0] x,y,
	input [15:0] t_abs,
	output [15:0] sx,sy);
	
	
	//cosh shift
	//wire [15:0] wc1, wc2, wc3, wc4;
	
	//assign wc1 = (x>>8) + x;
	//assign wc2 = (wc1>>5);
	//assign wc3 = (x>>7);
	
	//assign wc4 = (t_abs  > 16'b0000110000000000) ? wc2 : wc3 ;
	//assign sx = wc4 + x;
	
	wire [15:0] sx_1, sx_2;
	
	assign sx_1 = (x) + (x>>5) + (x>>13) + (x>>15); 
	assign sx_2 = (x) + (x>>7);
	
	assign sx = (t_abs  > 16'b0000110000000000) ? sx_1 : sx_2;
	
	//sinh shift
	//wire [15:0] ws1, ws2,ws3, ws4;
	
	//assign ws1 = (y>>9) + y;
	//assign ws2 = (ws1>>3);
	
	//assign ws3 = (((y>>4) + y) >>7) + ws1;
	//assign ws4 = (ws3>>2);
	
	//assign sy = (t_abs  > 16'b0000110000000000) ? ws4 : ws2 ;
	
	wire [15:0] sy_1, sy_2;
	
	assign sy_1 = (y>>2) + (y>>9) + (y>>11) + (y>>13) + (y>>15);
	assign sy_2 = (y>>3) + (y>>12) + (y>>14);
	
	assign sy = (t_abs  > 16'b0000110000000000) ? sy_1 : sy_2;
	
endmodule

// shift 3

module shift_3(
	input[15:0]x,y,
	input [15:0] t_abs,
	output [15:0] sx,sy);

		
	//cosh
	//wire [15:0] wc1;
	
	//assign wc1 = (t_abs > 16'b0000001100000000)?(x>>9):(x>>11);
	//assign sx = wc1 + x;
	
	wire [15:0] sx_1, sx_2;
	
	assign sx_1 = (x) + (x>>9);
	assign sx_2 = (x) + (x>>11);
	
	assign sx = (t_abs  > 16'b0000001100000000) ? sx_1 : sx_2;
	
	//sinh
	
	//assign sy = (t_abs > 16'b0000001100000000)?(y>>4):(y>>5); 
	
	wire [15:0] sy_1, sy_2;
	
	assign sy_1 = (y>>4) + (y>>15);
	assign sy_2 = (y>>5);
	
	assign sy = (t_abs  > 16'b0000001100000000) ? sy_1 : sy_2;
	
endmodule

// absolute value

module abs1(
	input [15:0] theta,
	output [15:0] a_theta,
	output sign);
	

	
	wire [15:0] sign_16;
	wire [15:0] sign_1;
	assign sign = theta[15];

    //wire [14:0] sign_15;	
	//assign sign_15 = {15{theta[15]}};
	
	
	assign sign_16 = {16{theta[15]}};
	assign sign_1 = {15'b0 , theta[15]};
	
	assign a_theta = (theta^sign_16) + sign_1;
	
	
	
	//assign a_theta = {1'b0, (theta[14:0]^sign_15)} + sign_1 ;
	
endmodule



/*module two_c(
    input [15:0] inx,iny,
    output [15:0] outx,outy);
    
    assign outx = ~(inx) + 16'b0000000000000001;
    
    assign outy = ~(iny) + 16'b0000000000000001;

    
endmodule
*/
