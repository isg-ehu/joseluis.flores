#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/24.Heart.Desease.Hungarian/config/Database.24.05.csv ../../bbdd/24.Heart.Desease.Hungarian/03.Final.SCV/1/ ../../experiments/24.Heart.Desease.Hungarian/results.01/05/	../../experiments/24.Heart.Desease.Hungarian/results.01/05/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.002305.sh
echo "Cluster Execution: finished"
