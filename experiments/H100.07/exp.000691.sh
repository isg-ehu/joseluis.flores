#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/07.Bupa.Liver.Disorders/config/Database.07.01.csv ../../bbdd/07.Bupa.Liver.Disorders/03.Final.SCV/10/ ../../experiments/07.Bupa.Liver.Disorders/results.10/01/	../../experiments/07.Bupa.Liver.Disorders/results.10/01/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000691.sh
echo "Cluster Execution: finished"
