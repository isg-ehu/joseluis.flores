#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/04.Pima.Indian.Diabetes/config/Database.04.05.csv ../../bbdd/04.Pima.Indian.Diabetes/03.Final.SCV/10/ ../../experiments/04.Pima.Indian.Diabetes/results.10/05/	../../experiments/04.Pima.Indian.Diabetes/results.10/05/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000395.sh
echo "Cluster Execution: finished"
