library(ggplot2)
library(gridExtra)

plotBestDensity<-function(PLUS_density_x,PLUS_density_y,MINUS_density_y,bbdd,varname,var,HInfo)
{
  maxY=max(PLUS_density_y,MINUS_density_y)
  plot(PLUS_density_x,PLUS_density_y,type='l',ylim=c(0,maxY),col='blue',main=paste(TrainFile,"/ Var",var,"-",varname,"=> ",HInfo))
  lines(PLUS_density_x,MINUS_density_y,type='l',col='red')
  grid()
  GX=c(PLUS_density_x,PLUS_density_x)
  GY=c(PLUS_density_y,MINUS_density_y)
  GC=c(rep('+',length.out=length(PLUS_density_x)),rep('-',length.out=length(PLUS_density_x)))
  G=data.frame(GX,GY,GC)
  ggplot(G,aes(x=GX,y=GY,col=GC))+geom_line()+labs(title=paste(TrainFile,"/ Var",var,"-",varname))  
}