#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/02.Credit.Aproval/config/Database.02.03.csv ../../bbdd/02.Credit.Aproval/03.Final.SCV/1/ ../../experiments/02.Credit.Aproval/results.01/03/	../../experiments/02.Credit.Aproval/results.01/03/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000103.sh
echo "Cluster Execution: finished"
