#!/bin/bash
HOST=`hostname`
PC='computer.local'
if [ $HOST = $PC ];
then
	echo "Local Execution: started"
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization/src/R/
	Rscript K3.R ../../experiments/21.Vertebral.Column/config/Database.21.09.csv ../../bbdd/21.Vertebral.Column/03.Final.SCV/5/ ../../experiments/21.Vertebral.Column/results.05/09/	../../experiments/21.Vertebral.Column/results.05/09/ 100 
	cd /Users/JoseLuis/isg-ehu/joseluis.flores/kernel.discretization
	echo "Local Execution: finished"
	exit 0
fi
echo "Cluster Execution: started"
qsub cluster.script.002049.sh
echo "Cluster Execution: finished"
