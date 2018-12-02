module shiftreg (SO, SI, Clock);

  output SO;
  input SI;
  input Clock;

  reg [3:0] Q;
  always @(posedge Clock) begin
    Q <= {Q[2:0],SI};
  end

  assign SO = Q[3];

endmodule
