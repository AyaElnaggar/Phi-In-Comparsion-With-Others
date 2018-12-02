interface shiftreg;
    method Action shift(Bit#(1) SI);
    method ActionValue#(Bit#(1)) get_SO();
endinterface

(* synthesize *)
module mkshiftreg(shiftreg);

    Integer fifo_depth = 1;
    Reg#(Bit#(4)) Q <- mkReg(0); // define a Reg, Reg Q gets reset to 0 asynchronously with the RST signal
    FIFO#(Bit#(1)) result_fifo <- mkSizedFIFO(fifo_depth);

    method Action shift(Bit#(1) SI);
        result_fifo.enq(Q[3]);
        Q <= {Q[2:0], SI};
    endmethod

    method ActionValue#(Bit#(1)) get_SO();
      result_fifo.deq;
      return result_fifo.first;
    endmethod

endmodule
