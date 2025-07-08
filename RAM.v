// Code your design here
`timescale 1ns / 1ps
module ram(input clk, rstn, rd_en, wr_en, 
           input [31:0] wr_addr, rd_addr, wr_data,

			  output reg [31:0] rd_data,
			  output reg error
			  

    );
	 
	 reg [31:0] mem [0:255];
	 reg [9:0] i;
	 reg carry;
	 
	 
	 always@(posedge clk) begin
	   if(mem[2] == 4'd0) {carry,mem[3]}= mem[0]+mem[1];
	   else if(mem[2] == 4'd1){carry, mem[3]} = mem[0]-mem[1];
		else if(mem[2] == 4'd2) {carry,mem[3]} = mem[0]*mem[1];
		else if(mem[2] == 4'd3){carry, mem[3]} = mem[0]/mem[1];
		else if(mem[2] == 4'd4){carry, mem[3]} = mem[0]%mem[1];
		else if(mem[2] == 4'd5){carry, mem[3]} = mem[0]&mem[1];
		else if(mem[2] == 4'd6) {carry,mem[3]} = mem[0]|mem[1];
		else if(mem[2] == 4'd7) {carry,mem[3]} = mem[0]^mem[1];
		else if(mem[2] == 4'd8){carry, mem[3]} = mem[0]<<5;
		else if(mem[2] == 4'd9) {carry,mem[3]} = mem[0]>>2;
		else if(mem[2] == 4'd10){carry, mem[3]} = mem[1]<<3;
		else if(mem[2] == 4'd11){carry, mem[3]} = mem[1]>>4;
		else if(mem[2] == 4'd12) {carry,mem[3]} = (mem[0]>mem[1])?mem[0]:mem[1];
		else if(mem[2] == 4'd13){carry, mem[3]} = (mem[0]>mem[1])?mem[0]:mem[1];
		else if(mem[2] == 4'd14) {carry,mem[3] }= ~mem[0];
	   else if(mem[2] == 4'd15){carry, mem[3]} = ~mem[1];
      else error = 1;
	 end
	 	 
	 always @(posedge clk) 
	   begin
		  if(wr_en) begin
		    if(wr_addr == 32'd3)
		      error <= 1;
			end
			
			else 
			  error <= 0;
	   end
 
	  always @(posedge clk or negedge rstn) 
	   begin
		  if(!rstn) // reset
		    begin
			   for(i=0; i<256; i = i+1) 				  
				    mem[i] <= 0;			  
			 end //if ends
			 
			 else
			   begin
				  if(wr_en && !error)
				    begin
					   mem[wr_addr] <= wr_data;				
					 end
					 
					else if(rd_en)
					  begin
					    rd_data <= mem[rd_addr];
					  end
				end //else end
		end //always end
endmodule
