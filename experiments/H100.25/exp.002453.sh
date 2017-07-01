#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/25.Leukemia.Haslinger/config/Database.25.03.csv ../../bbdd/25.Leukemia.Haslinger/03.Final.SCV/6/ ../../experiments/25.Leukemia.Haslinger/results.06/03/	../../experiments/25.Leukemia.Haslinger/results.06/03/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.002453.sh
echo "Cluster Execution: finished"
