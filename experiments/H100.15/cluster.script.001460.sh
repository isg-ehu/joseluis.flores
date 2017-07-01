#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/15.SA.Heart/config/Database.15.10.csv ../../bbdd/15.SA.Heart/03.Final.SCV/6/ ../../experiments/15.SA.Heart/results.06/10/ ../../experiments/15.SA.Heart/results.06/10/ 100
cd /home/jlflores/kernel.discretization
