#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/25.Leukemia.Haslinger/config/Database.25.07.csv ../../bbdd/25.Leukemia.Haslinger/03.Final.SCV/5/ ../../experiments/25.Leukemia.Haslinger/results.05/07/	../../experiments/25.Leukemia.Haslinger/results.05/07/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.002447.sh
echo "Cluster Execution: finished"
