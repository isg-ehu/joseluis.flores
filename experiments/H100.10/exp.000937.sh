#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/10.Banknote.Authentication/config/Database.10.07.csv ../../bbdd/10.Banknote.Authentication/03.Final.SCV/4/ ../../experiments/10.Banknote.Authentication/results.04/07/	../../experiments/10.Banknote.Authentication/results.04/07/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000937.sh
echo "Cluster Execution: finished"
