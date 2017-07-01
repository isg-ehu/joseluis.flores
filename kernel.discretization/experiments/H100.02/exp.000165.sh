#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/02.Credit.Aproval/config/Database.02.05.csv ../../bbdd/02.Credit.Aproval/03.Final.SCV/7/ ../../experiments/02.Credit.Aproval/results.07/05/	../../experiments/02.Credit.Aproval/results.07/05/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000165.sh
echo "Cluster Execution: finished"
