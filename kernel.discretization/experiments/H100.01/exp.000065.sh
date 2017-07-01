#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/01.Horse.Colic/config/Database.01.05.csv ../../bbdd/01.Horse.Colic/04.Final.SCV/7/ ../../experiments/01.Horse.Colic/results.07/05/	../../experiments/01.Horse.Colic/results.07/05/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000065.sh
echo "Cluster Execution: finished"
