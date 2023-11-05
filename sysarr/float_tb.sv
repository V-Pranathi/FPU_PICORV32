`timescale 1ns/1ps

module sysarray_tb1();

parameter N = 31;
parameter n = 4;

reg clk;
// reg [N:0]arr1[n-1:0];
// reg [N:0]arr2[n-1:0];
reg [((N+1)*(n))-1 :0]arr1;
reg [((N+1)*(n))-1 :0]arr2;
reg [6:0] flg;
wire [N:0]dpin;

wire [((N+1)*(n))-1 :0]outrow;
wire [((N+1)*(n-1))-1 :0]outcolumn;

parameter odr = 2*n-1;

//wire [N:0]C[odr:0][odr:0];


sysarray1 uut(
    .clk(clk),
    .flg(flg),
    .arr1(arr1),
    .arr2(arr2),
    .dpin(dpin),
    .outrow(outrow),
    .outcolumn(outcolumn)
//    .C(C)
);

reg [31:0] x1,x2,x3,x4;
reg [31:0] y1,y2,y3,y4;

initial begin
    clk = 0;

    flg = 0;
    arr1 = 0;
    x1 = 32'b00111111110000000000000000000000; //1.5
    x2 = 32'b00111110100000000000000000000000; //0.25
    x3 = 32'b01000000011100000000000000000000; //3.75
    x4 = 32'b00111110000000000000000000000000; //0.125
    //x5 = 32'b00000000000000000000000000000000; //0
    arr1 = {x4,x3,x2,x1};
    
    arr2 = 0;
    y1 = 32'b00111110100000000000000000000000; //0.25
    y2 = 32'b00111101110011001100110011001101; //0.1
    y3 = 32'b00111110100110011001100110011010; //0.3
    y4 = 32'b00111110010011001100110011001101; //0.2
   // y5 = 32'b00000000000000000000000000000000; //0
    
    arr2 = {y4,y3,y2,y1};

    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;
    
   arr1 = 0;
    x1 = 32'b01000000000000000000000000000000; //1
    x2 = 32'b00111111100000000000000000000000; //4
    x3 = 32'b01000000001000000000000000000000; //7
    x4 = 32'b00111110100000000000000000000000; //10
   // x5 = 32'b00000000000000000000000000000000; //0
    arr1 = {x4,x3,x2,x1};
    
    arr2 = 0;
    y1 = 32'b00111110010011001100110011001101; //1
    y2 = 32'b00111111000000000000000000000000; //2
    y3 = 32'b00111111010000000000000000000000; //3
    y4 = 32'b00111101110011001100110011001101; //4
   // y5 = 32'b00000000000000000000000000000000; //0
    
    arr2 = {y4,y3,y2,y1};


    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;
    
    arr1 = 0;
    x1 = 32'b00111111111000000000000000000000; //1
    x2 = 32'b00111110110011001100110011001101; //4
    x3 = 32'b01000000000100000000000000000000; //7
    x4 = 32'b00111101110011001100110011001101; //10
   // x5 = 32'b00000000000000000000000000000000; //0
    arr1 = {x4,x3,x2,x1};
    
    arr2 = 0;
    y1 = 32'b00111111110000000000000000000000; //1
    y2 = 32'b00111101110011001100110011001101; //2
    y3 = 32'b00111110000110011001100110011010; //3
    y4 = 32'b00111110100110011001100110011010; //4
    //y5 = 32'b00000000000000000000000000000000; //0
    
    arr2 = {y4,y3,y2,y1};
    
    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;
     arr1 = 0;
    x1 = 32'b00111110010011001100110011001101; //1
    x2 = 32'b00111110000110011001100110011010; //4
    x3 = 32'b00111110100110011001100110011010; //7
    x4 = 32'b01000000000000000000000000000000; //10
    //x5 = 32'b00000000000000000000000000000000; //0
    arr1 = {x4,x3,x2,x1};
    
    arr2 = 0;
    y1 = 32'b00111110000110011001100110011010; //1
    y2 = 32'b00111110010011001100110011001101; //2
    y3 = 32'b00111101110011001100110011001101; //3
    y4 = 32'b00111111010000000000000000000000; //4
    //y5 = 32'b00000000000000000000000000000000; //0
    
    arr2 = {y4,y3,y2,y1};

    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;
    
    arr1 = 0;
//    x1 = 32'b00111111100000000000000000000000; //1
//    x2 = 32'b01000000100000000000000000000000; //4
//    x3 = 32'b01000000111000000000000000000000; //7
//    x4 = 32'b01000001001000000000000000000000; //10
//    x5 = 32'b00000000000000000000000000000000; //0
//    arr1 = {x4,x3,x2,x1};
    
    arr2 = 0;
//    y1 = 32'b00111111100000000000000000000000; //1
//    y2 = 32'b01000000000000000000000000000000; //2
//    y3 = 32'b01000000010000000000000000000000; //3
//    y4 = 32'b01000000100000000000000000000000; //4
//    y5 = 32'b00000000000000000000000000000000; //0
    
//    arr2 = {y4,y3,y2,y1};

    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;

    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;

    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;
    
    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;

    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;

    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;
    
    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;
    
    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;

    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;

    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;
      
    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;

    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;

    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;
    
    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;
    
    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;

    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;

    #10;
    clk = ~clk;
    #10;
    clk = ~clk;

    flg = flg + 1;

end

endmodule