##########################################################################################
### Name  : HFunQ
### Input : Vector de valores del atributo, Porcentaje de valores con doble cola
### Output: X1,Y1 Original (X=H de alta resolucion,Y=Nº de puntos del entorno)
###         Y1,X1 Cambio de los ejes
###         X2,Y2 Cambio de escala en X y de proporcion 
###   		 (X2=Y1 escalado a numHs valores)
###    		 (Y2=X1 escalado a [0,1] y numHs valores) 	
##########################################################################################
HFunQ<-function(X,numHs,Percentage=1.0)
{
  Fun     = list()
  X       = sort(X)
  h_min   = find_h_min(X)
  h_max   = find_h_max(X)
  h_delta_real = 50000
  h_vect  = seq(from=h_min,to=h_max,by=(h_max-h_min)/h_delta_real)
  print((h_max-h_min)/h_delta_real)
  print(length(h_vect))
  env     = rep(0,length.out=length(h_vect))
  X1_     = c()
  Y1_     = c()
  X2_     = c()
  Y2_     = c()
  X3_     = c()
  Y3_     = rep(0,length.out=numHs)
  
  if ( h_min<h_max ) {
    X1_ = h_vect
    Y1_ = h_vect
    
    TotalArea     = ISGIntegral(X1_,Y1_)
    print(TotalArea)
    Exclusion     = (1-Percentage)/2
    LowerIndex    = 0.0
    ExclusionArea = 0
    i=2
    while (ExclusionArea < Exclusion) {
      ExclusionArea = ISGIntegral(X1_[1:i],Y1_[1:i])/TotalArea
      i=i+1
    }
    LowerIndex=i
    
    print(LowerIndex)
    print(ExclusionArea)
    
    UpperIndex    = 0
    ExclusionArea = 1.0
    N=length(X1_)
    i=N
    while (ExclusionArea > (Percentage+Exclusion)) {
      ExclusionArea = ISGIntegral(X1_[1:i],Y1_[1:i])/TotalArea
      i=i-1
    }
    UpperIndex=i    
    
    print(UpperIndex)    
    print(ExclusionArea)
    
    X2_ = h_vect [LowerIndex:UpperIndex]  
    Y2_ = h_vect [LowerIndex:UpperIndex]
    
    X2p_ = (X2_-min(X2_))*((numHs-1)/(max(X2_)-min(X2_)))+1
    Y2p_ = (Y2_-min(Y2_))*((max(X2_)-min(X2_))/(max(Y2_)-min(Y2_)))+min(X2_)
    
    hIdx=(X2p_-min(X2p_))*((numHs-1)/(max(X2p_)-min(X2p_)))+1
    for(h in 1:numHs) {
      val=ip(h,Y2p_,hIdx)
      if (is.na(val)) print("HFun::ERR01: NA Value found")
      Y3_[h]=val
    }
    
    Y3_Corrected=c()
    Y3_Corrected=unique(Y3_)
    Y3_=rep(0,length.out=numHs)
    Y3_[1:length(Y3_Corrected)]=Y3_Corrected
    X3_=seq(from=1,to=numHs)
  } else {
    print("HFun::ERR02: h min >= h max")
  }
  Fun = list(X1=X1_,Y1=Y1_,X2=X2_,Y2=Y2_,X3=X3_,Y3=Y3_,HMin=h_min,HMax=h_max,HDelta=h_delta_real)
  return(Fun)
}