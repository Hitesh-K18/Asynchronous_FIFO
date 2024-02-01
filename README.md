# Asynchronous_FIFO
Write a testbench to verify the complete functionality of a 16-byte FIFO (Width=1Byte). Clk1 and Clk2 are 
of frequency 10MHz and 25MHz respectively. Your testbench should  
a) Initially wr_en=rd_en=0 
b) Write first 8bytes into FIFO from 2nd clock1 cycle with wr_en=1 and rd_en=0 
c) Next read 8 bytes from the FIFO from 24th clock2 cycle with wr_en=0 and rd_en=1 
d) At t=1260ns, wr_en=1 and rd_en=1. Again, start writing 8bytes into FIFO from 13th clock1 cycle. 
e) Finish the simulation at t=2.2 µs 
