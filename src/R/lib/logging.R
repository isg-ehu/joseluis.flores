logging<-function(PATH,FILE,Task,Message,Status)
{
  FQFN=paste(PATH,FILE)
  FQFN<-str_replace_all(FQFN,fixed(" "),"")
  LogFile<-file(FQFN,"a")
  strDate=paste(format(Sys.Date(),"%y/%m/%d"),"-",format(Sys.time(), "%X"))
  strDate<-str_replace_all(strDate,fixed(" "),"")
  strLine=paste(strDate,"|",Task,"|",Message,"|",Status)
  write(strLine,LogFile)
  close(LogFile)  
}