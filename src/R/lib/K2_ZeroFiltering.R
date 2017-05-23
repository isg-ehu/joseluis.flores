K2_ZeroFiltering <- function(data,df,min,max) {
  items.removed<-0
  df.filtered <- df
  num.intervals <- length(df$df.interval.start)
  for(interval in 1:num.intervals) {
    if (is.na(df$df.num.solutions[interval]) == FALSE) {
      if (df$df.num.solutions[interval] > 0) {
        start <- df$df.interval.start[interval]
        stop <- df$df.interval.stop[interval]
        x.zero <- df$df.sol.1[interval]
        
        ## RULE 1: La solucion debe estar dentro del intervalo
        if (x.zero < start | x.zero > stop | x.zero <= min | x.zero >= max) {
#          print(paste("RULE 1:",toString(df.filtered$df.sol.1[interval])))
          df.filtered$df.num.solutions[interval] <- df.filtered$df.num.solutions[interval] - 1
          df.filtered$df.sol.1[interval] <- NA
          items.removed <- items.removed + 1
        }
        
        if (df$df.num.solutions[interval] > 1 ) {
          x.zero <- df$df.sol.2[interval]
          ## RULE 1: La solucion debe estar dentro del intervalo
          if (x.zero < start | x.zero > stop | x.zero < min | x.zero > max ) {
#            print(paste("RULE 1:",toString(df.filtered$df.sol.2[interval])))
            df.filtered$df.num.solutions[interval] <- df.filtered$df.num.solutions[interval] - 1 
            df.filtered$df.sol.2[interval] <- NA
            items.removed <- items.removed + 1
          } else {
              ## RULE 3: La segunda solucion debe ser diferente de la primera
              if ( df.filtered$df.num.solutions[interval] == 2 ) {
                if ( df.filtered$df.sol.1[interval] == df.filtered$df.sol.2[interval] ) {
#                  print(paste("RULE 3:",toString(df.filtered$df.sol.2[interval])))
                  df.filtered$df.num.solutions[interval] <- df.filtered$df.num.solutions[interval] - 1
                  df.filtered$df.sol.2[interval] <- NA
                  items.removed <- items.removed + 1
                }
              } 
            # }           
          }
        }
      }      
    }
  }

  ## RULE 4: Debe haber un cambio de clase
  for(interval in 1:num.intervals) {
    A <- df.filtered$df.a[interval]
    B <- df.filtered$df.b[interval]
    C <- df.filtered$df.c[interval]
    if ( is.na(df.filtered$df.num.solutions[interval])==FALSE) {
      if ( df.filtered$df.num.solutions[interval] == 0 ) {
        x <- (df.filtered$df.interval.start[interval]+df.filtered$df.interval.stop[interval])/2
        y <- A*x*x + B*x + C    
        signo=sign(y)
        df.filtered$df.sign1[1] <- signo
        df.filtered$df.sign2[1] <- signo
        df.filtered$df.sign3[1] <- signo
      } 

      if ( df.filtered$df.num.solutions[interval] == 1 ) {
        a <- df.filtered$df.interval.start[interval]
        if ( is.na(df.filtered$df.sol.1[interval])==FALSE ) {
          b <- df.filtered$df.sol.1[interval]  
        } else {
          b <- df.filtered$df.sol.2[interval]
        }
        x <- (a+b)/2
        y <- A*x*x + B*x + C
        signo <- sign(y)
        df.filtered$df.sign1[interval] <- signo
        
        x <- (b+df.filtered$df.interval.stop[interval])/2
        y <- A*x*x + B*x + C    
        signo <- sign(y)
        df.filtered$df.sign2[interval] <- signo
        df.filtered$df.sign3[interval] <- signo 
        
        if ( df.filtered$df.sign1[interval] == df.filtered$df.sign2[interval] ) {
#          print(paste("RULE 4:",toString(df.filtered$df.sol.1[interval])))
          df.filtered$df.num.solutions[1] <- df.filtered$df.num.solutions[1] - 1
          df.filtered$df.sol.1[interval] <- NA
          items.removed <- items.removed + 1
        }
      }
      if ( df.filtered$df.num.solutions[interval] == 2 ) {
        x <- (df.filtered$df.interval.start[interval]+df.filtered$df.sol.1[interval])/2
        y <- A*x*x + B*x + C    
        signo=sign(y)
        df.filtered$df.sign1[interval]=signo
        
        x <- (df.filtered$df.sol.1[interval]+df.filtered$df.sol.2[interval])/2
        y <- A*x*x + B*x + C    
        signo=sign(y)
        df.filtered$df.sign2[interval]=signo   
        
        ## Analizar si se acepta el zero
        if ( df.filtered$df.sign1[interval]==df.filtered$df.sign2[interval] ) {
#          print(paste("RULE 5:",toString(df.filtered$df.sol.1[interval])))
          df.filtered$df.num.solutions[interval] <- df.filtered$df.num.solutions[interval] - 1
          df.filtered$df.sol.1[interval] <- NA
          items.removed <- items.removed + 1
        }
        x <- (df.filtered$df.sol.2[interval]+df.filtered$df.interval.stop[interval])/2
        y <- A*x*x + B*x + C    
        signo=sign(y)
        df.filtered$df.sign3[interval]=signo    
        
        ## Analizar si se acepta el zero
        if ( df.filtered$df.sign2[interval]==df.filtered$df.sign3[interval] ) {
#          print(paste("RULE 6:",toString(df.filtered$df.sol.1[interval])))
          df.filtered$df.num.solutions[interval] <- df.filtered$df.num.solutions[interval] - 1
          df.filtered$df.sol.2[interval] <- NA
          items.removed <- items.removed + 1
        }
      }
    }
  }
  ## Debe haber instancias entre los ceros.
  zero.indexes=which(df.filtered$df.num.solutions>0)
  tmp1=df$df.sol.1[which(df.filtered$df.num.solutions>0)]
  tmp2=df$df.sol.2[which(df.filtered$df.num.solutions>0)]
  tmp11=tmp1[which(is.na(tmp1)==FALSE)]
  tmp21=tmp2[which(is.na(tmp2)==FALSE)]
  zeros=sort(c(tmp1,tmp2))
  for(zero.index in 1:(length(zeros)-1)) {
    if (length(which(data >= zeros[zero.index] & data < zeros[zero.index+1])) <= 0 ) {
      index=which(df.filtered$df.sol.1==zeros[zero.index] | df.filtered$df.sol.2==zeros[zero.index])
      df.filtered$df.num.solutions[index]=0
      df.filtered$df.sol.1[index] <- NA
      df.filtered$df.sol.2[index] <- NA
    } 
  }
  
  print(paste("Filtered zeros:",toString(items.removed)))
  return(df.filtered)
}