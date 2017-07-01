#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/20.Indian.Liver.Patient/config/Database.20.10.csv ../../bbdd/20.Indian.Liver.Patient/03.Final.SCV/10/ ../../experiments/20.Indian.Liver.Patient/results.10/10/	../../experiments/20.Indian.Liver.Patient/results.10/10/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.002000.sh
echo "Cluster Execution: finished"
