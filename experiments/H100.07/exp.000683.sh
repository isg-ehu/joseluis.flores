#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/07.Bupa.Liver.Disorders/config/Database.07.03.csv ../../bbdd/07.Bupa.Liver.Disorders/03.Final.SCV/9/ ../../experiments/07.Bupa.Liver.Disorders/results.09/03/	../../experiments/07.Bupa.Liver.Disorders/results.09/03/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000683.sh
echo "Cluster Execution: finished"
