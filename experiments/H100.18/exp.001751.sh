#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/18.Badges/config/Database.18.01.csv ../../bbdd/18.Badges/03.Final.SCV/6/ ../../experiments/18.Badges/results.06/01/	../../experiments/18.Badges/results.06/01/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.001751.sh
echo "Cluster Execution: finished"
