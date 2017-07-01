#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/04.Pima.Indian.Diabetes/config/Database.04.08.csv ../../bbdd/04.Pima.Indian.Diabetes/03.Final.SCV/8/ ../../experiments/04.Pima.Indian.Diabetes/results.08/08/	../../experiments/04.Pima.Indian.Diabetes/results.08/08/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000378.sh
echo "Cluster Execution: finished"
