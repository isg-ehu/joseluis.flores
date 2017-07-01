K2_f<-function(df,x,selection) {
  num.points<-length(x)
  y<-rep(0,length.out=num.points)
  for(i in 1:(num.points)) {
    interval<-1
    isLast<-FALSE
    found<-FALSE
    location<-0
    while (interval<=length(df$df.interval.start) & isLast==FALSE) {
      if (x[i]>=df$df.interval.start[interval] & x[i]<df$df.interval.stop[interval]) {
        location<-interval
        found<-TRUE
      }
      if (x[i]>df$df.interval.stop) {
        isLast<-TRUE
      }
      interval<-interval+1
    }
    if (found==FALSE)  {
      y[i]<-0
    } else {
      A<-0
      B<-0
      C<-0
      if (selection==1) {
        A<-df$df.a.plus[location]
        B<-df$df.b.plus[location]
        C<-df$df.c.plus[location]
      } else {
        A<-df$df.a.minus[location]
        B<-df$df.b.minus[location]
        C<-df$df.c.minus[location]
      }
      print(i)
      print(A)
      print(B)
      print(C)
      print(x[i])
      y[i]=A*x[i]*x[i]+B*x[i]+C      
    }

  }
  return(y)
}