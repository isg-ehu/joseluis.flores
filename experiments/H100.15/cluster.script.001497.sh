#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/15.SA.Heart/config/Database.15.07.csv ../../bbdd/15.SA.Heart/03.Final.SCV/10/ ../../experiments/15.SA.Heart/results.10/07/ ../../experiments/15.SA.Heart/results.10/07/ 100
cd /home/jlflores/kernel.discretization
