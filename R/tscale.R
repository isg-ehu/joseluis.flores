##########################################################################################
### Name  : tscale
### Input : Vector de valores del atributo, rango a-b original y rango c-d destino
### Output: Vector transformado en el rango de destino
##########################################################################################
tscale<-function(x,a,b,c,d)
{
  z<-(x-a)/(b-a)
  result<-z*(d-c)+c
  return(result)
}