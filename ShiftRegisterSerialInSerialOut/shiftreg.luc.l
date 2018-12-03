module shiftreg (
  output SO,
  input SI,
  input Clock,
){
    dff pipe[4] (.clk(Clock));

    var i;
      always {
        pipe.d[0] = SI; // SI goes into the start of the pipe
        SO = pipe.q[3]; // SO is the end of the pipe
        // for each intermediate state
        for (i = 1; i < 3; i++)
          pipe.d[i] = pipe.q[i-1]; // copy from previous
      }
      
}
