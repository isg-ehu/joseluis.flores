#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/19.Glass2/config/Database.19.05.csv ../../bbdd/19.Glass2/03.Final.SCV/10/ ../../experiments/19.Glass2/results.10/05/	../../experiments/19.Glass2/results.10/05/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.001895.sh
echo "Cluster Execution: finished"
