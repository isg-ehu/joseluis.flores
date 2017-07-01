source ("R/umda.params.R")
source ("R/umda.create.evaluation.R")
source ("R/umda.generate.population.R")
source ("R/umda.learn.R")
source ("R/umda.select.R")
source ("R/umda.evaluate.R")
source ("R/umda.sort.R")
source ("R/umda.show.population.R")
source ("R/umda.show.model.R")

umda <-  function (params) {
  evaluation <- umda.create.evaluation(params[[1]])
  population <- umda.generate.pop(params[[1]],params[[4]])
  evaluation <- umda.evaluate(population,params[[6]])
  population <- umda.sort(population,evaluation)
  evaluation <- evaluation[sort(evaluation,index.return=TRUE)$ix]
  umda.show.population(0,population,evaluation,1,params[[1]])

  print("Optimization: STARTED")
  iteration <- 1
  while (params[[5]] > iteration) {
    selected.population <- umda.select(params[[2]],population,evaluation)
    params[[4]]$definition <- umda.learn(selected.population)
    population <- umda.generate.pop(params[[1]],params[[4]])
    evaluation <- umda.evaluate(population,params[[6]])
    population <- umda.sort(population,evaluation)
    evaluation <- evaluation[sort(evaluation,index.return=TRUE)$ix]
    umda.show.population(iteration,population,evaluation,1,1)
    umda.show.model(iteration,params[[4]]$definition)
    iteration <- iteration + 1
  }
  print("Optimization: FINISHED")
  return(list(population,evaluation))
}

# source("R/umda.model.R")
# 
# pop.size <- 10
# selection.engine <- 0.50
# reduction.engine <- "none"
# stop.condition <- 100
# model.definition <- umda.model (structure = "independent.structure", 
#                                 params = "bernouilli", 
#                                 init.params = "random", 
#                                 num.vars = 50 ) 
# 
# problem.description = list("train.arff","test.arff")
# 
# params<-umda.params(popsize = pop.size,
#                     selection.eng = selection.engine,
#                     reduction.eng = reduction.engine,
#                     model = model.definition,
#                     stop.cond = stop.condition,
#                     problem = problem.description)
# 
# results <- umda(params)