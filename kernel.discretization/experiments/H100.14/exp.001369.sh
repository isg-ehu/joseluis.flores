#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/14.Appendicitis/config/Database.14.09.csv ../../bbdd/14.Appendicitis/03.Final.SCV/7/ ../../experiments/14.Appendicitis/results.07/09/	../../experiments/14.Appendicitis/results.07/09/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.001369.sh
echo "Cluster Execution: finished"
