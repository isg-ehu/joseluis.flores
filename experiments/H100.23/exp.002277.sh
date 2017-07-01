#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/23.Cylinder.Bands/config/Database.23.07.csv ../../bbdd/23.Cylinder.Bands/03.Final.SCV/8/ ../../experiments/23.Cylinder.Bands/results.08/07/	../../experiments/23.Cylinder.Bands/results.08/07/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.002277.sh
echo "Cluster Execution: finished"
