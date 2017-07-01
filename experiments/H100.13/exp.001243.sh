#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/13.Planning.Relax/config/Database.13.03.csv ../../bbdd/13.Planning.Relax/03.Final.SCV/5/ ../../experiments/13.Planning.Relax/results.05/03/	../../experiments/13.Planning.Relax/results.05/03/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.001243.sh
echo "Cluster Execution: finished"
