umda.learn <- function (selected.population) {
  num.vars <- length(selected.population[1,])
  num.instances <- length(selected.population[,1])
  p <- array(dim=c(num.vars))
  for(i in 1:length(selected.population[1,])) {
    p[i]=sum(selected.population[which(selected.population[,i]==1),i])/num.instances
  }
  return(p)
}