#!/usr/bin/env python
from myhdl import *

def shiftreg (SO, SI, Clock):

    Q = Signal(intbv(0)[3:0])

    @always(Clock.posedge)
    def logic1():
         Q.next = concat(Q[2:0],SI)
    return logic1

    @always_comb
    def logic2():
        SO.next = Q[3]
    return logic2
