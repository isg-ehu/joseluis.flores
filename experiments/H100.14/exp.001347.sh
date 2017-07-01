#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/14.Appendicitis/config/Database.14.07.csv ../../bbdd/14.Appendicitis/03.Final.SCV/5/ ../../experiments/14.Appendicitis/results.05/07/	../../experiments/14.Appendicitis/results.05/07/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.001347.sh
echo "Cluster Execution: finished"
