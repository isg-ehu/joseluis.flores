##########################################################################################
### Name  : find_h_min
### Input : Vector de valores del atributo
### Output: Minimo valor de h
##########################################################################################
find_h_min<-function(X)
{
  X<-sort(X)
  min=abs(X[1]-X[length(X)])
  D_h=min
  for(i in 1:(length(X)-1)) {
    a=X[i]
    b=X[i+1]
    D_h=abs(a-b)
    if (D_h<min && D_h>0) min=D_h
  }
  return(min*2)
}