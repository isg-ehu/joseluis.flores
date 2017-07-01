library(ggplot2)
library(RWeka)
library(gridExtra)
library(caret)
library(stringr)

source("R/finite.integral.R")
source("R/kernels.R")
source("R/aucISG.R")
source("R/findHMin.R")
source("R/findHMax.R")
source("R/discretize.R")
source("R/LocateY.R")
source("R/Roots.R")

WriteHEADER<-function(output1)
{
  ## Print HEADER
  OutputFile1<-file(output1,"a")
  strLine="Seed,"
  strLine=paste(strLine,"General.BBDD-ID,")
  strLine=paste(strLine,"General.Slice,")
  strLine=paste(strLine,"General.TrainFile,")
  strLine=paste(strLine,"General.TestFile,")
  strLine=paste(strLine,"General.Variable.Index,")
  strLine=paste(strLine,"General.Variable.Name,")
  strLine=paste(strLine,"General.Variable.AUC.Caret,")
  strLine=paste(strLine,"General.Variable.AUC.ISG,")
  strLine=paste(strLine,"General.NumVariables,")
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
  strLine=paste(strLine,"Train.Variable.Quantile.10%,")
  strLine=paste(strLine,"Train.Variable.Quantile.20%,")
  strLine=paste(strLine,"Train.Variable.Quantile.30%,")
  strLine=paste(strLine,"Train.Variable.Quantile.40%,")
  strLine=paste(strLine,"Train.Variable.Quantile.50%,")
  strLine=paste(strLine,"Train.Variable.Quantile.60%,")
  strLine=paste(strLine,"Train.Variable.Quantile.70%,")
  strLine=paste(strLine,"Train.Variable.Quantile.80%,")
  strLine=paste(strLine,"Train.Variable.Quantile.90%,")
  strLine=paste(strLine,"Train.Variable.Quantile.100%,")
  strLine=paste(strLine,"Train.Variable.Reference.H.Index,")
  strLine=paste(strLine,"Train.Variable.Reference.H.Min,")
  strLine=paste(strLine,"Train.Variable.Reference.H.Max,")
  strLine=paste(strLine,"Train.Variable.Reference.H,")
  strLine=paste(strLine,"Train.Variable.Reference.H.Positive,")
  strLine=paste(strLine,"Train.Variable.Reference.H.Negative,")
  strLine=paste(strLine,"Train.Variable.Exponent,")
  strLine=paste(strLine,"Train.Variable.Factor.Method,")
  strLine=paste(strLine,"Train.Variable.NumIntervals,")
  strLine=paste(strLine,"Train.Confusion.Matrix.TP,")
  strLine=paste(strLine,"Train.Confusion.Matrix.FN,")
  strLine=paste(strLine,"Train.Confusion.Matrix.FP,")
  strLine=paste(strLine,"Train.Confusion.Matrix.TN,")
  strLine=paste(strLine,"Train.Accuracy,")
  strLine=paste(strLine,"Train.FalsePositive.Rate,")
  strLine=paste(strLine,"Train.FalseNegative.Rate,")
  strLine=paste(strLine,"Train.False.Rate,")
  strLine=paste(strLine,"Test.NumInstances,")
  strLine=paste(strLine,"Test.ClassPositive.NumInstances,")
  strLine=paste(strLine,"Test.ClassPositive.MinValue,")
  strLine=paste(strLine,"Test.ClassPositive.MaxValue,")
  strLine=paste(strLine,"Test.ClassNegative.NumInstances,")
  strLine=paste(strLine,"Test.ClassNegative.MinValue,")
  strLine=paste(strLine,"Test.ClassNegative.MaxValue,")
  strLine=paste(strLine,"Test.Confusion.Matrix.TP,")
  strLine=paste(strLine,"Test.Confusion.Matrix.FN,")
  strLine=paste(strLine,"Test.Confusion.Matrix.FP,")
  strLine=paste(strLine,"Test.Confusion.Matrix.TN,")
  strLine=paste(strLine,"Test.Accuracy,")
  strLine=paste(strLine,"Test.FalsePositive.Rate,")
  strLine=paste(strLine,"Test.FalseNegative.Rate,")
  strLine=paste(strLine,"Test.False.Rate,")
  strLine=paste(strLine,"Other.Local.AUC")
  write(strLine,OutputFile1)
  close(OutputFile1)
}
Classify <- function(bbdd,fold,var,h_index,exponent,output1,output2) {
  ########################################################################################  
  ## Initialize experiment parameters
  ########################################################################################
  tokens = as.character(Configuration$EXPS.CONFIGURATION.General.TrainFile.1.)
  train  = strsplit(tokens,"/")
  train_file           = train[[1]][2]
  
  
  tokens = as.character(Configuration$EXPS.CONFIGURATION.General.TestFile.1.)
  test   = strsplit(tokens,"/")  
  test_file            = test[[1]][2]
  
  ## ADDED FOR TESTING ONLY
  train_file = Configuration$EXPS.CONFIGURATION.General.TrainFile.1.
  test_file = Configuration$EXPS.CONFIGURATION.General.TestFile.1.
  
  class_position       = as.numeric  (Configuration$EXPS.CONFIGURATION.General.ClassPosition.1.)
  variable_index       = as.numeric  (Configuration$EXPS.CONFIGURATION.General.Variable.Index.1.)
  variable_name        = as.character(Configuration$EXPS.CONFIGURATION.General.Name.1.)
  h_plus               = as.numeric  (Configuration$EXPS.CONFIGURATION.Train.Variable.Reference.H.Positive.1.)  
  h_minus              = as.numeric  (Configuration$EXPS.CONFIGURATION.Train.Variable.Reference.H.Negative.1.)
  exponent             = as.numeric  (Configuration$EXPS.CONFIGURATION.Train.Variable.Exponent.1.)
  ########################################################################################  
  ## Create PATH
  ########################################################################################
  print(train_file)
  print(test_file)
  if (bbdd < 10 ) {
    if ( fold < 10 ) {
      path=paste("0",toString(bbdd),".0",toString(fold),sep="")  
    } else {
      path=paste("0",toString(bbdd),".",toString(fold),sep="")  
    }    
  } else {
    if ( fold < 10 ) {
      path=paste(toString(bbdd),".0",toString(fold),sep="")    
    } else {
      path=paste(toString(bbdd),".",toString(fold),sep="")  
    }
  }
##  path=train[[1]][1] REMOVED FOR TESTING ONLY
  ########################################################################################  
  ## Read TRAIN File
  ########################################################################################
  path=paste("0",path,"/",sep="")
#  data                 = read.arff(paste(path,train_file,sep=""))
  data                 = read.arff(toString(train_file))  
  dbtrain              = data[]
  dbtrain[is.na(data)] = 0
  variable_data_train  = dbtrain[,variable_index]
  class_data_train     = dbtrain[,class_position]
  ########################################################################################  
  ## Read TEST File
  ########################################################################################  
#  data                 = read.arff(paste(path,test_file,sep=""))
  data                 = read.arff(toString(test_file))
  dbtest               = data[]
  dbtest[is.na(data)]  = 0
  variable_data_test   = dbtest[,variable_index]
  class_data_test      = dbtest[,class_position]
  
  train_instances      = Configuration$Train.NumInstances
  test_instances       = Configuration$Test.NumInstances
  kernel_samples       = 2^(floor(log2(10*(train_instances+test_instances))))     
  kernel_samples       = max(kernel_samples,4096)
  
  min_X = min(as.numeric(variable_data_train),as.numeric(variable_data_test))
  max_X = max(variable_data_train,variable_data_test)
  ########################################################################################  
  ## Separate TRAIN vs TEST
  ########################################################################################  
  temp=cbind(variable_data_train,class_data_train)
  tmp_class=as.numeric(levels(class_data_train))[class_data_train]
  X_train_PLUS  = temp[tmp_class== 1,1]
  X_train_MINUS = temp[tmp_class==-1,1]
  X_train       = temp[,1]
  Y_train_PLUS  = tmp_class[which(tmp_class== 1)] 
  Y_train_MINUS = tmp_class[which(tmp_class==-1)] 
  Y_train       = tmp_class 
  
  temp_test=cbind(variable_data_test,class_data_test)
  tmp_class=as.numeric(levels(class_data_test))[class_data_test]
  X_test_PLUS  = temp_test[tmp_class== 1,1]
  X_test_MINUS = temp_test[tmp_class==-1,1]
  X_test       = temp_test[,1]
  Y_test_PLUS  = tmp_class[which(tmp_class== 1)]
  Y_test_MINUS = tmp_class[which(tmp_class==-1)]
  Y_test       = tmp_class
  
  h_test       = find_h_min(X_test)
  ########################################################################################  
  ## Calculate MIN-MAX for each density function
  ########################################################################################  
  tmp_train_plus  = density(X_train_PLUS,kernel="epanechnikov",bw=h_plus,n=kernel_samples,adjust=.45)
  train_plus_min_x=min(tmp_train_plus[[1]])
  train_plus_max_x=max(tmp_train_plus[[1]])
  
  tmp_train_minus = density(X_train_MINUS,kernel="epanechnikov",bw=h_minus,n=kernel_samples,adjust=.45)
  train_minus_min_x=min(tmp_train_minus[[1]])
  train_minus_max_x=max(tmp_train_minus[[1]])
  
  min_X=min(min_X,train_plus_min_x,train_minus_min_x)
  max_X=max(max_X,train_plus_max_x,train_minus_max_x)
  ########################################################################################  
  ## Estimation of class densities
  ########################################################################################
  train_var_density_plus  = ISG_density(X_train_PLUS ,kernel="epanechnikov",h_plus ,kernel_samples,min_X,max_X)
  train_var_density_minus = ISG_density(X_train_MINUS,kernel="epanechnikov",h_minus,kernel_samples,min_X,max_X)  
  
  x             = train_var_density_plus  [[1]]
  train_y_PLUS  = train_var_density_plus  [[2]]
  train_y_MINUS = train_var_density_minus [[2]]
  ########################################################################################  
  ## Calculation of the solutions
  ########################################################################################  
  x_y_plus_y_minus<-cbind(x,train_y_PLUS,train_y_MINUS)
  X_Zeros<-Roots(x_y_plus_y_minus)
  Y_Zeros<-LocateY(x,train_y_PLUS,X_Zeros)
  numZeros=length(X_Zeros)
  ZEROS=array(dim=c(length(X_Zeros),2))
  for (i in (1:numZeros)) {
    ZEROS[i,1]=X_Zeros[i]
    ZEROS[i,2]=Y_Zeros[i]
  }
  ############################################################################## 
  ## Discretization of TRAIN DATA
  ############################################################################## 
  print(X_Zeros)
  print(length(X_Zeros))
  if (length(X_Zeros)>0) {
    DX_train = discretize(X_train,X_Zeros)
    myLevels=seq(from=1,to=numZeros+1)
    myLength=length(DX_train)
    auxVar=seq(from=1,to=(myLength+numZeros+1))
    auxVar[1:myLength]=DX_train
    auxVar[(myLength+1):(myLength+numZeros+1)]=myLevels
    auxVar=factor(auxVar,labels=myLevels)
    DX_train=data.frame(auxVar[1:myLength]) 
    DY_train=factor(Y_train,levels=c(-1,1))
    ############################################################################## 
    ## Discretization of TEST DATA
    ##############################################################################   
    DX_test = discretize(X_test,X_Zeros)
    myLevels=seq(from=1,to=numZeros+1)
    myLength=length(DX_test)
    auxVar=seq(from=1,to=(myLength+numZeros+1))
    auxVar[1:myLength]=DX_test
    auxVar[(myLength+1):(myLength+numZeros+1)]=myLevels
    auxVar=factor(auxVar,labels=myLevels)
    DX_test=data.frame(auxVar[1:myLength]) 
    DY_test=factor(Y_test,levels=c(-1,1)) 
    ########################################################################################  
    ## Learning NaiveBayes
    ########################################################################################  
    NB=train(DX_train,DY_train,'nb',trControl=trainControl(method="none"),tuneGrid=data.frame(.fL=1, .usekernel=FALSE, .adjust="none"))
    # print(NB)
    # print(NB$finalModel)
    NB$finalModel$apriori["-1"]=1.0
    NB$finalModel$apriori["1" ]=1.0
    # print(NB$finalModel$apriori)
    ########################################################################################  
    ## Classification TEST DATA
    ########################################################################################  
    CM<-table(predict(NB$finalModel,DX_test)$class,DY_test)
    print(CM)
    RealTP=0
    RealFN=0
    RealFP=0
    RealTN=0
    CMDF=data.frame(CM)
    for(i in 1:4){
      if (CMDF$DY_test[i]==1 && CMDF$Var1[i]==1) {
        RealTP=CMDF$Freq[i]
      }
      if (CMDF$DY_test[i]==-1 && CMDF$Var1[i]==-1) {
        RealTN=CMDF$Freq[i]
      }
      if (CMDF$DY_test[i]==-1 && CMDF$Var1[i]==1) {
        RealFP=CMDF$Freq[i]
      }
      if (CMDF$DY_test[i]==1 && CMDF$Var1[i]==-1) {
        RealFN=CMDF$Freq[i]
      }
    }
    ########################################################################################  
    ## Print CLASSIFICATION Header (Results)
    ########################################################################################
    WriteHEADER(output1)
    ########################################################################################  
    ## Print CLASSIFICATION Results
    ########################################################################################
    OutputFile1<-file(output1,"a")
    strLine=""
    strLine=paste(strLine,"0.0,")
    strLine=paste(strLine,toString(bbdd )             ,",")
    strLine=paste(strLine,toString(fold),",")#
    strLine=paste(strLine,train_file                  ,",")#
    strLine=paste(strLine,test_file                   ,",")#
    strLine=paste(strLine,toString(var)               ,",")
    strLine=paste(strLine,Configuration$EXPS.CONFIGURATION.General.Variable.Name.1.,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.General.Variable.AUC.Caret.1.)               ,",")
    strLine=paste(strLine,toString(round(Configuration$EXPS.CONFIGURATION.General.Variable.AUC.ISG.1.,digits=6)) ,",")
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.General.NumVariables.1.)                     ,",")
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.General.NumPredictiveContinuousVariables.1.) ,",")
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.General.NumPredictiveDiscreteVariables.1.)   ,",")
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.General.ClassPosition.1.)                    ,",")
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.NumInstances.1.)                       ,",")## TRAIN
    strLine=paste(strLine,toString(length(X_train_PLUS  )) ,",")
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.ClassPositive.Minvalue.1.),",")#
    strLine=paste(strLine,toString(0.0),",")#
    strLine=paste(strLine,toString(length(X_train_MINUS )) ,",")
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.ClassNegative.MinValue.1.),",")#
    strLine=paste(strLine,toString(0.0),",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.MinValue.1.)          ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.MaxValue.1.)          ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.MeanValue.1.)         ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Std.Dev.Value.1.)       ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Median.Value.1.)       ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.10.1.)       ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.20.1.)       ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.30.1.)       ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.40.1.)       ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.50.1.)       ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.60.1.)       ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.70.1.)       ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.80.1.)       ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.90.1.)       ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.100.1.)      ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Reference.H.Index.1.),",")
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Reference.H.Min.1.)            ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Reference.H.Max.1.)            ,",")#
    strLine=paste(strLine,toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Reference.H.1.)               ,",")#
    strLine=paste(strLine,toString(round(h_plus,digits=6))  ,",")
    strLine=paste(strLine,toString(round(h_minus,digits=6)) ,",")
    strLine=paste(strLine,toString(round(exponent,digits=6)),",")
    strLine=paste(strLine,toString(1.0)    ,",")#
    strLine=paste(strLine,toString(numZeros+1)      ,",")
    strLine=paste(strLine,toString(0.0)         ,",")#
    strLine=paste(strLine,toString(0.0)         ,",")#
    strLine=paste(strLine,toString(0.0)         ,",")#
    strLine=paste(strLine,toString(0.0)         ,",")#
    strLine=paste(strLine,toString(0.0)        ,",")#
    strLine=paste(strLine,toString(0.0)         ,",")#
    strLine=paste(strLine,toString(0.0)             ,",")#
    strLine=paste(strLine,toString(0.0)             ,",")#
    strLine=paste(strLine,toString(length(X_test_PLUS)+length(X_test_MINUS)),",")
    strLine=paste(strLine,toString(length(X_test_PLUS)),",")
    strLine=paste(strLine,toString(0.0),",")#
    strLine=paste(strLine,toString(0.0),",")#
    strLine=paste(strLine,toString(length(X_test_MINUS)),",")
    strLine=paste(strLine,toString(0.0),",")#
    strLine=paste(strLine,toString(0.0),",")
    strLine=paste(strLine,toString(RealTP)         ,",")#
    strLine=paste(strLine,toString(RealFN)         ,",")#
    strLine=paste(strLine,toString(RealFP)         ,",")#
    strLine=paste(strLine,toString(RealTN)         ,",")#
    strLine=paste(strLine,toString(0.0)            ,",")#
    strLine=paste(strLine,toString(0.0)             ,",")#
    strLine=paste(strLine,toString(0.0)             ,",")#
    strLine=paste(strLine,toString((RealFP+RealFN)/(RealTP+RealTN+RealFP+RealFN))              ,",")#
    strLine=paste(strLine,toString(0.0)           ) # LAUC
    strLine<-str_replace_all(strLine,fixed(" "),"")
    write(strLine,OutputFile1)
    close(OutputFile1)
  }
}

