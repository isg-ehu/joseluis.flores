#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/11.Blood.Transfusion/config/Database.11.04.csv ../../bbdd/11.Blood.Transfusion/04.Final.SCV/7/ ../../experiments/11.Blood.Transfusion/results.07/04/	../../experiments/11.Blood.Transfusion/results.07/04/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.001064.sh
echo "Cluster Execution: finished"
