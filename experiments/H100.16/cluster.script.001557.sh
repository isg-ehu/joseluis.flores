#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/16.Musk1/config/Database.16.07.csv ../../bbdd/16.Musk1/03.Final.SCV/6/ ../../experiments/16.Musk1/results.06/07/ ../../experiments/16.Musk1/results.06/07/ 100
cd /home/jlflores/kernel.discretization
