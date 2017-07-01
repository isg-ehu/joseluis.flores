#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/22.Mamographic.Mass/config/Database.22.07.csv ../../bbdd/22.Mamographic.Mass/03.Final.SCV/2/ ../../experiments/22.Mamographic.Mass/results.02/07/	../../experiments/22.Mamographic.Mass/results.02/07/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.002117.sh
echo "Cluster Execution: finished"
