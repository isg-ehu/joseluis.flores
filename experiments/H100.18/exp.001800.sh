#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/18.Badges/config/Database.18.10.csv ../../bbdd/18.Badges/03.Final.SCV/10/ ../../experiments/18.Badges/results.10/10/	../../experiments/18.Badges/results.10/10/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.001800.sh
echo "Cluster Execution: finished"
