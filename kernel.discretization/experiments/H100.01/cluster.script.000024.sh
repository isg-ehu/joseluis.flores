#$ -q 2014all.q@nodo77
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/01.Horse.Colic/config/Database.01.04.csv ../../bbdd/01.Horse.Colic/04.Final.SCV/3/ ../../experiments/01.Horse.Colic/results.03/04/ ../../experiments/01.Horse.Colic/results.03/04/ 100
cd /home/jlflores/kernel.discretization
