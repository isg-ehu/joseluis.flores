## Incluir Librerias
library(RWeka)
library(caret)
library(stringr)
library(discretization)

## Incluir Funciones
source("R/logging.R")
source("R/discretize.R")

DATE=format(Sys.Date(),"%y/%m/%d")
TIME=format(Sys.time(), "%X")

FILE=paste(DATE,",",TIME,".log")
FILE<-str_replace_all(FILE,fixed(","),"")
FILE<-str_replace_all(FILE,fixed("  "),".")
FILE<-str_replace_all(FILE,fixed("/"),".")
FILE<-str_replace_all(FILE,fixed(":"),".")
FILE<-str_replace_all(FILE,fixed(" "),"")

## Phase 1>> Inicializacion del RUN
## -----------------------------------------------------------
## Step 1. Cargar Run File, el formato sera la fecha.
RunFile           = "Full.Database.06.csv"
RUNINFO           = read.csv(RunFile)
DataPath          = RUNINFO[,1]
TrainFiles        = unique(RUNINFO[,2])
TrainFiles        = paste(DataPath,TrainFiles)
TrainFiles        = str_replace_all(TrainFiles,fixed(" "),"") 
TrainFiles        = unlist(str_split(TrainFiles,","))
TrainFiles        = unique(TrainFiles)

TestFiles         = unique(RUNINFO[,3])
TestFiles         = paste(DataPath,TestFiles)
TestFiles         = str_replace_all(TestFiles,fixed(" "),"") 
TestFiles         = unlist(str_split(TestFiles,","))
TestFiles         = unique(TestFiles)

vars              = unique(RUNINFO[ ,4])
classPos          = RUNINFO[1,5]
LogPath           = RUNINFO[1,6]

FILE_RESULTS=paste("Ameva.Results.",DATE,",",TIME,".csv")
FILE_RESULTS<-str_replace_all(FILE_RESULTS,fixed(","),"")
FILE_RESULTS<-str_replace_all(FILE_RESULTS,fixed("  "),".")
FILE_RESULTS<-str_replace_all(FILE_RESULTS,fixed("/"),".")
FILE_RESULTS<-str_replace_all(FILE_RESULTS,fixed(":"),".")
FILE_RESULTS<-paste(LogPath,FILE_RESULTS)
FILE_RESULTS<-str_replace_all(FILE_RESULTS,fixed(" "),"")
logging(LogPath,FILE,"Phase 1","BEGIN","Parameter initialization")
logging(LogPath,FILE,"Phase 1","Step 1: Log File",FILE)
logging(LogPath,FILE,"Phase 1","Step 1: Results File",FILE_RESULTS)

## Step 2. Imprimir resumen del Run. - LOG
logging(LogPath,FILE,"Phase 1","Step 2: Data folder",unique(DataPath))
logging(LogPath,FILE,"Phase 1","Step 2: Variable vector",toString(vars))
logging(LogPath,FILE,"Phase 1","Step 2: Class position",toString(classPos))

# Step 3. Creacion de variables globales - LOG
DM       = "Ameva"
numFILES = length(TrainFiles)
DATA     = array(dim=c(numFILES,10))
RESULTS  = data.frame(DATA)
colnames(RESULTS)=c("Date","Time","Algorithm","TrainDatabase","TestDatabase","TruePositive","TrueNegative","FalsePositive","FalseNegative","Accuracy")

