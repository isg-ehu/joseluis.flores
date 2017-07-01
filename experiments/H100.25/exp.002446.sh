#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/25.Leukemia.Haslinger/config/Database.25.06.csv ../../bbdd/25.Leukemia.Haslinger/03.Final.SCV/5/ ../../experiments/25.Leukemia.Haslinger/results.05/06/	../../experiments/25.Leukemia.Haslinger/results.05/06/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.002446.sh
echo "Cluster Execution: finished"
