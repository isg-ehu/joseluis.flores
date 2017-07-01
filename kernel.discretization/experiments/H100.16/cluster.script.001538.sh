#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/16.Musk1/config/Database.16.08.csv ../../bbdd/16.Musk1/03.Final.SCV/4/ ../../experiments/16.Musk1/results.04/08/ ../../experiments/16.Musk1/results.04/08/ 100
cd /home/jlflores/kernel.discretization
