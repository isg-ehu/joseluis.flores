#$ -q 2014all.q@nodo79
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/01.Horse.Colic/config/Database.01.09.csv ../../bbdd/01.Horse.Colic/04.Final.SCV/8/ ../../experiments/01.Horse.Colic/results.08/09/ ../../experiments/01.Horse.Colic/results.08/09/ 100 &
cd /home/jlflores/kernel.discretization
