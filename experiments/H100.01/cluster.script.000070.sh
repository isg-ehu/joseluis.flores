#$ -q 2014all.q@nodo79
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/01.Horse.Colic/config/Database.01.10.csv ../../bbdd/01.Horse.Colic/04.Final.SCV/7/ ../../experiments/01.Horse.Colic/results.07/10/ ../../experiments/01.Horse.Colic/results.07/10/ 100 &
cd /home/jlflores/kernel.discretization
