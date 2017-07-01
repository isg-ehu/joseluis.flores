##########################################################################################
### Name  : h_env
### Input : Vector de valores del atributo, ancho de banda h
### Output: Vector conteniendo el numero de puntos dentro del entorno para cada muestra
##########################################################################################
HEnv<-function(X,h)
{
  result<-0
  Xp<-unique(X) ## Version 1.0 -> Xp<-unique(sort(X))
  for(i in 1:length(X)){
    idx=which(X>=(X[i]-h) & X<=(X[i]+h))
    result<-result+length(idx)-1
  }
  result<-result/length(X)
  return(result)
}