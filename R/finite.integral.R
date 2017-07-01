##########################################################################################
### Name  : ISG_integral
### Input : Vector de valor X e Y de una funcion
### Output: Integral definida sobre el dominio X.
##########################################################################################
ISG_integral<-function(x,y)
{
  size<-length(x)
  area<-0
  for(i in 1:(size-1)) {
    minY<-min(abs(y[i]),abs(y[i+1]))
    maxY<-max(abs(y[i]),abs(y[i+1]))
    Base<-abs(x[i+1]-x[i])
    areaCuadrado  <- Base*(minY)
    areaTriangulo <- abs(Base*(maxY-minY))/2
    area<-area+areaCuadrado+areaTriangulo
  }
  return(area)
}

print("ISG R/Finite Integral functions")
x20160531<-seq(from=-1,to=1,length.out=650)
y20160531<-1/(x20160531^2+1)
result20160531<-ISG_integral(x20160531,y20160531)
expectedResult20160531<-1.570796
if ((result20160531-expectedResult20160531)<1e-07) {
  print("-> Unit test 1. Correct")
} else {
  print("-> Unit test 1. Fail")
}

x20160531<-seq(from=1,to=10,length.out=10)
y20160531<-x20160531
result20160531<-ISG_integral(x20160531,y20160531)
expectedResult20160531<-50
if ((result20160531-expectedResult20160531)<1e-05) {
  print("-> Unit test 2. Correct")
} else {
  print("-> Unit test 2. Fail")
}



