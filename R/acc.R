acc<-function(varData,class,zeros,NI_PLUS,NI_MINUS)
{
  acc<-0
  varDataSorted=varData[sort(varData,index.return=TRUE)$ix]
  varClassSorted=class[sort(varData,index.return=TRUE)$ix]
  size=length(zeros[,1])+1
  interval_list=matrix(nrow=size,ncol=2)
  interval_list[1,1]=varDataSorted[1]
  interval_list[1,2]=zeros[1,1]
  if ( size<= 2 ) {
    interval_list[2,1]=zeros[1,1]
    interval_list[2,2]=varDataSorted[length(varDataSorted)]   
  } else {
    for( row in 2:(size-1)) {
      interval_list[row,1]=interval_list[row-1,2]
      interval_list[row,2]=zeros[row]
    }
    interval_list[size,1]=interval_list[size-1,2]
    interval_list[size,2]=varDataSorted[length(varDataSorted)]    
  }
  # print("ACC: N")
  # print(length(varData))
  for( interval in 1:size) {
    N_PLUS_i  = 0
    N_MINUS_i = 0
    for( x in 1:length(varDataSorted)) {
      LimInf=interval_list[interval,1]
      LimSup=interval_list[interval,2]
      Point=varDataSorted [x]
      Class=varClassSorted[x]
      if ( Point  >= LimInf && Point < LimSup && Class ==  1) N_PLUS_i  = N_PLUS_i  + 1
      if ( Point  >= LimInf && Point < LimSup && Class == -1) N_MINUS_i = N_MINUS_i + 1      
    }
    # print("Interval: BEGIN.")
    # print(interval)
    # print(N_PLUS_i)
    # print(N_MINUS_i)
    acc=acc + abs(N_PLUS_i-N_MINUS_i) 
    # print(abs(N_PLUS_i-N_MINUS_i))
    # print("Interval: END...")
  }
  acc=acc/length(varData)
  # print("->")
  # print(acc)
  return(acc)
}