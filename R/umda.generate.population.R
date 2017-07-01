library(LaplacesDemon)

umda.generate.pop<-function(num.instances,model){
  num.vars=model$num.vars
  result<-array(dim=c(num.instances,num.vars))
  for(i in 1:num.instances) {
    for(j in 1:num.vars) {
      p = model$definition[j]
      result[i,j]=rbern(1,p)
    }
  }
  return(result)
}