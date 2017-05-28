#$ -q 2014all.q@nodo79
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/01.Horse.Colic/config/Database.01.10.csv ../../bbdd/01.Horse.Colic/04.Final.SCV/5/ ../../experiments/01.Horse.Colic/results.05/10/ ../../experiments/01.Horse.Colic/results.05/10/ 100 &
cd /home/jlflores/kernel.discretization
