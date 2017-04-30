filtexps=read.csv("Analysis.multiple.Filtrado.csv",header=TRUE)
index11=which(filtexps$General.Variable.Index==7 & filtexps$General.BBDD.ID==19 & filtexps$Train.Variable.Reference.H.Index<=10)
index12=which(filtexps$General.Variable.Index==33 & filtexps$General.BBDD.ID==19 & filtexps$Train.Variable.Reference.H.Index>=17 & filtexps$Train.Variable.Reference.H.Index<=26)
index13=which(filtexps$General.Variable.Index==38 & filtexps$General.BBDD.ID==19 & filtexps$Train.Variable.Reference.H.Index>=90)
index14=which(filtexps$General.Variable.Index==128 & filtexps$General.BBDD.ID==19 & filtexps$Train.Variable.Reference.H.Index>=89)

index21=which(filtexps$General.Variable.Index==12 & filtexps$General.BBDD.ID==21 & filtexps$Train.Variable.Reference.H.Index<=92 & filtexps$Train.Variable.Reference.H.Index>=83)

index31=which(filtexps$General.Variable.Index==22 & filtexps$General.BBDD.ID==27 & filtexps$Train.Variable.Reference.H.Index<=58 & filtexps$Train.Variable.Reference.H.Index>=49)
index32=which(filtexps$General.Variable.Index==27 & filtexps$General.BBDD.ID==27 & filtexps$Train.Variable.Reference.H.Index<=55 & filtexps$Train.Variable.Reference.H.Index>=46)
index33=which(filtexps$General.Variable.Index==36 & filtexps$General.BBDD.ID==27 & filtexps$Train.Variable.Reference.H.Index<=59 & filtexps$Train.Variable.Reference.H.Index>=50)
index34=which(filtexps$General.Variable.Index==39 & filtexps$General.BBDD.ID==27 & filtexps$Train.Variable.Reference.H.Index<=63 & filtexps$Train.Variable.Reference.H.Index>=54)

indexes=c(index11,index12,index13,index14,index21,index31,index32,index33,index34)
datafiltered=filtexps[indexes,]
write.csv(datafiltered,"Experiments.20160719.csv",col.names = TRUE)
