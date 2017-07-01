h_env<-function(X,h)
{
  result<-0
  Xp<-unique(sort(X))
  for(i in 1:length(X)){
    idx=which(X>=(X[i]-h) & X<=(X[i]+h))
    result<-result+length(idx)-1
  }
  result<-result/length(X)
  return(result)
}

t<-function(x,a,b,c,d)
{
  aux<-(x-a)/(b-a)
  result<-z*(d-c)+c
  return(result)
}

conv<-function(vect)
{
  newVect<-rep(0,length.out=length(vect))
  for(i in 1:length(vect))
  {
    newVect[i]=t(vect[i])
  }
  return(newVect)
}

ip<-function(x,v,nv)
{
  idx==which(nv==x)
  if (length(idx)==1) {
    result<-v[idx[1]]
  } else {
    idx=which(nv<x)
    id1=idx[length(idx)]
    id2=id1+1
    z=(v[id1]+v[id2])/2
    result<-z
  }
  return(result)
}

# x<-runif(100)
# x[10:90]=0
# x[91:100]=runif(10)*10
# h_min<-find_h_min(x)
# h_max<-find_h_max(x)
# DH<-deltaH(x,h_min)
# print(DH)
# h_vect<-seq(from=h_min,to=h_max,by=DH)
# h_env_vect<-rep(0,length.out=length(h_vect))
# for(i in 1:length(h_env_vect)) {
#   h_env_vect[i]=h_env(x,h_vect[i])
# }
# hev_plus=(h_env_vect-1)/99
# plot(density(x))
# grid()
# plot(h_vect,hev_plus,type='l')
# grid()
# yt=(hev_plus-min(hev_plus))*(99/(max(hev_plus)-min(hev_plus)))+1
# xt=h_vect
# plot(xt,yt,type='l')
# grid()
# plot(yt,xt,type='l')
# grid()
