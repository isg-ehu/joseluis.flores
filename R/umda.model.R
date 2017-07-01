library(LaplacesDemon)

umda.model <- function (structure = "independent.structure", params = "bernouilli",init.params = "random" , num.vars) {
  model.name <- "bernouilli"
  model.structure <- "independent"
  model.definition = array(dim=c(num.vars))
  for(i in 1:num.vars) {
    model.definition[i]=0.5
  }
  model.num.vars <- num.vars
  return(list(name=model.name,structure=model.structure,definition=model.definition,num.vars=model.num.vars))
}