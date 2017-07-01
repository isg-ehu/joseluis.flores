source("R/findHMin.R")
source("R/findHMax.R")
source("R/aucISG.R")

WriteLINE<-function(id,fold,train,test,index,name,auc_caret,auc_isg,
                    numvars,numcontvars,numdiscvars,classposition,
                    numinstances,plus_numinstances,plus_min,plus_max,
                    minus_numinstances,minus_min,minus_max,varMinValue,varMaxValue,
                    varMeanValue,varStdDev,varMedian,
                    varQT10,varQT20,varQT30,varQT40,varQT50,
                    varQT60,varQT70,varQT80,varQT90,varQT100, 
                    varHIndex,varHMin,varHMax,varH,varHPLUS,varHMINUS,varExponent,
                    TestNumInstances)
{
  strLine=paste(toString(id)                        ,",")
  strLine=paste(strLine,toString(fold)              ,",")
  strLine=paste(strLine,train                       ,",")
  strLine=paste(strLine,test                        ,",")
  strLine=paste(strLine,toString(index)             ,",")
  strLine=paste(strLine,name                        ,",")
  strLine=paste(strLine,toString(auc_caret)         ,",")
  strLine=paste(strLine,toString(auc_isg)           ,",")
  strLine=paste(strLine,toString(numvars)           ,",")
  strLine=paste(strLine,toString(numcontvars)       ,",")
  strLine=paste(strLine,toString(numdiscvars)       ,",")
  strLine=paste(strLine,toString(classposition)     ,",")
  strLine=paste(strLine,toString(numinstances)      ,",")
  strLine=paste(strLine,toString(plus_numinstances) ,",")
  strLine=paste(strLine,toString(plus_min)          ,",")
  strLine=paste(strLine,toString(plus_max)          ,",")
  strLine=paste(strLine,toString(minus_numinstances),",")
  strLine=paste(strLine,toString(minus_min)         ,",")
  strLine=paste(strLine,toString(minus_max)         ,",")
  strLine=paste(strLine,toString(varMinValue)       ,",")
  strLine=paste(strLine,toString(varMaxValue)       ,",")
  strLine=paste(strLine,toString(varMeanValue)      ,",")
  strLine=paste(strLine,toString(varStdDev)         ,",")
  strLine=paste(strLine,toString(varMeanValue)      ,",")
  strLine=paste(strLine,toString(varQT10)           ,",")
  strLine=paste(strLine,toString(varQT20)           ,",")
  strLine=paste(strLine,toString(varQT30)           ,",")
  strLine=paste(strLine,toString(varQT40)           ,",")
  strLine=paste(strLine,toString(varQT50)           ,",")
  strLine=paste(strLine,toString(varQT60)           ,",")
  strLine=paste(strLine,toString(varQT70)           ,",")
  strLine=paste(strLine,toString(varQT80)           ,",")
  strLine=paste(strLine,toString(varQT90)           ,",")
  strLine=paste(strLine,toString(varQT100)          ,",")
  strLine=paste(strLine,toString(varHIndex)         ,",")
  strLine=paste(strLine,toString(varHMin)           ,",")
  strLine=paste(strLine,toString(varHMax)           ,",")
  strLine=paste(strLine,toString(varH)              ,",")
  strLine=paste(strLine,toString(varHPLUS)          ,",")
  strLine=paste(strLine,toString(varHMINUS)         ,",")
  strLine=paste(strLine,toString(varExponent)       ,",")
  strLine=paste(strLine,toString(TestNumInstances)  )
  strLine<-str_replace_all(strLine,fixed(" "),"")
  line=strLine
  return(line)
}

WriteHEADER<-function()
{
  strLine="General.BBDD.ID,"
  strLine=paste(strLine,"General.Slice,"             )
  strLine=paste(strLine,"General.TrainFile,"         )
  strLine=paste(strLine,"General.TestFile,"          )
  strLine=paste(strLine,"General.Variable.Index,"    )
  strLine=paste(strLine,"General.Variable.Name,"     )
  strLine=paste(strLine,"General.Variable.AUC.Caret,")
  strLine=paste(strLine,"General.Variable.AUC.ISG,"  )
  strLine=paste(strLine,"General.NumVariables,"      )
  strLine=paste(strLine,"General.NumPredictiveContinuousVariables,")
  strLine=paste(strLine,"General.NumPredictiveDiscreteVariables,")
  strLine=paste(strLine,"General.ClassPosition,")
  strLine=paste(strLine,"Train.NumInstances,")
  strLine=paste(strLine,"Train.ClassPositive.NumInstances,")
  strLine=paste(strLine,"Train.ClassPositive.Minvalue,")
  strLine=paste(strLine,"Train.ClassPositive.MaxValue,")
  strLine=paste(strLine,"Train.ClassNegative.NumInstances,")
  strLine=paste(strLine,"Train.ClassNegative.MinValue,")
  strLine=paste(strLine,"Train.ClassNegative.MaxValue,")
  strLine=paste(strLine,"Train.Variable.MinValue,")
  strLine=paste(strLine,"Train.Variable.MaxValue,")
  strLine=paste(strLine,"Train.Variable.MeanValue,")
  strLine=paste(strLine,"Train.Variable.Std.Dev.Value,")
  strLine=paste(strLine,"Train.Variable.Median.Value,")
  strLine=paste(strLine,"Train.Variable.Quantile.10,")
  strLine=paste(strLine,"Train.Variable.Quantile.20,")
  strLine=paste(strLine,"Train.Variable.Quantile.30,")
  strLine=paste(strLine,"Train.Variable.Quantile.40,")
  strLine=paste(strLine,"Train.Variable.Quantile.50,")
  strLine=paste(strLine,"Train.Variable.Quantile.60,")
  strLine=paste(strLine,"Train.Variable.Quantile.70,")
  strLine=paste(strLine,"Train.Variable.Quantile.80,")
  strLine=paste(strLine,"Train.Variable.Quantile.90,")
  strLine=paste(strLine,"Train.Variable.Quantile.100,")
  strLine=paste(strLine,"Train.Variable.Reference.H.Index,")
  strLine=paste(strLine,"Train.Variable.Reference.H.Min,")
  strLine=paste(strLine,"Train.Variable.Reference.H.Max,")
  strLine=paste(strLine,"Train.Variable.Reference.H,")
  strLine=paste(strLine,"Train.Variable.Reference.H.Positive,")
  strLine=paste(strLine,"Train.Variable.Reference.H.Negative,")
  strLine=paste(strLine,"Train.Variable.Exponent,")
  strLine=paste(strLine,"Test.NumInstances")
  line=strLine
  return(line)
}

