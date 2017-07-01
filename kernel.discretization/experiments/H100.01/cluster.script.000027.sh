#$ -q 2014all.q@nodo78
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/01.Horse.Colic/config/Database.01.07.csv ../../bbdd/01.Horse.Colic/04.Final.SCV/3/ ../../experiments/01.Horse.Colic/results.03/07/ ../../experiments/01.Horse.Colic/results.03/07/ 100
cd /home/jlflores/kernel.discretization
