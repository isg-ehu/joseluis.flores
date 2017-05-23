##########################################################################################
### Name  : find_h_max
### Input : Vector de valores del atributo
### Output: Maximo valor de h
##########################################################################################
find_h_max<-function(X)
{
  h_max<-0
  min_x<-min(X)
  max_x<-max(X)
  h_max<-(max_x-min_x)/2
  return(h_max)
}