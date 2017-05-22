      ## Clearing workspace
      rm(list=ls())
      
      ## Incluir Librerias
      library(RWeka)
      library(caret)
      library(klaR)
      library(stringr)
      library(ROCR)

      ## Incluir Funciones
      source("lib/logging.R")
      source("lib/findHMin.R")
      source("lib/findHMax.R")
      source("lib/HFun.R")
      source("lib/discretize.R")
      source("lib/K2_density.R")
      source("lib/CreateStratifiedCrossFolds.R")
      
      FILE=paste(format(Sys.Date(),"%y/%m/%d"),",",format(Sys.time(), "%X"),".log")
      FILE<-str_replace_all(FILE,fixed(","),"")
      FILE<-str_replace_all(FILE,fixed("  "),".")
      FILE<-str_replace_all(FILE,fixed("/"),".")
      FILE<-str_replace_all(FILE,fixed(":"),".")
      FILE<-str_replace_all(FILE,fixed(" "),"")
      ## Phase 1>> Inicializacion del RUN
      ## -----------------------------------------------------------
      ## Step 1. Cargar Run File, el formato sera la fecha.
      args <- commandArgs(trailingOnly = TRUE)
      RunFile           = args[1]
      RUNINFO           = read.csv(RunFile)
      DataPath			= args[2]
      TrainFile         = str_replace_all(paste(DataPath,toString(RUNINFO[1,2])),fixed(" "),"")
      TestFile          = str_replace_all(paste(DataPath,toString(RUNINFO[1,3])),fixed(" "),"")
      vars              = RUNINFO[ ,4]
      classPos          = RUNINFO[1,5]
      LogPath           = args[3]
      ResultsPath 		= args[4]
      TrainDFile        = str_replace_all(paste(ResultsPath,toString(RUNINFO[1,2])),fixed(" "),"")
      TestDFile         = str_replace_all(paste(ResultsPath,toString(RUNINFO[1,3])),fixed(" "),"")
      numHs             = as.numeric(args[5])

	print(numHs)

      logging(LogPath,FILE,"Phase 1","BEGIN","Parameter initialization")
      logging(LogPath,FILE,"Phase 1","Step 1: Log File",FILE)
      ## Step 2. Imprimir resumen del Run. - LOG
      logging(LogPath,FILE,"Phase 1","Step 2: Data folder",DataPath)
      logging(LogPath,FILE,"Phase 1","Step 2: Variable vector",toString(vars))
      logging(LogPath,FILE,"Phase 1","Step 2: Class position",toString(classPos))
      logging(LogPath,FILE,"Phase 1","Step 2: Number of Hs",toString(numHs))      
      ## RUNS
      ## Step 3. Leer/almacenar TRAIN - LOG
      db                = read.arff(TrainFile)
      data              = db[]
      data[is.na(data)] = 0
      dataDISCRETIZED   = data
      TrainNumInstances = length(data[,1])
      TrainNumVariables = length(data[1,])
      
      logging(LogPath,FILE,"Phase 1","Step 3: Train File",TrainFile)
      logging(LogPath,FILE,"Phase 1","Step 3: Train File Instances",toString(TrainNumInstances))
      logging(LogPath,FILE,"Phase 1","Step 3: Train File Variables",toString(TrainNumVariables))
      ## Step 4. Leer/almacenar TEST - LOG
      dbTest            = read.arff(TestFile)
      dataTest          = dbTest[]
      dataTest[is.na(dataTest)] = 0
      dataTestDISCRETIZED = dataTest
      TestNumInstances = length(dataTest[,1])
      TestNumVariables = length(dataTest[1,])
      
      logging(LogPath,FILE,"Phase 1","Step 3: Test File",TestFile)
      logging(LogPath,FILE,"Phase 1","Step 3: Test File Instances",toString(TestNumInstances))
      logging(LogPath,FILE,"Phase 1","Step 3: Test File Variables",toString(TestNumVariables))      
      # Step 5. Creacion de variables globales - LOG
      
      H = array(dim=c(length(vars),numHs))
      HReal = array(dim=c(length(vars)))
      strACC_Method=c("Approximate","Exact")
      ACC_METHOD = 2 ## 0 - Approximate, 1 - Exact
      ACC_CHANGE_CRITERIA = 0 ## 0 > Method, 1 >= Method
      ACC_CH_CRIT=c(">",">=")  
      ACC = array(dim=c(length(vars),numHs))
      Best.ACC = array(dim=c(length(vars)))
      HRange = 1.0
      Exponent = 1.0
      DP = vector("list",length(vars))
      logging(LogPath,FILE,"Phase 1","Step 4: ACC Method",toString(ACC_METHOD))
      logging(LogPath,FILE,"Phase 1","Step 4: Array H","Created")
      logging(LogPath,FILE,"Phase 1","Step 4: Array ACC","Created")
      logging(LogPath,FILE,"Phase 1","Step 4: H range",toString(HRange))
      logging(LogPath,FILE,"Phase 1","Step 4: Exponent",toString(Exponent))
      logging(LogPath,FILE,"Phase 1","Step 5: Global variables creation","SUCCESS!")      
      ## Step 6. Calcular los vectores H para todas las variables indicadas. - LOG
      print(length(vars))
      print(numHs)
      for(i in 1:length(vars)) {
        for(j in 1:numHs) {
          H  [i,j]=0 
          ACC[i,j]=0
        }
        Best.ACC[i]=0
      }
      logging(LogPath,FILE,"Phase 1","Step 6: H matrix","Initialized to zero")
      
      for( var in vars)
      {
        X=data[,var]
        
        hconfig=HFun(X,numHs)
        logging(LogPath,FILE,"Phase 1","Step 7: Estimating H values",paste("Variable", toString(var)))
        logging(LogPath,FILE,"Phase 1","Step 7: Estimating H values",paste("Variable", toString(hconfig$H)))     
        title=paste(TrainFile,"/ Var",toString(var),"-",names(data[var]))
        H[which(vars==var),]=hconfig$H
        HReal[which(vars==var)]=length(which(unique(hconfig$H)!=0))
        if (length(unique(is.na(H[which(vars==var),])))>1) {
          logging(LogPath,FILE,"Phase 1","Step 7: NA Value DETECTED","ERROR")  
          NAIndexes=which(is.na(H[which(vars==var),]))
          if (NAIndexes>1) H[which(vars==var),NAIndexes]=H[which(vars==var),NAIndexes-1]
          else H[which(vars==var),1]=H[which(vars==var),2]
          logging(LogPath,FILE,"Phase 1","Step 7: NA Value CORRECTED","REPLACED")
        }  
      }
      strHFile=paste(LogPath,"H.Values.",FILE)
      strHFile=str_replace_all(strHFile,fixed(" "),"")
      print(strHFile)
      HFile<-file(strHFile,"a")
      logging(LogPath,FILE,"Phase 1","Step 8: Writting H values","Started")      
      for( var in vars)
      {
        # ORIGINAL: for( h in 1:numHs)
        for( h in 1:HReal[which(vars==var)])
        {
          strLine=paste(toString(var),",",toString(H[which(vars==var),h]))
          strLine=str_replace_all(strLine,fixed(" "),"")
          write(strLine,HFile)
        }
      }
      close(HFile)
      
     logging(LogPath,FILE,"Phase 1","Step 8: Writting H values","Finished")
     logging(LogPath,FILE,"Phase 1","END  ","Parameters READY")
     logging(LogPath,FILE,"Phase 2","Discretization Policy Calculation ","STARTED")
     for(var in vars)
      {
        bestACC=0
        for(repetition in 1:10) {
          folds=5
          classData = data[,classPos]
          classOne  = which(classData==-1)
          classTwo  = which(classData== 1)
          df=CreateStratifiedCrossFolds(classOne,classTwo,folds)
          for(i in 1:folds) {

            TRAIN_DF        = data[-df$InstanceId[df$Fold==i],var]
            CLASS_DATA      = data[-df$InstanceId[df$Fold==i],classPos]
            
            temp            = cbind(TRAIN_DF,CLASS_DATA)
            temp_class      = as.numeric(levels(CLASS_DATA))[CLASS_DATA]
            
            X_PLUS     = temp[temp_class== 1,1]
            X_MINUS    = temp[temp_class==-1,1]
            X          = temp[,1]
            Y          = temp_class           
            
            TEST_DF         = data[df$InstanceId[df$Fold==i],var]
            CLASS_DATA_TEST = data[df$InstanceId[df$Fold==i],classPos]

            temp_test       = cbind(TEST_DF,CLASS_DATA_TEST)
            temp_class_test = as.numeric(levels(CLASS_DATA_TEST))[CLASS_DATA_TEST]
            X_TEST          = temp_test[,1]
            Y_TEST          = temp_class_test

            NI_PLUS    = length(X_PLUS )
            NI_MINUS   = length(X_MINUS)

            for(h in 1:HReal[which(vars==var)])
            {
              kernel_samples       = 2^(floor(log2(10.1*TrainNumInstances)))
              kernel_samples       = max(kernel_samples,4096)

              h_plus     = H[which(vars==var),h]
              fraction   = NI_PLUS/NI_MINUS
              h_minus    = (fraction^Exponent)*h_plus

              logging(LogPath,FILE,"Phase 2",paste("<",toString(var),",",toString(repetition),",",toString(i),",",toString(h),">","NI_PLUS  ")  ,toString(NI_PLUS))
              logging(LogPath,FILE,"Phase 2",paste("<",toString(var),",",toString(repetition),",",toString(i),",",toString(h),">","NI_MINUS  ") ,toString(NI_MINUS))
              logging(LogPath,FILE,"Phase 2",paste("<",toString(var),",",toString(repetition),",",toString(i),",",toString(h),">","h_plus  ")   ,toString(h_plus))
              logging(LogPath,FILE,"Phase 2",paste("<",toString(var),",",toString(repetition),",",toString(i),",",toString(h),">","fraction  ") ,toString(fraction))
              logging(LogPath,FILE,"Phase 2",paste("<",toString(var),",",toString(repetition),",",toString(i),",",toString(h),">","h_minus  ")  ,toString(h_minus))              
              
              min_X=min(X_PLUS,X_MINUS)
              max_X=max(X_PLUS,X_MINUS)

              df2 <- K2_density(X_PLUS,X_MINUS,NI_PLUS,NI_MINUS,h_plus,h_minus,min_X,max_X)
              df2.filtered <- K2_ZeroFiltering(c(X_PLUS,X_MINUS),df2,min_X,max_X)
              tmp1=df2.filtered$df.sol.1[which(df2.filtered$df.num.solutions>0)]
              tmp2=df2.filtered$df.sol.2[which(df2.filtered$df.num.solutions>0)]
              tmp11=tmp1[which(is.na(tmp1)==FALSE)]
              tmp21=tmp2[which(is.na(tmp2)==FALSE)]
              ZEROS=sort(c(tmp1,tmp2))
              numZeros=length(ZEROS)

              if (numZeros>0) {
                ## TRAIN DISCRETIZATION
                DX.TRAIN = discretize(X,ZEROS)
                Levels.Temp = seq(from=1,to=numZeros+1)
                Length.Train.Temp = length(DX.TRAIN)
                
                auxVar.Train.Temp                                                       = seq(from=1,to=(Length.Train.Temp+numZeros+1))
                auxVar.Train.Temp[1:Length.Train.Temp]                                  = DX.TRAIN
                auxVar.Train.Temp[(Length.Train.Temp+1):(Length.Train.Temp+numZeros+1)] = Levels.Temp
                auxVar.Train.Temp                                                       = factor(auxVar.Train.Temp,labels=Levels.Temp)
                
                DX.TRAIN = auxVar.Train.Temp[1:Length.Train.Temp]
                ## TEST DISCRETIZATION
                DX.TEST = discretize(X_TEST,ZEROS)
                
                Length.Test.Temp=length(DX.TEST)
                
                auxVar.Test.Temp                                                        = seq(from=1,to=(Length.Test.Temp+numZeros+1))
                auxVar.Test.Temp[1:Length.Test.Temp]                                    = DX.TEST
                auxVar.Test.Temp[(Length.Test.Temp+1):(Length.Test.Temp+numZeros+1)]    = Levels.Temp
                auxVar.Test.Temp                                                        = factor(auxVar.Test.Temp,labels=Levels.Temp)   
                
                DX.TEST=auxVar.Test.Temp[1:Length.Test.Temp]

                Y      = factor(Y     ,levels=c(-1,1))
                Y_TEST = factor(Y_TEST,levels=c(-1,1))
                
                DF.DX.TRAIN=data.frame(DX.TRAIN)
                names(DF.DX.TRAIN)=c("X")
                DF.DX.TEST = data.frame(DX.TEST)
                names(DF.DX.TEST)=c("X")

                train_control <- trainControl(method="none")                
                grid <- data.frame(.fL=c(1), .usekernel=c(FALSE), .adjust="none")
                NB=train(data.frame(DF.DX.TRAIN),Y,method='nb',trControl=train_control,tuneGrid = grid)
                print(prop.table(table(predict(NB$finalModel,DF.DX.TEST)$class,Y_TEST)))
                
                PRED<-predict(NB$finalModel,DF.DX.TEST,type="prob")
                pred <- ROCR::prediction(c(PRED$posterior[,2]), c(Y_TEST))
                perf <- ROCR::performance(pred,"auc")
                ACC.Temp<-perf@y.values[[1]]
              } else {
                ACC.Temp=0
              }
              logging(LogPath,FILE,"Phase 2",paste("<",toString(var),",",toString(repetition),",",toString(i),",",toString(h),">","ACC[var,h] "),toString(ACC.Temp))
              logging(LogPath,FILE,"Phase 2",paste("<",toString(var),",",toString(repetition),",",toString(i),",",toString(h),">","Zeros  ") ,toString(ZEROS))
              logging(LogPath,FILE,"Phase 2",paste("<",toString(var),",",toString(repetition),",",toString(i),",",toString(h),">","Num zeros ") ,toString(numZeros))   
              print(bestACC)
              print(ACC.Temp)
              if (bestACC < ACC.Temp) {
                bestACC=ACC.Temp
                DP[[which(vars==var)]]=ZEROS
                Best.ACC[which(vars==var)]=ACC.Temp
                print(paste("Best ACC:",toString(bestACC)))
                logging(LogPath,FILE,"Phase 2",paste("<",toString(var),",",toString(repetition),",",toString(i),",",toString(h),">","Best Policy          "),toString(DP[[which(vars==var)]]))
                logging(LogPath,FILE,"Phase 2",paste("<",toString(var),",",toString(repetition),",",toString(i),",",toString(h),">","Best Policy (Metric) "),toString(bestACC))
                logging(LogPath,FILE,"Phase 2",paste("<",toString(var),",",toString(repetition),",",toString(i),",",toString(h),">","Best Policy (H +   ) "),toString(h_plus))
                logging(LogPath,FILE,"Phase 2",paste("<",toString(var),",",toString(repetition),",",toString(i),",",toString(h),">","Best Policy (H -   ) "),toString(h_minus))                
              }
              ACC[which(vars==var),h]=ACC.Temp
            }
            if (!(sd(ACC[which(vars==var),])!=0)) {
              logging(LogPath,FILE,"Phase 2",paste("<",toString(var),",",toString(repetition),",",toString(i),",",toString(h),">","Variable NOT USEFUL "),"TRUE")    
            }
            logging(LogPath,FILE,"Phase 2",paste("<",toString(var),",",toString(repetition),",",toString(i),",",toString(h),">","H Iteration"),"TRUE")
          }
        }
      }
      ## END-01 Fin
      ## Phase 2>> Resultados: Conjunto de politicas de discretizacion
     logging(LogPath,FILE,"Phase 2","Discretization Policy Calculation ","FINISHED")     
      ##  Discretizacion del TRAIN - LOG
      ##  Discretizacion del TEST - LOG
      for(var in vars)
      {
        CLASS_DATA = data[,classPos]
        X          = data[,var]
        X_Zeros    = DP[[which(vars==var)]]
        X_TEST     = dataTest[,var]
        numZeros   = length(X_Zeros)
        if (numZeros>0) {
          print(numZeros)
          DX = discretize(X,X_Zeros)
          myLevels=seq(from=1,to=numZeros+1)
          myLength=length(DX)
          auxVar=seq(from=1,to=(myLength+numZeros+1))
          auxVar[1:myLength]=DX
          auxVar[(myLength+1):(myLength+numZeros+1)]=myLevels
          auxVar=factor(auxVar,labels=myLevels)
          dataDISCRETIZED[,var]=auxVar[1:myLength]   
          
          logging(LogPath,FILE,"Phase 3",paste("[",toString(var),"]","TRAIN Variable AUC         "),toString(Best.ACC[which(vars==var)]))          
          logging(LogPath,FILE,"Phase 3",paste("[",toString(var),"]","TRAIN Variable Policy      "),toString(X_Zeros))
          logging(LogPath,FILE,"Phase 3",paste("[",toString(var),"]","TRAIN Variable Original    "),toString(X))
          logging(LogPath,FILE,"Phase 3",paste("[",toString(var),"]","TRAIN Variable Discretized "),toString(dataDISCRETIZED[,var]))              
          
          DX_TEST = discretize(X_TEST,X_Zeros)
          myLevels=seq(from=1,to=numZeros+1)
          myLength=length(DX_TEST)
          auxVar=seq(from=1,to=(myLength+numZeros+1))
          auxVar[1:myLength]=DX_TEST
          auxVar[(myLength+1):(myLength+numZeros+1)]=myLevels
          auxVar=factor(auxVar,labels=myLevels)   
          dataTestDISCRETIZED[,var]=auxVar[1:myLength]

          logging(LogPath,FILE,"Phase 3",paste("[",toString(var),"]","TEST  Variable Original    "),toString(X_TEST))
          logging(LogPath,FILE,"Phase 3",paste("[",toString(var),"]","TEST  Variable Discretized "),toString(dataTestDISCRETIZED[,var]))                        
        }
      }
      logging(LogPath,FILE,"Phase 3","Discretizing Database ","FINISHED")
      
      ## Phase 3>> Resultados: BBDD (Variables seleccionadas) disccretizada.
      ##
      ## Phase 4>> Aprendizaje del NB
      ##
      CLASS_DATA      = data[,classPos]
      temp            = cbind(data[,var],CLASS_DATA)
      temp_class      = as.numeric(levels(CLASS_DATA))[CLASS_DATA] 
      Y               = temp_class      
      
      CLASS_DATA_TEST = dataTest[,classPos]
      temp_class      = as.numeric(levels(CLASS_DATA_TEST))[CLASS_DATA_TEST] 
      Y_Test          = temp_class
      
      dataDISCRETIZED     [,classPos] = factor(Y,levels=c(-1,1))
      dataTestDISCRETIZED [,classPos] = factor(Y_Test,levels=c(-1,1))
      
      TRAIN_X_DISCRETIZED = dataDISCRETIZED[,-classPos]
      TRAIN_Y_DISCRETIZED = dataDISCRETIZED[, classPos]
      
      TEST_X_DISCRETIZED = dataTestDISCRETIZED[,-classPos]
      TEST_Y_DISCRETIZED = dataTestDISCRETIZED[, classPos]
      
      ## Generar los ARFFs
      TRD<-data.frame(TRAIN_X_DISCRETIZED,TRAIN_Y_DISCRETIZED)
      write.arff(TRD,paste(TrainDFile,".K",toString(ACC_METHOD),".NEW.DISCRETIZED.arff",sep="")) 
      TSD<-data.frame(TEST_X_DISCRETIZED,TEST_Y_DISCRETIZED)
      colnames(TSD)<-colnames(TRD)
      write.arff(TSD,paste(TestDFile,".K",toString(ACC_METHOD),".NEW.DISCRETIZED.arff",sep=""))  