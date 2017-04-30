umda.select <- function(selection,population,evaluation) {
  num.selected.instances = round(selection*length(population[,1]))
  selected.population = population[1:num.selected.instances,]
  return(selected.population)
}