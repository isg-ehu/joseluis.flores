#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/22.Mamographic.Mass/config/Database.22.10.csv ../../bbdd/22.Mamographic.Mass/03.Final.SCV/4/ ../../experiments/22.Mamographic.Mass/results.04/10/	../../experiments/22.Mamographic.Mass/results.04/10/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.002140.sh
echo "Cluster Execution: finished"