for(file in 1:length(TrainFiles))
{
  db                = read.arff(TrainFiles[file])
  data              = db[]
  data[is.na(data)] = 0
  dataDISCRETIZED   = data
  TrainNumInstances = length(data[,1])
  TrainNumVariables = length(data[1,])
  CLASS_DATA        = data[,classPos]
  temp_class        = as.numeric(levels(CLASS_DATA))[CLASS_DATA] 
  Y                 = temp_class
  
  logging(LogPath,FILE,"Phase 2","Step 1: Train File",TrainFiles[file])
  logging(LogPath,FILE,"Phase 2","Step 2: Train File Instances",toString(TrainNumInstances))
  logging(LogPath,FILE,"Phase 2","Step 3: Train File Instances",toString(TrainNumVariables))
  
  dbTest            = read.arff(TestFiles[file])
  dataTest          = dbTest[]
  dataTest[is.na(dataTest)] = 0
  dataTestDISCRETIZED = dataTest
  TestNumInstances = length(dataTest[,1])
  TestNumVariables = length(dataTest[1,])
  CLASS_DATA_TEST = dataTest[,classPos]
  temp_class      = as.numeric(levels(CLASS_DATA_TEST))[CLASS_DATA_TEST] 
  Y_Test          = temp_class  
  logging(LogPath,FILE,"Phase 2","Step 4: Test File",TestFiles[file])
  logging(LogPath,FILE,"Phase 2","Step 5: Test File Instances",toString(TestNumInstances))
  logging(LogPath,FILE,"Phase 2","Step 6: Test File Instances",toString(TestNumVariables))

  ## Discretization method 1: Ameva
  discretization=disc.Topdown(data[c(vars,classPos)],method=3)  
  cp_list=discretization$cutp
  dataDISCRETIZED[c(vars,classPos)]=discretization$Disc.data
  
  tmpVars=rep(0,length.out=length(vars))
  i=1
  RESULTS$Discretizable[file]="Yes"
  NonDiscretizable=""
  Intervals=""
  for(var in vars)
  {
    ZEROS=cp_list[[i]]
    if (length(ZEROS)>0 & is.numeric(ZEROS)) {
      dataTestDISCRETIZED[,var]=discretize(dataTest[,var],ZEROS)
      

      myLevels=seq(from=1,to=length(ZEROS)+1)
      myLength=length(dataTestDISCRETIZED[,var])
      auxVar=seq(from=1,to=(myLength+length(ZEROS)+1))
      auxVar[1:myLength]=dataTestDISCRETIZED[,var]
      auxVar[(myLength+1):(myLength+length(ZEROS)+1)]=myLevels
      auxVar=factor(auxVar,labels=myLevels)
      dataTestDISCRETIZED[,var]=auxVar[1:myLength]

      myLength=length(dataDISCRETIZED[,var])
      auxVar=seq(from=1,to=(myLength+length(ZEROS)+1))
      auxVar[1:myLength]=dataDISCRETIZED[,var]
      auxVar[(myLength+1):(myLength+length(ZEROS)+1)]=myLevels
      auxVar=factor(auxVar,labels=myLevels)
      dataDISCRETIZED[,var]=auxVar[1:myLength]
      Intervals=paste(Intervals,toString(length(ZEROS)+1))
      
      logging(LogPath,FILE,"Phase 2",paste("Step 9: Ameva Valid Variable"),toString(var))
    } else {
      tmpVars[var]=var
      print("CRACK")
    }
    i=i+1
    logging(LogPath,FILE,"Phase 2",paste("Step 9: Ameva Discretization Sequence", toString(var)),toString(ZEROS))
  }
  RESULTS$Intervals[file]=Intervals
  RESULTS$NonDiscretizableVars[file]=NonDiscretizable  
  dataDISCRETIZED     [,classPos] = factor(Y,levels=c(-1,1))
  dataTestDISCRETIZED [,classPos] = factor(Y_Test,levels=c(-1,1))
  
  TRAIN_X_DISCRETIZED = dataDISCRETIZED    [,-classPos]
  TRAIN_Y_DISCRETIZED = dataDISCRETIZED    [, classPos]

  TEST_X_DISCRETIZED  = dataTestDISCRETIZED[,-classPos]
  TEST_Y_DISCRETIZED  = dataTestDISCRETIZED[,classPos]
  
  ## Generar los ARFFs
  TRD<-data.frame(TRAIN_X_DISCRETIZED,TRAIN_Y_DISCRETIZED)
  write.arff(TRD,paste(TrainFiles[file],".AMEVA.NEW.DISCRETIZED.arff",sep="")) 
  TSD<-data.frame(TEST_X_DISCRETIZED,TEST_Y_DISCRETIZED)
  colnames(TSD)<-colnames(TRD)
  write.arff(TSD,paste(TestFiles[file],".AMEVA.NEW.DISCRETIZED.arff",sep=""))    
  
  NB=train(TRAIN_X_DISCRETIZED,TRAIN_Y_DISCRETIZED,'nb',trControl=trainControl(method="none"),tuneGrid=data.frame(.fL=1, .usekernel=FALSE, .adjust="none"))
  CMTest<-table(predict(NB$finalModel,TEST_X_DISCRETIZED)$class,TEST_Y_DISCRETIZED)
  RESULTS$Date         [file]=DATE
  RESULTS$Time         [file]=TIME
  RESULTS$Algorithm    [file]=DM
  RESULTS$TrainDatabase[file]=TrainFiles[file]
  RESULTS$TestDatabase [file]=TestFiles[file]
  RESULTS$TruePositive [file]=CMTest[1]
  RESULTS$TrueNegative [file]=CMTest[4]
  RESULTS$FalsePositive[file]=CMTest[2]
  RESULTS$FalseNegative[file]=CMTest[3]
  RESULTS$Accuracy     [file]=100*(CMTest[1]+CMTest[4])/(CMTest[1]+CMTest[2]+CMTest[3]+CMTest[4])
}
write.csv(RESULTS,file=FILE_RESULTS)