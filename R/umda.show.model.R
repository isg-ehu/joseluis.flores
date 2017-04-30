umda.show.model<-function(iteration,model) {
  num.vars <- length(model)
  p<-""
  for( i in 1:(num.vars)) {
    p<-paste(p,toString(model[i]),",")
    p<-str_replace_all(p,fixed(" "),"")
  }
  p<-paste("M(",toString(iteration),")=[",p,"]")
  p<-str_replace_all(p,fixed(" "),"")
  print(p)
}