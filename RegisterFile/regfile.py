from myhdl import *

def regfile(CLK, A1, A2, RD1, RD2, WE3, A3, WD3):

    @always(CLK.posedge)
    def seq():
        if WE3:
            STORAGE.next[A3] = WD3
    return seq
