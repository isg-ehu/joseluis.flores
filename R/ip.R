##########################################################################################
### Name  : ip
### Input : Muestra x, vector de h y vector de indices.
### Output: Vector interpolado de x.
##########################################################################################
ip<-function(x,v,nv)
{
  idx=which(nv==x)
  if (length(idx)>=1) {
    result<-v[idx[1]]
  } else {
    idx=which(nv<x)
    id1=idx[length(idx)]
    id2=id1+1
    z=tscale(x,nv[id1],nv[id2],v[id1],v[id2])
    result<-z
  }
  return(result)
}