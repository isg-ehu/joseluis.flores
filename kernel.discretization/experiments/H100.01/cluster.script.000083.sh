#$ -q 2014all.q@nodo77
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/01.Horse.Colic/config/Database.01.03.csv ../../bbdd/01.Horse.Colic/04.Final.SCV/9/ ../../experiments/01.Horse.Colic/results.09/03/ ../../experiments/01.Horse.Colic/results.09/03/ 100
cd /home/jlflores/kernel.discretization

