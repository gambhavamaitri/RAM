// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps


module ram_tb;

	// Inputs
	reg clk;
	reg rstn;
	reg rd_en;
	reg wr_en;
	reg [31:0] wr_addr;
	reg [31:0] rd_addr;
	reg [31:0] wr_data;


	// Outputs
	wire [31:0] rd_data;


	// Instantiate the Unit Under Test (UUT)
	ram uut (
		.clk(clk), 
		.rstn(rstn), 
		.rd_en(rd_en), 
		.wr_en(wr_en), 
		.wr_addr(wr_addr), 
		.rd_addr(rd_addr), 
		.wr_data(wr_data), 
		.rd_data(rd_data) 
	);

	initial begin
	$monitor("\nrstn=%0b, rd_en=%0b, rd_addr=&0b, rd_data=%0b\nwr_en=%0b, wr_addr=%0b, wr_data=%0b", rstn,rd_en,rd_addr,rd_data,wr_en,wr_addr,wr_data);
		// Initialize Inputs
		clk = 0;
		rstn = 0;
		rd_en = 0;
		wr_en = 0;
		wr_addr = 0;
		rd_addr = 0;
		wr_data = 0;


      #10;
		rstn = 0;
		#10;
		rstn=1;
		
		#10;
		wr_en = 1;
		#5
		wr_addr = 32'd10;
	   wr_data = 32'hff;
		#5;
		wr_en = 0;
		
		#10;
		rd_en = 1;
		rd_addr = 32'd10;
		#5;
		rd_en = 0;
		
		


		// Wait 100 ns for global reset to finish
		#100;
        $finish;
		// Add stimulus here

	end
	
	always #5 clk = ~clk;
      
endmodule
