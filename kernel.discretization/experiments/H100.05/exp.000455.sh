#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/05.Haberman.Survival/config/Database.05.05.csv ../../bbdd/05.Haberman.Survival/03.Final.SCV/6/ ../../experiments/05.Haberman.Survival/results.06/05/	../../experiments/05.Haberman.Survival/results.06/05/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000455.sh
echo "Cluster Execution: finished"
