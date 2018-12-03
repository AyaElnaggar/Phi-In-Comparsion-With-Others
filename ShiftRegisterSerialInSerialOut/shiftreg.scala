//LINK USED: https://github.com/ucb-bar/chisel-tutorial/blob/release/src/main/scala/solutions/VecShiftRegisterParam.scala
package solutions

import chisel3._

class shiftreg extends Module{
  val io = IO(new Bundle {
    val SO = Output(UInt(1.W))
    val SI = Input(UInt(1.W))
    val Clock = Input(UInt(1.W))
  })

  val initValues = Seq.fill(4) { 0.U(1.W) }
  val delays = RegInit(VecInit(initValues))

  for (i <- 3 to 1 by -1) {
    delays(i) := delays(i - 1)
  }

  delays(0) := io.SI
  io.SO := delays(3)

}