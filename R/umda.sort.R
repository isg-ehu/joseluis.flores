umda.sort <- function (population,evaluation) {
  result<-sort(evaluation,index.return=TRUE)$ix
  return(population[result,])
}