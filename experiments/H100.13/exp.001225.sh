#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/13.Planning.Relax/config/Database.13.05.csv ../../bbdd/13.Planning.Relax/03.Final.SCV/3/ ../../experiments/13.Planning.Relax/results.03/05/	../../experiments/13.Planning.Relax/results.03/05/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.001225.sh
echo "Cluster Execution: finished"
