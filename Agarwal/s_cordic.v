`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2024 08:50:08 PM
// Design Name: 
// Module Name: s_cordic_agarwal
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

// Pipelined cordic Agarwal Processor

module s_cordic( 
input clk,
input reset,
input [15:0] X_initial,Y_initial,
input [3:0] sn_initial,
input [15:0] theta_in,
output [3:0] sn_op_final,
output [15:0] theta_op_final,
output [15:0] Xo_final,Yo_final
    );
    

reg [15:0] X_pipeline[0:11], Y_pipeline[0:11], theta_pipeline[0:11]; //8
reg [3:0] s_pipeline[0:11]; //8

genvar j; // for generate for loop
integer k,m=0; //using for loops


// wires defined to pipelinig process
wire [3:0] so_w[0:10];   //7
wire [15:0] theta_w[0:10];//7
wire [15:0] X_pipeline_w[0:10];//7
wire [15:0] Y_pipeline_w[0:10];//7


always @(posedge clk) begin
    if (reset) begin
        // Initialize pipeline registers to reset state
        for (m = 0; m < 12; m = m + 1) begin //9
            X_pipeline[m] <= 0;
            Y_pipeline[m] <= 0;
            theta_pipeline[m] <= 0;
            s_pipeline[m] <= 0;
        end
        
    end 
    else begin
        // Shift data through the pipeline
        X_pipeline[0] <= X_initial;
        Y_pipeline[0] <= Y_initial;
        theta_pipeline[0] <= theta_in;
        s_pipeline[0] <= sn_initial;
        
        for ( k = 1; k < 12; k=k+1) begin //9
            s_pipeline[k] <= so_w[k-1]; // Shift assignment based on clock
            theta_pipeline[k] <= theta_w[k-1];
            X_pipeline[k] <=X_pipeline_w[k-1];
            Y_pipeline[k] <=Y_pipeline_w[k-1]; 
        end
    end
end


wire [15:0] theta_o;

wire [3:0] op1[0:12];//2s+1  //9
wire [3:0] op2[0:12];//3s+2  //9

//wire [15:0] Xout,Yout;
     generate    
        for (j = 0; j < 12; j=j+1) begin //9
            //micro_sequence_gen inst_micro (.theta(theta_pipeline[i]),.so(so),.theta_o(theta_o));
           (*DONT_TOUCH = "YES"*) micro_sequence_gen inst_micro (.theta(theta_pipeline[j]),.so(so_w[j]),.theta_o(theta_w[j]));
            //assign theta_pipeline[i+1] = theta_o;
            (*DONT_TOUCH = "YES"*) shift inst_sh (.s_n_1(s_pipeline[j]),.op1(op1[j]),.op2(op2[j]));
            
            (*DONT_TOUCH = "YES"*) coordinate_calc inst_cord (.xn(X_pipeline[j]),.yn(Y_pipeline[j]),.i(s_pipeline[j]),
                            .op1(op1[j]),.op2(op2[j]),
                             .xo(X_pipeline_w[j]),.yo(Y_pipeline_w[j]));
            
            
        end
       endgenerate 


// Output from the last stage
assign Xo_final = X_pipeline[11]; //cosh value
assign Yo_final = Y_pipeline[11]; //sinh value

assign theta_op_final = theta_pipeline[11]; //theta_final
assign  sn_op_final = s_pipeline[11];  //sn_final

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