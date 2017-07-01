#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/17.Parkinsons/config/Database.17.06.csv ../../bbdd/17.Parkinsons/03.Final.SCV/1/ ../../experiments/17.Parkinsons/results.01/06/	../../experiments/17.Parkinsons/results.01/06/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.001606.sh
echo "Cluster Execution: finished"
