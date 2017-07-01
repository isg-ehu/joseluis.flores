#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/06.Ionosphere/config/Database.06.09.csv ../../bbdd/06.Ionosphere/06.Final.SCV/10/ ../../experiments/06.Ionosphere/results.10/09/	../../experiments/06.Ionosphere/results.10/09/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000599.sh
echo "Cluster Execution: finished"
