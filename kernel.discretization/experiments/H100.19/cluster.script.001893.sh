#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/19.Glass2/config/Database.19.03.csv ../../bbdd/19.Glass2/03.Final.SCV/10/ ../../experiments/19.Glass2/results.10/03/ ../../experiments/19.Glass2/results.10/03/ 100
cd /home/jlflores/kernel.discretization

