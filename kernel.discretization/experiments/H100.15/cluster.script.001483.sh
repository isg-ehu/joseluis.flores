#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/15.SA.Heart/config/Database.15.03.csv ../../bbdd/15.SA.Heart/03.Final.SCV/9/ ../../experiments/15.SA.Heart/results.09/03/ ../../experiments/15.SA.Heart/results.09/03/ 100
cd /home/jlflores/kernel.discretization

