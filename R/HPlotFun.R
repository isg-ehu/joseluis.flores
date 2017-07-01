library(ggplot2)
library(gridExtra)

##########################################################################################
### Name  : HPlotFun
### Input : X1,Y1 Original (X=H de alta resolucion,Y=Nº de puntos del entorno)
###         Y1,X1 Cambio de los ejes
###         X2,Y2 Cambio de escala en X y de proporcion 
###   		 (X2=Y1 escalado a numHs valores)
###    		 (Y2=X1 escalado a [0,1] y numHs valores) 	
### Output: Graficos con las evoluciones de h en todo el proceso.
##########################################################################################
HPlotFun<-function(X1,Y1,X2,Y2,X3,Y3,title)
{
	HDF1=data.frame(X1,Y1)
	HDF2=data.frame(X2,Y2)
	HDF3=data.frame(X3,Y3)	
	g1<-ggplot(HDF1,aes(x=X1,y=Y1))+geom_line(size=0.5)+labs(x="H",y="N. Points")+ggtitle(title)
	g2<-ggplot(HDF2,aes(x=X2,y=Y2))+geom_line(size=0.5)+labs(x="N. Points",y="H")
	g3<-ggplot(HDF3,aes(x=X3,y=Y3))+geom_line(size=0.5)+labs(x="N. Points normalized",y="H")
  G<-grid.arrange( g1, g2, g3, ncol=1)
}