#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/16.Musk1/config/Database.16.06.csv ../../bbdd/16.Musk1/03.Final.SCV/3/ ../../experiments/16.Musk1/results.03/06/ ../../experiments/16.Musk1/results.03/06/ 100
cd /home/jlflores/kernel.discretization
