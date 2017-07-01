##########################################################################################
### Name  : HFunQ
### Input : Vector de valores del atributo, Numero de valores de h
### Output: X1,Y1 Original (X=H de alta resolucion,Y=Nº de puntos del entorno)
###         Y1,X1 Cambio de los ejes
###         X2,Y2 Cambio de escala en X y de proporcion 
###   		 (X2=Y1 escalado a numHs valores)
###    		 (Y2=X1 escalado a [0,1] y numHs valores) 	
##########################################################################################
HFun<-function(X,numHs)
{
  Fun     = list()
  X       = sort(X)
  h_min   = find_h_min(X)
  h_max   = find_h_max(X)
  h_vect  = seq(from=h_min,to=h_max,length.out=numHs)
  if ( h_min>=h_max ) {
    print("HFun::ERR02: h min >= h max")
  }
  Fun = list(H=h_vect)
  return(Fun)
}