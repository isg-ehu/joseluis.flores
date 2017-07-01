#$ -q 2014all.q@nodo77
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/01.Horse.Colic/config/Database.01.02.csv ../../bbdd/01.Horse.Colic/04.Final.SCV/8/ ../../experiments/01.Horse.Colic/results.08/02/ ../../experiments/01.Horse.Colic/results.08/02/ 100
cd /home/jlflores/kernel.discretization
