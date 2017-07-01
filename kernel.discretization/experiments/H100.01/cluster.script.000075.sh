#$ -q 2014all.q@nodo78
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/01.Horse.Colic/config/Database.01.05.csv ../../bbdd/01.Horse.Colic/04.Final.SCV/8/ ../../experiments/01.Horse.Colic/results.08/05/ ../../experiments/01.Horse.Colic/results.08/05/ 100
cd /home/jlflores/kernel.discretization