## Step 1 - Load configuration file
DatabaseFile      = "Exp.Configuration.csv"
#DatabaseFile      = "Exp.Check.csv"
EXPS.CONFIGURATION=read.csv(DatabaseFile)
#EXPS.CONFIGURATION=EXPS.CONFIGURATION[-which(EXPS.CONFIGURATION$Train.Variable.Reference.H==0),]
NumExperiments=length(EXPS.CONFIGURATION[,1])

Configuration=data.frame(EXPS.CONFIGURATION$General.BBDD.ID[1],
                         EXPS.CONFIGURATION$General.Slice[1],
                         EXPS.CONFIGURATION$General.TrainFile[1]     ,
                         EXPS.CONFIGURATION$General.TestFile[1]      ,
                         EXPS.CONFIGURATION$General.ClassPosition[1] ,
                         EXPS.CONFIGURATION$General.Variable.Index[1],
                         EXPS.CONFIGURATION$General.Variable.Name[1] ,
                         EXPS.CONFIGURATION$General.Variable.AUC.Caret[1],
                         EXPS.CONFIGURATION$General.Variable.AUC.ISG[1],
                         EXPS.CONFIGURATION$General.NumVariables[1],
                         EXPS.CONFIGURATION$General.NumPredictiveContinuousVariables[1],
                         EXPS.CONFIGURATION$General.NumPredictiveDiscreteVariables[1],
                         EXPS.CONFIGURATION$Train.Variable.Reference.H.Positive[1],
                         EXPS.CONFIGURATION$Train.Variable.Reference.H.Negative[1],
                         EXPS.CONFIGURATION$Train.Variable.Exponent[1],
                         EXPS.CONFIGURATION$Train.NumInstances[1],
                         EXPS.CONFIGURATION$Test.NumInstances[1], 
                         EXPS.CONFIGURATION$Train.ClassPositive.NumInstances[1],
                         EXPS.CONFIGURATION$Train.ClassPositive.Minvalue[1],
                         EXPS.CONFIGURATION$Train.ClassPositive.MaxValue[1],
                         EXPS.CONFIGURATION$Train.ClassNegative.NumInstances[1],
                         EXPS.CONFIGURATION$Train.ClassNegative.MinValue[1],
                         EXPS.CONFIGURATION$Train.ClassNegative.MaxValue[1],
                         EXPS.CONFIGURATION$Train.Variable.MinValue[1],
                         EXPS.CONFIGURATION$Train.Variable.MaxValue[1],
                         EXPS.CONFIGURATION$Train.Variable.MeanValue[1],
                         EXPS.CONFIGURATION$Train.Variable.Std.Dev.Value[1],
                         EXPS.CONFIGURATION$Train.Variable.Median.Value[1],
                         EXPS.CONFIGURATION$Train.Variable.Reference.H.Index[1],
                         EXPS.CONFIGURATION$Train.Variable.Reference.H.Min[1],
                         EXPS.CONFIGURATION$Train.Variable.Reference.H.Max[1],
                         EXPS.CONFIGURATION$Train.Variable.Reference.H[1],
                         EXPS.CONFIGURATION$Train.Variable.Quantile.10[1],
                         EXPS.CONFIGURATION$Train.Variable.Quantile.20[1],
                         EXPS.CONFIGURATION$Train.Variable.Quantile.30[1],
                         EXPS.CONFIGURATION$Train.Variable.Quantile.40[1],
                         EXPS.CONFIGURATION$Train.Variable.Quantile.50[1],
                         EXPS.CONFIGURATION$Train.Variable.Quantile.60[1],
                         EXPS.CONFIGURATION$Train.Variable.Quantile.70[1],
                         EXPS.CONFIGURATION$Train.Variable.Quantile.80[1],
                         EXPS.CONFIGURATION$Train.Variable.Quantile.90[1],
                         EXPS.CONFIGURATION$Train.Variable.Quantile.100[1])

