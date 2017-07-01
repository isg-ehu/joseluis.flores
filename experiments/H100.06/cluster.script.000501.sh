#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/06.Ionosphere/config/Database.06.01.csv ../../bbdd/06.Ionosphere/06.Final.SCV/1/ ../../experiments/06.Ionosphere/results.01/01/ ../../experiments/06.Ionosphere/results.01/01/ 100
cd /home/jlflores/kernel.discretization
