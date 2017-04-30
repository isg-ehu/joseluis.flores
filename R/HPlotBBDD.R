library(RWeka)

##########################################################################################
### Name  : HPlotBBDD
### Input : strFile  - Nombre del fichero con la base de datos.
###         varList  - Lista de los indices de las variables a plotear.
###         numHs    - Numero de valores de h requeridos.
### Output: Graficos con las evoluciones de h para las variables indicadas en la lista.
##########################################################################################
HPlotBBDD<-function(strFile,varList,numHs)
{
	dbtrain=read.arff(strFile)
	for(i in varList)
	{
		X = dbtrain[,i]
		HFunList=HFun(X,numHs)
		HPlotFun(HFunList$X1,HFunList$Y1,HFunList$X2,HFunList$Y2,HFunList$X3,HFunList$Y3)
	}
}