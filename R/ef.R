equalFrequency <- function(data, k) 
{ 
  cp<-unique(quantile(data, seq(1/k, 1-1/k, 1/k))) 
  dataDiscretized=discretize(data,cp)
  result=list(cutp=cp,Disc.data=dataDiscretized)
  return(result)
}