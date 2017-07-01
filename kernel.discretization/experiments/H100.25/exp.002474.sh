#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/25.Leukemia.Haslinger/config/Database.25.04.csv ../../bbdd/25.Leukemia.Haslinger/03.Final.SCV/8/ ../../experiments/25.Leukemia.Haslinger/results.08/04/	../../experiments/25.Leukemia.Haslinger/results.08/04/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.002474.sh
echo "Cluster Execution: finished"
