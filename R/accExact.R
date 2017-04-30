accExact<-function(varData,class,zeros,x,PLUS_Y,MINUS_Y)
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
  print("ACC Exact: N")
  print(length(varData))
  
  PLUS_AREA  = 0
  MINUS_AREA = 0
  for( interval in 1:size) {
    LimInf=interval_list[interval,1]
    LimSup=interval_list[interval,2]  
  	idxs = which(x>=LimInf & x<LimSup)  

    if ( length(idxs)>2 ) {
	  	PLUS_AREA  = ISGIntegral(x[idxs],PLUS_Y [idxs])
    	MINUS_AREA = ISGIntegral(x[idxs],MINUS_Y[idxs])
    
	    print("Interval: BEGIN.")
	    print(interval)
	    print(PLUS_AREA)
    	print(MINUS_AREA)
    	
    	acc=acc + abs(PLUS_AREA-MINUS_AREA) 
    	
    	print(abs(PLUS_AREA-MINUS_AREA))
    	print("Interval: END  .")
    }
  }
  acc=acc/2
  print(acc)
  return(acc)
}