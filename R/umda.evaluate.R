umda.evaluate <- function (population,problem) {
  evaluation <- array(dim=c(length(population[,1])))
  for (i in 1:length(population[,1])) {
    value=sum(population[i,])
    evaluation[i]=value
  }
  return(evaluation)
}