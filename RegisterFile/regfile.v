module regfile(
  input CLK,
  input [4:0] A1,
  input [4:0] A2,
  output [31:0] RD1,
  output [31:0] RD2,
  input WE3,
  input [4:0] A3,
  input [31:0] WD3
);

reg [31:0] STORAGE[7:0];

integer i;
initial begin
 for(i=0;i<8;i=i+1)
  STORAGE[i] <= 32'd0;
end

always @ (posedge CLK) begin
  if(WE3) begin
    STORAGE[A3] <= WD3;
  end
end

assign RD1 = STORAGE[A1];
assign RD2 = STORAGE[A2];

endmodule
