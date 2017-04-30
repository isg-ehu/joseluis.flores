library(ggplot2)
source("R/ISGIntegral.R")

K2_PlotDensity<-function(df,min,max,num.points = 100) {
  num.intervals <- length(df$df.interval.start)
  x.zeros <- c()
  y.zeros <- c()
  x.plus <- c()
  y.plus <- c()
  x.minus <- c()
  y.minus <- c()
  x<-c()
  y<-c()
  for(interval in 1:num.intervals) {
    x.interval.plus = seq(from=df$df.interval.start[interval],to=df$df.interval.stop[interval],length.out=num.points)
    A.interval.plus = df$df.a.plus[interval]
    B.interval.plus = df$df.b.plus[interval]
    C.interval.plus = df$df.c.plus[interval]
    y.interval.plus = A.interval.plus*x.interval.plus*x.interval.plus + 
      B.interval.plus*x.interval.plus + 
      C.interval.plus
    x.plus<-c(x.plus,x.interval.plus)
    y.plus<-c(y.plus,y.interval.plus)
    
    x.interval.minus = seq(from=df$df.interval.start[interval],to=df$df.interval.stop[interval],length.out=num.points)
    A.interval.minus = df$df.a.minus[interval]
    B.interval.minus = df$df.b.minus[interval]
    C.interval.minus = df$df.c.minus[interval]
    y.interval.minus = A.interval.minus*x.interval.minus*x.interval.minus + 
      B.interval.minus*x.interval.minus + 
      C.interval.minus
    x.minus<-c(x.minus,x.interval.minus)
    y.minus<-c(y.minus,y.interval.minus)    
    
    x.interval = seq(from=df$df.interval.start[interval],to=df$df.interval.stop[interval],length.out=num.points)
    A.interval = df$df.a[interval]
    B.interval = df$df.b[interval]
    C.interval = df$df.c[interval]
    y.interval = A.interval*x.interval*x.interval + 
      B.interval*x.interval + 
      C.interval
    x<-c(x,x.interval)
    y<-c(y,y.interval)
    
    if (is.na(df$df.num.solutions[interval]) == FALSE) {
      if (df$df.num.solutions[interval] == 1 ) {
        if (is.na(df$df.sol.1[interval]) == FALSE) {
          x.zero <- df$df.sol.1[interval]
          y.zero <- A.interval.minus*x.zero*x.zero+B.interval.minus*x.zero+C.interval.minus
          x.zeros <- c(x.zeros,x.zero)
          y.zeros <- c(y.zeros,y.zero)          
        } else {
          x.zero <- df$df.sol.2[interval]
          y.zero <- A.interval.minus*x.zero*x.zero+B.interval.minus*x.zero+C.interval.minus
          x.zeros <- c(x.zeros,x.zero)
          y.zeros <- c(y.zeros,y.zero)          
        }
      }
      if (df$df.num.solutions[interval] == 2 ) {
        x.zero <- df$df.sol.1[interval]
        y.zero <- A.interval.minus*x.zero*x.zero+B.interval.minus*x.zero+C.interval.minus
        x.zeros <- c(x.zeros,x.zero)
        y.zeros <- c(y.zeros,y.zero)       
        x.zero <- df$df.sol.2[interval]
        y.zero <- A.interval.minus*x.zero*x.zero+B.interval.minus*x.zero+C.interval.minus
        x.zeros <- c(x.zeros,x.zero)
        y.zeros <- c(y.zeros,y.zero)
      }      
    }
  }
  
  print(ISGIntegral(x.plus,y.plus))
  print(ISGIntegral(x.minus,y.minus))  

  num.zeros<-length(x.zeros)
  label.plus <- rep('+',length.out=num.intervals*num.points)
  label.minus <- rep('-',length.out=num.intervals*num.points)
  label.final <- rep('Final',length.out=num.intervals*num.points)
  label.zeros <- rep('Zeros',length.out=num.zeros)  
  label.total=c(label.plus,label.minus,label.final)
  x.total=c(x.plus,x.minus,x)
  y.total=c(y.plus,y.minus,y)  

  df.plot=data.frame(x.total,y.total,label.total)
  df.plot.zeros=data.frame(x.zeros,y.zeros,label.zeros)
  names(df.plot)=c("X","Density","Label")
  ggplot(df.plot,aes(x=X,y=Density,col=Label)) + 
      geom_line() + geom_point(data=df.plot.zeros,aes(x=x.zeros,y=y.zeros,col=label.zeros)) +
      geom_vline(xintercept=min,linetype="dotted", color = "blue", size=0.25) + 
      geom_vline(xintercept=max,linetype="dotted", color = "blue", size=0.25)
}