##########################################################################################
### Name  : aucISG
### Input : Vector VarData, vector c de clases (-1,+1), Num valores PLUS, Num valores MINUS
### Output: Valor AUC propuesto por Aritz.
##########################################################################################
acc_auc<-function(VarData,class,zeros,NI_PLUS,NI_MINUS)
{
  acc<-0
  indexes=sort(VarData,index.return=TRUE)$ix
  VarDataSorted  = VarData [indexes]
  VarClassSorted = class   [indexes]
  size=length(zeros[,1])+1
  
  interval_list=matrix(nrow=size,ncol=2)
  interval_list[1,1]=VarDataSorted[1]
  interval_list[1,2]=zeros[1,1]
  
  if ( size<= 2 ) {
    interval_list[2,1]=zeros[1,1]
    interval_list[2,2]=VarDataSorted[length(VarDataSorted)]   
  } else {
    for( row in 2:(size-1)) {
      interval_list[row,1]=interval_list[row-1,2]
      interval_list[row,2]=zeros[row]
    }
    interval_list[size,1]=interval_list[size-1,2]
    interval_list[size,2]=VarDataSorted[length(VarDataSorted)]    
  }
  acc_PLUS=0
  acc_MINUS=0
  for( interval in 1:size) {
    N_PLUS_i  = 0
    N_MINUS_i = 0
    LimInf=interval_list[interval,1]
    LimSup=interval_list[interval,2]
    
    indexes       = which(VarDataSorted>=LimInf & VarDataSorted<LimSup)
    temp_data     = VarDataSorted [indexes]
    temp_class    = VarClassSorted[indexes]
    temp_NI_PLUS  = length(which(temp_class== 1))
    temp_NI_MINUS = length(which(temp_class==-1))
    relativity    = (temp_NI_PLUS+temp_NI_MINUS)/length(NI_PLUS+NI_MINUS)

    if (length(temp_class) > 0) {
      value=aucISG(temp_data,factor(temp_class),temp_NI_PLUS,temp_NI_MINUS)
      acc=acc+value
      if (temp_NI_PLUS>temp_NI_MINUS) acc_PLUS=acc_PLUS+value
      else acc_MINUS=acc_MINUS+value
    }
  }
  print(paste("ACC +:",toString(acc_PLUS),"ACC -:",toString(acc_MINUS)))
  return(acc)
}