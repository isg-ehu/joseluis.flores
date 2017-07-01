#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/23.Cylinder.Bands/config/Database.23.06.csv ../../bbdd/23.Cylinder.Bands/03.Final.SCV/3/ ../../experiments/23.Cylinder.Bands/results.03/06/	../../experiments/23.Cylinder.Bands/results.03/06/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.002226.sh
echo "Cluster Execution: finished"
