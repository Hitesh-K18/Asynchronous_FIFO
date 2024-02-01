`timescale 1ns / 1ps
module TB_FIFO;
parameter Width=8;
parameter Depth_Size=4;
reg Clk1,Clk2,rd_en,wr_en;
reg [Width-1:0] fifo_in;
wire [Width-1:0] fifo_out;
wire fifo_full,fifo_empty;
wire [Depth_Size:0] fifo_counter;
integer i,j;

FIFO dut(.Clk1(Clk1),.Clk2(Clk2),.rd_en(rd_en),.wr_en(wr_en)
         ,.fifo_in(fifo_in),.fifo_out(fifo_out),.fifo_full(fifo_full)
         ,.fifo_empty(fifo_empty),.fifo_counter(fifo_counter));

always #50 Clk1=~Clk1;
always #20 Clk2=~Clk2;

initial begin
$monitor("Time:%t rd_en=%b wr_en=%b fifo_in=%0d fifo_out=%0d fifo_full=%b fifo_empty=%b fifo_counter=%0d"
          ,$time,rd_en,wr_en,fifo_in,fifo_out,fifo_full,fifo_empty,fifo_counter);
Clk1=0;
Clk2=0;
wr_en=0;
rd_en=0;
end

initial begin
@(negedge Clk1);
wr_en=1;
rd_en=0;
fifo_in=1;
for(i=1;i<8;i=i+1)
@(negedge Clk1)
fifo_in<=fifo_in+1;
repeat(4) @(negedge Clk1);
wr_en=1;
fifo_in=9;
for(i=1;i<8;i=i+1)
@(negedge Clk1)
fifo_in<=fifo_in+1;
end

initial begin
repeat(23) @(negedge Clk2);
wr_en=0;
rd_en=1;
for(j=1;j<8;j=j+1)
@(negedge Clk2);
end

initial begin
#2200 $finish;
end

endmodule

