import chisel3._

class shiftreg extends Module{
  val io = IO(new Bundle {
    val SO = Output(UInt(1.W))
    val SI = Input(UInt(1.W))
    val Clock = Input(UInt(1.W))
  })

  // ?? do i need initializaton
  val Q = RegNext(Cat(Q(2,0), io.SI))

  io.SO := Q(3)
}
