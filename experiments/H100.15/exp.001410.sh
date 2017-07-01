#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/15.SA.Heart/config/Database.15.10.csv ../../bbdd/15.SA.Heart/03.Final.SCV/1/ ../../experiments/15.SA.Heart/results.01/10/	../../experiments/15.SA.Heart/results.01/10/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.001410.sh
echo "Cluster Execution: finished"
