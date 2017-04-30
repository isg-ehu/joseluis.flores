library(ggplot2)
library(RWeka)
library(gridExtra)
library(stringr)

GenSequence<-function(N)
{
  factor<-100
  sequence<-c()

  sequence=unique(round(runif(factor*N,min=1,max=N)))
  while (length(sequence)<N) sequence=unique(round(runif(factor*N,min=1,max=N)))  
  return(sequence)
}

CreateFolds<-function(N,Folds)
{
  Ni   = trunc(N/Folds)
  Modulus = N-trunc(N/Folds)*Folds
  myFolds<-array(dim=c(Folds,1))
  for(i in 1:Folds) {
    myFolds[i]=Ni
  }
  if (Modulus>0) {
    for(i in 1:Modulus) {
      myFolds[i]=myFolds[i]+1
    }
  }
  return(myFolds)
}

CreateStratifiedCrossFolds<-function(classOne,classTwo,Folds)
{
  if (Folds < 2) return(NULL)
  NOne = length(classOne)
  NTwo = length(classTwo)
  N    = NOne+NTwo
  
  Sequence        = GenSequence(N)
  SeqOne          = GenSequence(NOne)
  SeqTwo          = GenSequence(NTwo)
  myGlobalFolds   = CreateFolds(N,Folds)
  myClassOneFolds = CreateFolds(length(classOne),Folds)
  
  myFolds=array(dim=c(Folds,2))
  for(i in 1:Folds) {
    myFolds[i,1]=myClassOneFolds[i]
    myFolds[i,2]=myGlobalFolds[i]-myClassOneFolds[i]
  }

  ## Rellenar los indices de las instancias
  FoldId=c()
  GlobalClassOne=c()
  GlobalClassTwo=c()
  FoldId  = rep(1,myGlobalFolds[1])
  ClassId = rep(0,myGlobalFolds[1])
  Fold=c()
  IdxSet1_Min=1
  IdxSet1_Max=myFolds[1,1]
  IdxSet2_Min=1
  IdxSet2_Max=myFolds[1,2]
  
  Range1=seq(from=1,to=myFolds[1,1])
  Range2=seq(from=myFolds[1,1]+1,to=myFolds[1,1]+myFolds[1,2])

  CID_Min=IdxSet1_Min
  CID_Max=IdxSet1_Max
  ClassId[CID_Min:CID_Max]=1
  CID_Min=CID_Max+1
  CID_Max=CID_Min+IdxSet2_Max-1
  ClassId[CID_Min:CID_Max]=2

  aux=c(classOne[SeqOne[IdxSet1_Min:IdxSet1_Max]],classTwo[SeqTwo[IdxSet2_Min:IdxSet2_Max]])
  Fold=c(Fold,aux)
  for(i in 2:Folds)
  {
    FoldId=c(FoldId,rep(i,myGlobalFolds[i]))
    
    IdxSet1_Min=IdxSet1_Max+1
    IdxSet1_Max=IdxSet1_Min+myFolds[i,1]-1
    IdxSet2_Min=IdxSet2_Max+1
    IdxSet2_Max=IdxSet2_Min+myFolds[i,2]-1
    
    CID_Min=CID_Max+1
    CID_Max=CID_Min+myFolds[i,1]-1
    ClassId[CID_Min:CID_Max]=1
    CID_Min=CID_Max+1
    CID_Max=CID_Min+myFolds[i,2]-1
    ClassId[CID_Min:CID_Max]=2

    IdxSet1=SeqOne[IdxSet1_Min:IdxSet1_Max]
    IdxSet2=SeqTwo[IdxSet2_Min:IdxSet2_Max]

    aux=c(classOne[IdxSet1],classTwo[IdxSet2])
    Fold=c(Fold,aux)
  }
  FoldFinal=array(dim=c(length(Fold),6))
  for(i in 1:length(Fold)) {
    FoldFinal[i,1]=FoldId[i]
    FoldFinal[i,2]=myGlobalFolds[FoldId[i]]
    FoldFinal[i,3]=myFolds[FoldId[i],1]
    FoldFinal[i,4]=myFolds[FoldId[i],2]
    FoldFinal[i,5]=ClassId[i]
    FoldFinal[i,6]=Fold[i]
  }
  dfFinal=data.frame(FoldFinal)
  names(dfFinal)=c('Fold','N','N1','N2','ClassId','InstanceId')
  return(dfFinal)
}

