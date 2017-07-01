#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/16.Musk1/config/Database.16.04.csv ../../bbdd/16.Musk1/03.Final.SCV/10/ ../../experiments/16.Musk1/results.10/04/	../../experiments/16.Musk1/results.10/04/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.001594.sh
echo "Cluster Execution: finished"
