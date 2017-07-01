acc<-function(varData,class,zeros,NI_PLUS,NI_MINUS)
{
  acc<-0
  varDataSorted=varData[sort(varData,index.return=TRUE)$ix]
  varClassSorted=class[sort(varData,index.return=TRUE)$ix]
  size=length(zeros)+1
  interval_list=matrix(nrow=size,ncol=2)
  interval_list[1,1]=varDataSorted[1]
  interval_list[1,2]=zeros[1]
  if ( size<= 2 ) {
    interval_list[2,1]=zeros[1]
    interval_list[2,2]=varDataSorted[length(varDataSorted)]   
  } else {
    for( row in 2:(size-1)) {
      interval_list[row,1]=interval_list[row-1,2]
      interval_list[row,2]=zeros[row]
    }
    interval_list[size,1]=interval_list[size-1,2]
    interval_list[size,2]=varDataSorted[length(varDataSorted)]    
  }
  for( interval in 1:size) {
    N_PLUS_i  = 0
    N_MINUS_i = 0
    Interval_Value = 0
    for( x in 1:length(varDataSorted)) {
      LimInf=interval_list[interval,1]
      LimSup=interval_list[interval,2]
      Point=varDataSorted [x] ## Se obtiene la muestra ordenada
      Class=varClassSorted[x] ## 
      if ( Point  >= LimInf && Point < LimSup && Class ==  1) N_PLUS_i  = N_PLUS_i  + 1
      if ( Point  >= LimInf && Point < LimSup && Class == -1) N_MINUS_i = N_MINUS_i + 1      
    }
    if (N_PLUS_i/NI_PLUS>N_MINUS_i/NI_MINUS) {
      Interval_Value=N_MINUS_i/NI_MINUS
    } else {
        Interval_Value=N_PLUS_i/NI_PLUS
    }
    acc=acc+Interval_Value
    #print(paste("Interval",toString(interval),"LimInf:",toString(LimInf),"LimSup:",toString(LimSup),"N+:",toString(NI_PLUS),"N-:",toString(NI_MINUS),"Ni+:",toString(N_PLUS_i),"Ni-:",toString(N_MINUS_i),"Value:",Interval_Value))
  }
  #print(paste("Total => ",toString(acc)))
  return(acc)
}