#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/19.Glass2/config/Database.19.05.csv ../../bbdd/19.Glass2/03.Final.SCV/7/ ../../experiments/19.Glass2/results.07/05/ ../../experiments/19.Glass2/results.07/05/ 100
cd /home/jlflores/kernel.discretization
