#$ -q 2014all.q@nodo78
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/01.Horse.Colic/config/Database.01.06.csv ../../bbdd/01.Horse.Colic/04.Final.SCV/1/ ../../experiments/01.Horse.Colic/results.01/06/ ../../experiments/01.Horse.Colic/results.01/06/ 100 &
cd /home/jlflores/kernel.discretization
