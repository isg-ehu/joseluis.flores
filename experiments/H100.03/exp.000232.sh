#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/03.German.Credit/config/Database.03.02.csv ../../bbdd/03.German.Credit/03.Final.SCV/4/ ../../experiments/03.German.Credit/results.04/02/	../../experiments/03.German.Credit/results.04/02/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000232.sh
echo "Cluster Execution: finished"
