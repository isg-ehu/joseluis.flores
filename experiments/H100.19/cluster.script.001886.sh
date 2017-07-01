#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/19.Glass2/config/Database.19.06.csv ../../bbdd/19.Glass2/03.Final.SCV/9/ ../../experiments/19.Glass2/results.09/06/ ../../experiments/19.Glass2/results.09/06/ 100
cd /home/jlflores/kernel.discretization
