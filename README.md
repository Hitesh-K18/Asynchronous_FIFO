# Asynchronous_FIFO

      ![Screenshot 2024-02-01 204240](https://github.com/Hitesh-K18/Asynchronous_FIFO/assets/156711207/a465a48a-6874-4a7b-b141-3f7f37b40b24)
      
Two different clocks Clk1 and Clk2 are used for writing to and reading from the FIFO. 
Verilog code takes care of reading and writing from and to FIFO simultaneously, if it occurs. 
Testbench verifies the complete functionality of a 16-byte FIFO (Width=1Byte). Clk1 and Clk2 are 
of frequency 10MHz and 25MHz respectively. 
a) Initially wr_en=rd_en=0 
b) Write first 8bytes into FIFO from 2nd clock1 cycle with wr_en=1 and rd_en=0 
c) Next read 8 bytes from the FIFO from 24th clock2 cycle with wr_en=0 and rd_en=1 
d) At t=1260ns, wr_en=1 and rd_en=1. Again, start writing 8bytes into FIFO from 13th clock1 cycle. 
e) Finish the simulation at t=2.2 µs 


