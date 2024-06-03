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
    input [20:0] theta_in,
    output reg [20:0] cosh_r,
    output reg [20:0] sinh_r
    );
    
    //integer a; // rectify this 
   
    reg [20:0] X0,Y0,theta0;
    //assign Y0 = a[31:16];
    //assign X0 = a[16:0];
    
    wire [20:0] X1, Y1, X2, Y2, X3, Y3;
	wire [20:0] theta1, theta2, theta3;
	wire [20:0] cosh,sinh;
	
	
	reg [20:0] X1_r, Y1_r, X2_r, Y2_r, X3_r, Y3_r;
	reg [20:0] theta1_r, theta2_r, theta3_r;
	
	//wire [15:0]t_abs;
	//wire s_bit;
	
	//abs1 inst(theta0,t_abs, s_bit);
	
	stage_1 s1(X0, Y0, theta0, X1, Y1, theta1);
	
	stage_2 s2(X1_r, Y1_r, theta1_r, X2, Y2, theta2);

	stage_3 s3(X2_r, Y2_r, theta2_r, X3, Y3, theta3);
	
	stage_4 s4(X3_r, Y3_r, theta3_r, cosh, sinh);


    initial 
        theta0 = 21'b0;
    
    always@(posedge clk)
    begin
        if(theta_in < 21'b000001100100100001111)
        begin
            X0 = 21'b000010000000000000000;
            Y0 = 21'b000000000000000000000;
            theta0 =  theta_in;
        end
        else if(theta_in < 21'b000011001001000011111)
        begin
            X0 = 21'b000010101010001111011;
            Y0 = 21'b000001101111010111001;
            theta0 = theta_in - 21'b000001100100100001111;
        end
        else if(theta_in < 21'b000100101101100101111)
        begin
            X0 = 21'b000101000001010011110;
            Y0 = 21'b000100100110011001101;
            theta0 = theta_in - 21'b000011001001000011111;
        end 
        else
        begin
            X0 = 21'b001010101000111101100;
            Y0 = 21'b001010011100001010010;
            theta0 = theta_in - 21'b000100101101100101111;
        end
	end
	
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
	input [20:0] X0, Y0, t0,
	output reg [20:0] X1, Y1, t1);

	wire [20:0] t_abs;
	wire s_bit;
	
	wire [20:0] xs, xc, ys, yc;
	
	
	(*DONT_TOUCH = "YES"*) abs1 inst1 (t0, t_abs, s_bit);
	(*DONT_TOUCH = "YES"*) shift_1 inst2  (X0,Y0,xc,ys);
	(*DONT_TOUCH = "YES"*) shift_1 inst3 (Y0,X0,yc,xs);
	
	
	//wire [15:0] xs_c,ys_c;
	//two_c inst_c1(xs,ys,xs_c,ys_c);
	
	
	
	always@(*)begin
		if(t_abs <=21'b000000100000000000000)
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
		     t1 = (s_bit) ? t0 +21'b000001000000000000000 : t0 - 21'b000001000000000000000 ;
		end
		
		
		
	end

endmodule



// stage 2

module stage_2(
	input [20:0]X,Y,t,
	output reg [20:0] Xn, Yn, tn);
	
	wire [20:0] t_abs;
	wire s_bit;
	
	(*DONT_TOUCH = "YES"*) abs1 inst4(t,t_abs,s_bit);
	
	wire [20:0] xc,ys, yc, xs;
	
	(*DONT_TOUCH = "YES"*) shift_2 inst5(X,Y,t_abs,xc,ys);
	(*DONT_TOUCH = "YES"*) shift_2 inst6(Y,X,t_abs,yc,xs);
	
	always@(*)begin
		if(t_abs <= 21'b000000001000000000000)
		begin
			Xn = X;
			Yn = Y;
			tn = t;
			
		end
		else
		begin
		
			Xn = (s_bit)? (xc-ys) : (xc+ys) ;
			Yn = (s_bit)? (yc-xs) : (yc+xs) ;
			
			if (t_abs > 21'b000000011000000000000)
			begin
				tn = (s_bit) ? (t+21'b000000100000000000000) : (t-21'b000000100000000000000) ;
			end
			else
			begin
				tn = (s_bit) ? (t+21'b000000010000000000000) : (t-21'b000000010000000000000) ;
			end
			
		end
	end
	
	
endmodule

// stage 3

module stage_3(
	input [20:0]X,Y,t,
	output reg [20:0] Xn, Yn, tn);
	
	wire [20:0] t_abs;
	wire s_bit;
	
	(*DONT_TOUCH = "YES"*) abs1 inst7(t,t_abs,s_bit);
	
	wire [20:0] xc,ys, yc, xs;
	
	(*DONT_TOUCH = "YES"*) shift_3 inst8(X,Y,t_abs,xc,ys);
	(*DONT_TOUCH = "YES"*) shift_3 inst9(Y,X,t_abs,yc,xs);
	
	//wire [15:0] xs_c,ys_c;
	//two_c inst_c3(xs,ys,xs_c,ys_c);
	
	
	always@(*)begin
		if(t_abs <= 21'b000000000010000000000)
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
			
			if (t_abs > 21'b000000000110000000000)
			begin
				tn = (s_bit) ? (t+21'b000000001000000000000) : (t-21'b000000001000000000000) ;
			end
			else
			begin
				tn = (s_bit) ? (t+21'b000000000100000000000) : (t-21'b000000000100000000000) ;
			end
			
		end
	end
	
	
endmodule


//// stage 4

// stage 4




module stage_4(
	input [20:0] X,Y,t,
	output [20:0] Xn, Yn);
	
	wire [20:0] t_abs;
	wire s_bit;
	
	//wire [3:0] kc;
	
	(*DONT_TOUCH = "YES"*)abs1 inst10(t,t_abs,s_bit);
	
	//assign kc = 4'b0001;   
	//assign ks = 4'b0001;
	
	wire [20:0] X_sh, Y_sh;
	
	assign X_sh = (X>>7);
	assign Y_sh = (Y>>7);
	
	assign Xn = (s_bit) ? (X + (X>>13) -Y_sh) : (X + (X>>13) +Y_sh) ; 
	assign Yn = (s_bit) ? (Y + (Y>>13) -X_sh) : (Y + (Y>>13) +X_sh) ; //Yn_t
	
	//to determine residual error 
//	wire [15:0] r_an;
//	assign r_an = (s_bit)? (t + 16'b0000000010000000) : (t - 16'b0000000010000000);
	
	
endmodule


// shift 1

module shift_1 (
	input [20:0] x,y,
	output [20:0] xs, ys);
	

	assign ys = (y>>1) + (y>>6) + (y>>8) + (y>>10) + (y>>11);
	
   	assign xs = (x) + (x>>3) + (x>>9) + (x>>11) + (x>>13) + (x>>15);
	
endmodule

// shift 2

module shift_2(
	input [20:0] x,y,
	input [20:0] t_abs,
	output [20:0] sx,sy);

	
	wire [20:0] sx_1, sx_2;
	
	assign sx_1 = (x) + (x>>5) + (x>>13) + (x>>15); 
	assign sx_2 = (x) + (x>>7);
	
	assign sx = (t_abs  > 21'b000000011000000000000) ? sx_1 : sx_2;
	
	
	wire [15:0] sy_1, sy_2;
	
	assign sy_1 = (y>>2) + (y>>9) + (y>>11) + (y>>13) + (y>>15);
	assign sy_2 = (y>>3) + (y>>12) + (y>>14);
	
	assign sy = (t_abs  > 21'b000000011000000000000) ? sy_1 : sy_2;
	
endmodule

// shift 3

module shift_3(
	input[20:0]x,y,
	input [20:0] t_abs,
	output [20:0] sx,sy);

	wire [20:0] sx_1, sx_2;
	
	assign sx_1 = (x) + (x>>9);
	assign sx_2 = (x) + (x>>11);
	
	assign sx = (t_abs  > 21'b000000000110000000000) ? sx_1 : sx_2;
	
	
	wire [20:0] sy_1, sy_2;
	
	assign sy_1 = (y>>4) + (y>>15);
	assign sy_2 = (y>>5);
	
	assign sy = (t_abs  > 21'b000000000110000000000) ? sy_1 : sy_2;
	
endmodule





// absolute value

module abs1(
	input [20:0] theta,
	output [20:0] a_theta,
	output sign);
	

	
	wire [20:0] sign_21;
	wire [20:0] sign_1;
	assign sign = theta[20];
	
	assign sign_21 = {21{theta[20]}};
	assign sign_1 = {20'b0 , theta[20]};
	
	assign a_theta = (theta^sign_21) + sign_1;
	

endmodule
