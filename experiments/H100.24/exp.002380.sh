#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/24.Heart.Desease.Hungarian/config/Database.24.10.csv ../../bbdd/24.Heart.Desease.Hungarian/03.Final.SCV/8/ ../../experiments/24.Heart.Desease.Hungarian/results.08/10/	../../experiments/24.Heart.Desease.Hungarian/results.08/10/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.002380.sh
echo "Cluster Execution: finished"
