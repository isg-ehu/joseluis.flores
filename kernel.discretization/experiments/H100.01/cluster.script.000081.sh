#$ -q 2014all.q@nodo77
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/01.Horse.Colic/config/Database.01.01.csv ../../bbdd/01.Horse.Colic/04.Final.SCV/9/ ../../experiments/01.Horse.Colic/results.09/01/ ../../experiments/01.Horse.Colic/results.09/01/ 100 &
cd /home/jlflores/kernel.discretization
