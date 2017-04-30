binsEstimator<-function(method=1,numInstances) 
{ 
  result=0
  if (method==0) {
    result=round(sqrt(numInstances))
  }
  if (method==1) {
    result=round(round(1+log2(numInstances)))
  }
  return(result)
}