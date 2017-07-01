#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/08.Sonar.Mines.vs.Rocks/config/Database.08.02.csv ../../bbdd/08.Sonar.Mines.vs.Rocks/03.Final.SCV/4/ ../../experiments/08.Sonar.Mines.vs.Rocks/results.04/02/	../../experiments/08.Sonar.Mines.vs.Rocks/results.04/02/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000732.sh
echo "Cluster Execution: finished"
