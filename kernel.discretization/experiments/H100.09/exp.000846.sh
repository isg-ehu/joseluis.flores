#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/09.SPECT.Heart/config/Database.09.06.csv ../../bbdd/09.SPECT.Heart/03.Final.SCV/5/ ../../experiments/09.SPECT.Heart/results.05/06/	../../experiments/09.SPECT.Heart/results.05/06/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.000846.sh
echo "Cluster Execution: finished"
