#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/16.Musk1/config/Database.16.05.csv ../../bbdd/16.Musk1/03.Final.SCV/3/ ../../experiments/16.Musk1/results.03/05/ ../../experiments/16.Musk1/results.03/05/ 100
cd /home/jlflores/kernel.discretization
