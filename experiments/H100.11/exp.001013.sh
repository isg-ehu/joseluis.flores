#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/11.Blood.Transfusion/config/Database.11.03.csv ../../bbdd/11.Blood.Transfusion/04.Final.SCV/2/ ../../experiments/11.Blood.Transfusion/results.02/03/	../../experiments/11.Blood.Transfusion/results.02/03/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.001013.sh
echo "Cluster Execution: finished"
