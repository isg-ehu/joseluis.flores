#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/10.Banknote.Authentication/config/Database.10.04.csv ../../bbdd/10.Banknote.Authentication/03.Final.SCV/9/ ../../experiments/10.Banknote.Authentication/results.09/04/	../../experiments/10.Banknote.Authentication/results.09/04/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000984.sh
echo "Cluster Execution: finished"
