#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/19.Glass2/config/Database.19.10.csv ../../bbdd/19.Glass2/03.Final.SCV/3/ ../../experiments/19.Glass2/results.03/10/	../../experiments/19.Glass2/results.03/10/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.001830.sh
echo "Cluster Execution: finished"
