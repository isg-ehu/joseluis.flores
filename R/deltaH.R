##########################################################################################
### Name  : deltaH
### Input : Vector X del atributo de valores continuos.
###			Valor H minimo.
### Output: Diferencia de h mas pequeña, delta de H.
##########################################################################################
deltaH<-function(X,h_min)
{
  result<-0
  X_aux<-sort(X)

  D_h_old=abs(X_aux[1]-X_aux[2])
  D_h_new=abs(X_aux[2]-X_aux[3])

  delta_old=0
  delta_new=abs(D_h_new-D_h_old)
  if (delta_new > 0) result=delta_new
  else result=abs(X_aux[1]-X_aux[length(X)])

  for(i in 3:(length(X)-1)) {
    a=X[i]
    b=X[i+1]
    D_h_new=abs(X_aux[i]-X_aux[i+1])
    delta_new=abs(D_h_new-D_h_old)
    aux=abs(delta_new-delta_old)
    if (aux<result & aux > 0 ) result=aux
    D_h_old=D_h_new
    delta_old=delta_new
  }
  if (result<1e-06) result=h_min*0.5
  return(result)
}