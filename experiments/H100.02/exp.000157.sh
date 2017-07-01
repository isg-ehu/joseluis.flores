#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/02.Credit.Aproval/config/Database.02.07.csv ../../bbdd/02.Credit.Aproval/03.Final.SCV/6/ ../../experiments/02.Credit.Aproval/results.06/07/	../../experiments/02.Credit.Aproval/results.06/07/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000157.sh
echo "Cluster Execution: finished"
