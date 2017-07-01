#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/05.Haberman.Survival/config/Database.05.03.csv ../../bbdd/05.Haberman.Survival/03.Final.SCV/3/ ../../experiments/05.Haberman.Survival/results.03/03/	../../experiments/05.Haberman.Survival/results.03/03/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000423.sh
echo "Cluster Execution: finished"
