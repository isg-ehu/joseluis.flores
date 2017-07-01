#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/19.Glass2/config/Database.19.07.csv ../../bbdd/19.Glass2/03.Final.SCV/3/ ../../experiments/19.Glass2/results.03/07/ ../../experiments/19.Glass2/results.03/07/ 100
cd /home/jlflores/kernel.discretization