for(i in 1:NumExperiments) {
  Configuration$EXPS.CONFIGURATION.General.BBDD.ID.1.	                      = EXPS.CONFIGURATION$General.BBDD.ID[i] #EXPS.CONFIGURATION$General.BBDD.ID[i]
  Configuration$EXPS.CONFIGURATION.General.Slice.1.								          = EXPS.CONFIGURATION$General.Slice[i]
  Configuration$EXPS.CONFIGURATION.General.TrainFile.1.	                    = EXPS.CONFIGURATION$General.TrainFile[i] 
  Configuration$EXPS.CONFIGURATION.General.TestFile.1.							        = EXPS.CONFIGURATION$General.TestFile[i]       
  Configuration$EXPS.CONFIGURATION.General.ClassPosition.1.						      = EXPS.CONFIGURATION$General.ClassPosition[i] 
  Configuration$EXPS.CONFIGURATION.General.Variable.Index.1.					      = EXPS.CONFIGURATION$General.Variable.Index[i]
  Configuration$EXPS.CONFIGURATION.General.Variable.Name.1.						      = EXPS.CONFIGURATION$General.Variable.Name[i] 
  Configuration$EXPS.CONFIGURATION.General.Variable.AUC.Caret.1.				    = EXPS.CONFIGURATION$General.Variable.AUC.Caret[i]
  Configuration$EXPS.CONFIGURATION.General.Variable.AUC.ISG.1.					    = EXPS.CONFIGURATION$General.Variable.AUC.ISG[i]
  Configuration$EXPS.CONFIGURATION.General.NumVariables.1.    					    = EXPS.CONFIGURATION$General.NumVariables[i]
  Configuration$EXPS.CONFIGURATION.General.NumPredictiveContinuousVariables.1.	= EXPS.CONFIGURATION$General.NumPredictiveContinuousVariables[i]
  Configuration$EXPS.CONFIGURATION.General.NumPredictiveDiscreteVariables.1.	= EXPS.CONFIGURATION$General.NumPredictiveDiscreteVariables[i]
  Configuration$EXPS.CONFIGURATION.Train.NumInstances.1.						        = EXPS.CONFIGURATION$Train.NumInstances[i]
  Configuration$EXPS.CONFIGURATION.Train.ClassPositive.NumInstances.1.		  = EXPS.CONFIGURATION$Train.ClassPositive.NumInstances[i]
  Configuration$EXPS.CONFIGURATION.Train.ClassPositive.Minvalue.1.				  = EXPS.CONFIGURATION$Train.ClassPositive.Minvalue[i]
  Configuration$EXPS.CONFIGURATION.Train.ClassPositive.MaxValue.1.				  = EXPS.CONFIGURATION$Train.ClassPositive.MaxValue[i]
  Configuration$EXPS.CONFIGURATION.Train.ClassNegative.NumInstances.1.		  = EXPS.CONFIGURATION$Train.ClassNegative.NumInstances[i]
  Configuration$EXPS.CONFIGURATION.Train.ClassNegative.MinValue.1.				  = EXPS.CONFIGURATION$Train.ClassNegative.MinValue[i]
  Configuration$EXPS.CONFIGURATION.Train.ClassNegative.MaxValue.1.				  = EXPS.CONFIGURATION$Train.ClassNegative.MaxValue[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.MinValue.1.					      = EXPS.CONFIGURATION$Train.Variable.MinValue[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.MaxValue.1.					      = EXPS.CONFIGURATION$Train.Variable.MaxValue[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.MeanValue.1.					    = EXPS.CONFIGURATION$Train.Variable.MeanValue[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Std.Dev.Value.1.				  = EXPS.CONFIGURATION$Train.Variable.Std.Dev.Value[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Median.Value.1.				    = EXPS.CONFIGURATION$Train.Variable.Median.Value[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.10.1.				    = EXPS.CONFIGURATION$Train.Variable.Quantile.10[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.20.1.				    = EXPS.CONFIGURATION$Train.Variable.Quantile.20[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.30.1.				    = EXPS.CONFIGURATION$Train.Variable.Quantile.30[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.40.1.				    = EXPS.CONFIGURATION$Train.Variable.Quantile.40[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.50.1.				    = EXPS.CONFIGURATION$Train.Variable.Quantile.50[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.60.1.				    = EXPS.CONFIGURATION$Train.Variable.Quantile.60[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.70.1.				    = EXPS.CONFIGURATION$Train.Variable.Quantile.70[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.80.1.				    = EXPS.CONFIGURATION$Train.Variable.Quantile.80[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.90.1.				    = EXPS.CONFIGURATION$Train.Variable.Quantile.90[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Quantile.100.1.				    = EXPS.CONFIGURATION$Train.Variable.Quantile.100[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Reference.H.Index.1.			= EXPS.CONFIGURATION$Train.Variable.Reference.H.Index[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Reference.H.Min.1.			  = EXPS.CONFIGURATION$Train.Variable.Reference.H.Min[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Reference.H.Max.1.			  = EXPS.CONFIGURATION$Train.Variable.Reference.H.Max[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Reference.H.1.				    = EXPS.CONFIGURATION$Train.Variable.Reference.H[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Reference.H.Positive.1.		= EXPS.CONFIGURATION$Train.Variable.Reference.H.Positive[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Reference.H.Negative.1.		= EXPS.CONFIGURATION$Train.Variable.Reference.H.Negative[i]
  Configuration$EXPS.CONFIGURATION.Train.Variable.Exponent.1.					      = EXPS.CONFIGURATION$Train.Variable.Exponent[i]
  Configuration$EXPS.CONFIGURATION.Test.NumInstances.1.							        = EXPS.CONFIGURATION$Test.NumInstances[i]
  strFile1<-""
  strFile1<-paste(strFile1,"Analysis.",toString(Configuration$EXPS.CONFIGURATION.General.BBDD.ID.1.),".",toString(Configuration$EXPS.CONFIGURATION.General.Variable.Index.1.),".csv")
  strFile1<-str_replace_all(strFile1,fixed(" "),"")
  strFile=""
  strFile<-paste(strFile,"Analysis.DD.",toString(Configuration$EXPS.CONFIGURATION.General.BBDD.ID.1.),".",toString(Configuration$EXPS.CONFIGURATION.General.Slice.1.),".",toString(Configuration$EXPS.CONFIGURATION.General.Variable.Index.1.),".",toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Reference.H.Index.1.),".",toString(Configuration$EXPS.CONFIGURATION.Train.Variable.Exponent.1.))

   bbddid=as.character(Configuration$EXPS.CONFIGURATION.General.BBDD.ID.1.)
   print(bbddid)
   print(i)
   Classify(bbddid,
            Configuration$EXPS.CONFIGURATION.General.Slice.1.,
            Configuration$EXPS.CONFIGURATION.General.Variable.Index.1.,
            Configuration$EXPS.CONFIGURATION.Train.Variable.Reference.H.Index.1.,
            Configuration$EXPS.CONFIGURATION.Train.Variable.Exponent.1.,
            strFile1,
            strFile)
}
