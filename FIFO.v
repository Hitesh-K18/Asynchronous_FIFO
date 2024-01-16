module FIFO#(parameter Width=8,Depth_Size=4)(Clk1,Clk2,rd_en,wr_en,fifo_in,fifo_out,fifo_full,fifo_empty,fifo_counter);
input Clk1,Clk2,rd_en,wr_en;
input [Width-1:0] fifo_in;
output reg [Width-1:0] fifo_out;
output fifo_full,fifo_empty;
output [Depth_Size:0] fifo_counter;
reg [Width-1:0] mem[0:(1<<Depth_Size)-1];
reg [Depth_Size-1:0] front,back;
reg [Depth_Size:0] count_wr,count_rd;
initial begin
front=0;
back=0;
count_rd=0;
count_wr=0;
end

assign fifo_empty=(fifo_counter==0)?1:0;
assign fifo_full=(fifo_counter==(1<<Depth_Size))?1:0;
assign fifo_counter=count_wr-count_rd;
always@(posedge Clk1)
if(wr_en && !fifo_full) begin
mem[back]<=fifo_in;
back<=(back+1)%(1<<Depth_Size);
count_wr<=count_wr+1;
end
always@(posedge Clk2)
if(rd_en && !fifo_empty) begin
fifo_out<=mem[front];
front<=(front+1)%(1<<Depth_Size);
count_rd<=count_rd+1;
end
endmodule
