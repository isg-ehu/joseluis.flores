umda.show.population<-function(iteration,population,evaluation,first,last) {
  num.instances <- length(population[,1])
  num.vars <- length(population[1,])
  if (first > last) {
    return
  } else {
    if ( first >=1 & first<=num.instances & last>=1 & last<=num.instances) {
      for(i in first:last) {
        instance<-""
        for( j in 1:(num.vars)) {
          instance<-paste(instance,toString(population[i,j]),"")
          instance<-str_replace_all(instance,fixed(" "),"")
        }
        instance<-paste("G(",toString(iteration),")=[",instance,"]=",toString(evaluation[i]))
        instance<-str_replace_all(instance,fixed(" "),"")
        print(instance)
      }      
    }
  }
}