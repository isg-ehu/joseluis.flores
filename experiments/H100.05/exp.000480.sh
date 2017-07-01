#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/05.Haberman.Survival/config/Database.05.10.csv ../../bbdd/05.Haberman.Survival/03.Final.SCV/8/ ../../experiments/05.Haberman.Survival/results.08/10/	../../experiments/05.Haberman.Survival/results.08/10/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000480.sh
echo "Cluster Execution: finished"
