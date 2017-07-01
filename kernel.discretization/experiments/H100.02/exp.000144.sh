#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/02.Credit.Aproval/config/Database.02.04.csv ../../bbdd/02.Credit.Aproval/03.Final.SCV/5/ ../../experiments/02.Credit.Aproval/results.05/04/	../../experiments/02.Credit.Aproval/results.05/04/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000144.sh
echo "Cluster Execution: finished"