generateHBehaviour<-function(h_min,h_max,k)
{
  a<-(-logb(h_min,base=2.7172)+logb(h_max,base=2.7172))/(k-1)
  b<--logb(h_max,base=2.7172)-a
  x<-seq(from=1,to=k)
  y<-1/2.7172^(a*x+b)
  return(y)
}

CalculateH<-function(data,vars,numHs)
{
  H_ij=matrix(nrow=length(vars),ncol=numHs)
  for(i in 1:length(vars)) {
    max_real=max(data[,i])
    min_real=min(data[,i])
    h_min=find_h_min(data[,i])
    h_max=abs(max_real-min_real)/2
    Delta=0
    Hs=generateHBehaviour(h_min,h_max,numHs)[numHs:1]
    H_ij[i,]=Hs
  }
  return(H_ij)
}

foldsTRAIN=c( "27/27.01.train.arff",
              "27/27.02.train.arff",
              "27/27.03.train.arff",
              "27/27.04.train.arff",
              "27/27.05.train.arff",
              "27/27.06.train.arff",
              "27/27.07.train.arff",
              "27/27.08.train.arff",
              "27/27.09.train.arff",
              "27/27.10.train.arff")
foldsTEST= c( "27/27.01.test.arff",
              "27/27.02.test.arff",
              "27/27.03.test.arff",
              "27/27.04.test.arff",
              "27/27.05.test.arff",
              "27/27.06.test.arff",
              "27/27.07.test.arff",
              "27/27.08.test.arff",
              "27/27.09.test.arff",
              "27/27.10.test.arff")

vars = c(22,27,36,39)
numHs         = 1000
exponents     = c(0.0,0.4,1.0)
classPosition = 169

Hs<-read.csv("Resultados.20160703/BBDD.27.HDF.csv.bak")
H_matrix<-array(dim=c(10,length(vars),numHs))
for(fold in 1:10) {
  for(var in 1:length(vars)) {
    idAux=which(Hs$auxBBDDID==19 & Hs$auxFolds==fold & Hs$auxVars==vars[var])
    for(H in 1:numHs) {
      H_matrix[fold,var,H]=Hs$auxHs[idAux[H]]
    }
  }
}
print(H_matrix)
H_matrix[which(is.na(H_matrix))]<-0

fileConn<-file("Exp.Configuration.csv","a")
header<-WriteHEADER()
writeLines(header,fileConn)
close(fileConn)

for(fold in 1:length(foldsTRAIN)) {
  db                = read.arff(foldsTRAIN[fold])
  data              = db[]
  data[is.na(data)] = 0
  dbTest            = read.arff(foldsTEST[fold])
  dataTest          = dbTest[]
  dataTest[is.na(dataTest)]=0
  for( var in 1:length(vars)) {
    X_test   = dataTest[,vars[var]]
    X        = data[,vars[var]]
    C        = data[,classPosition]
    X_MINUS  = data[data[,classPosition]==-1,vars[var]]
    X_PLUS   = data[data[,classPosition]== 1,vars[var] ] 
    NI_PLUS  = length(X_PLUS )
    NI_MINUS = length(X_MINUS)
    Frac     = NI_PLUS/NI_MINUS
    auc      = aucISG(X,C,NI_PLUS,NI_MINUS)
    for(hIdx in 1:numHs) {
      for(exp in 1:length(exponents)) {
        FACTOR  = Frac^exponents[exp]
        h_PLUS  = H_matrix [fold,var,hIdx]
        h_MINUS = FACTOR*h_PLUS
        line<-WriteLINE(19,fold,foldsTRAIN[fold],foldsTEST[fold],vars[var],names(data)[vars[var]],
                        0.0,auc,length(vars)+1,length(vars),0,classPosition,length(X),
                        NI_PLUS,min(X_PLUS),max(X_PLUS),
                        NI_MINUS,min(X_MINUS),max(X_MINUS),
                        min(X),max(X),mean(X),sd(X),median(X),
                        quantile(X,c(0.10)),
                        quantile(X,c(0.20)),
                        quantile(X,c(0.30)),
                        quantile(X,c(0.40)),
                        quantile(X,c(0.50)),
                        quantile(X,c(0.60)),
                        quantile(X,c(0.70)),
                        quantile(X,c(0.80)),
                        quantile(X,c(0.90)),
                        quantile(X,c(1.00)),
                        hIdx,H_matrix[fold,var,1],H_matrix[fold,var,numHs],H_matrix[fold,var,hIdx],
                        h_PLUS,h_MINUS,exponents[exp],
                        length(X_test))
          fileConn<-file("Exp.Configuration.csv","a")
          writeLines(line,fileConn)
          close(fileConn)
      }
    }
  }
  print(toString(fold))
}
