##########################################################################################
### Name  : LocateY
### Input : Vector X del atributo.
###			Vector Y de la funcion diferencia de las clases POSITIVE y NEGATIVE.
###			Vector de zeros.
### Output: Valor Y asociado al valor de X de entrada de la funcion POSITIVE-NEGATIVE.
##########################################################################################
LocateY<-function(x,y,zeros)
{
  y_vector<-c()
  k<-0
  d_min=abs(x[1]-x[length(x)])
  for (zero in zeros) {
    inf_vector=which(x<zero)
    inf=inf_vector[length(inf_vector)]
    sup_vector=which(x>zero)
    sup=sup_vector[1]
    y_candidate=(y[inf]+y[sup])/2
    k=k+1
    y_vector[k]=y_candidate
  }
  return(y_vector)
}