GenerateARFFStratifiedCV<-function(path,filename,extension,Folds,classPosition)
{
  FILE=paste(path,filename,extension,sep="")
  print(FILE)
  data      = read.arff(FILE)
  classData = data[,classPosition]
  classOne  = which(classData==-1)
  classTwo  = which(classData== 1)
  print(length(classOne))
  print(length(classTwo))
  df=CreateStratifiedCrossFolds(classOne,classTwo,Folds)
  print("=> Stratification created.")
  dimFoldsTrain=rep(0,length.out=Folds)
  dimFoldsTest =rep(0,length.out=Folds)
  for(i in 1:Folds) {
    if (i<10) {
      FileId=paste("0",toString(i))
    } else {
      FileId=paste(toString(10))
    }
    TRAIN=paste(path,filename,".",FileId,".train",extension)
    TRAIN<-str_replace_all(TRAIN,fixed(" "),"")
    TRAIN_DF=data[-df$InstanceId[df$Fold==i],]
    write.arff(TRAIN_DF,TRAIN)
    print(TRAIN)
    dataTRAIN=read.arff(TRAIN)
    dimFoldsTrain[i]=length(dataTRAIN[,1])
    print(dimFoldsTrain[i])

    TEST=paste(path,filename,".",FileId,".test",extension)
    TEST<-str_replace_all(TEST,fixed(" "),"")
    TEST_DF=data[df$InstanceId[df$Fold==i],]
    write.arff(TEST_DF,TEST)
    print(TEST)
    dataTEST=read.arff(TEST)
    dimFoldsTest[i]=length(dataTEST[,1])
    print(dimFoldsTest[i])
  }
  print(dimFoldsTrain)
  print(dimFoldsTest)
  return(df)
}

PlotSCV<-function(dataframe)
{
    NumFolds = unique(dataframe$Fold)
    NFolds   = length(NumFolds)
    DBSize   = length(dataframe$InstanceId)
    FoldId   = rep(0,length.out=NFolds*2)
    Type     = rep(0,length.out=NFolds*2)
    N        = rep(0,length.out=NFolds*2)
    Train    = rep(0,length.out=NFolds)
    Test     = rep(0,length.out=NFolds)
    for(i in NumFolds)
    {
      ExclusionFold = length(dataframe$InstanceId[dataframe$Fold==i])
      Train[i]=DBSize-ExclusionFold
      Test [i]=ExclusionFold
    }
    j=1
    for(i in seq(from=1,to=NFolds*2,by=2)) 
    {
      if (j<10) {
        strFoldId   = paste("Fold-0",toString(j))
        strFoldId   = str_replace_all(strFoldId,fixed(" "),"")  
        FoldId[i]   = strFoldId
        FoldId[i+1] = strFoldId        
      } else {
        strFoldId   = paste("Fold-",toString(j))
        strFoldId   = str_replace_all(strFoldId,fixed(" "),"") 
        FoldId[i]   = strFoldId
        FoldId[i+1] = strFoldId                
      }

      Type[i]     = 'Train'
      Type[i+1]   = 'Test'
      N   [i]     = Train[j]
      N   [i+1]   = Test [j]
      j=j+1
    }
    SCV_DF=data.frame(FoldId,Type,N)
    G<-ggplot(data=SCV_DF,aes(x=FoldId,y=N,fill=Type))+geom_bar(stat="identity",position=position_dodge())+
      geom_text(aes(label=N), position = position_dodge(0.9),vjust=1.3, size=2.5,color="white")+
      labs(title="Stratified Cross Validation")+
      theme_minimal()
    print(G)
    return(SCV_DF)
}