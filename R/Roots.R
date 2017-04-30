##########################################################################################
### Name  : Roots
### Input : Matriz Z, donde:
###			  	Columna 1 - Representan los valores X del atributo.
###				Columna 2 - Representan los valores de la clase POSITIVE.
###				Columna 3 - Representan los valores de la clase NEGATIVE. 
### Output: Raices de las funcion POSITIVE-NEGATIVE.
##########################################################################################
Roots<-function(Z_Final)
{
  roots<-c()
  zero<-0
  if (is.nan(Z_Final[,2]) | is.nan(Z_Final[,3])) return(roots)
  numSamples<-length(Z_Final[,1])
  prev1<-Z_Final[1,2]
  prev2<-Z_Final[1,3]
  post1<-Z_Final[2,2]
  post2<-Z_Final[2,3]
  sign<-0
  if (prev1>prev2) {
    sign<-1
  } else {
    if (prev1<prev2) {
      sign<--1
    }
  }
  if (post1 < post2 & sign==1) {
    sign<--1
    zero<-(Z_Final[1,1]+Z_Final[2,1])/2
    roots<-cbind(roots,zero)
  } else {
    if ( post1 > post2 & sign==-1 ) {
      sign<-1
      zero<-(Z_Final[1,1]+Z_Final[2,1])/2
      roots<-cbind(roots,zero)
    } 
  }
  for(i in (3:numSamples)) {
    prev1<-Z_Final[i-1,2]
    prev2<-Z_Final[i-1,3]
    post1<-Z_Final[i  ,2]
    post2<-Z_Final[i  ,3]
    if (prev1>prev2) {
      sign<-1
    } else {
      if (prev1<prev2) {
        sign<--1
      }
    }
    if (post1 < post2 & sign==1) {
      sign<--1
      zero<-(Z_Final[i-1,1]+Z_Final[i,1])/2
      roots<-cbind(roots,zero)
    } else {
      if ( post1 > post2 & sign==-1 ) {
        sign<-1
        zero<-(Z_Final[i-1,1]+Z_Final[i,1])/2
        roots<-cbind(roots,zero)
      } 
    }
  }
  return(roots)
}