#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/02.Credit.Aproval/config/Database.02.10.csv ../../bbdd/02.Credit.Aproval/03.Final.SCV/8/ ../../experiments/02.Credit.Aproval/results.08/10/	../../experiments/02.Credit.Aproval/results.08/10/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000180.sh
echo "Cluster Execution: finished"
