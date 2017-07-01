#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/02.Credit.Aproval/config/Database.02.08.csv ../../bbdd/02.Credit.Aproval/03.Final.SCV/9/ ../../experiments/02.Credit.Aproval/results.09/08/	../../experiments/02.Credit.Aproval/results.09/08/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000188.sh
echo "Cluster Execution: finished"
