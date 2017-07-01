equalWidth<-function(data, k) 
{ 
  w<-diff(r<-range(data))/k 
  cp=seq(r[1]+w,r[2]-w,w)
  dataDiscretized=discretize(data,cp)
  result=list(cutp=w,Disc.data=dataDiscretized)
  return(result)
}
