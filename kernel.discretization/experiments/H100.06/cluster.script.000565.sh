#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/06.Ionosphere/config/Database.06.05.csv ../../bbdd/06.Ionosphere/06.Final.SCV/7/ ../../experiments/06.Ionosphere/results.07/05/ ../../experiments/06.Ionosphere/results.07/05/ 100
cd /home/jlflores/kernel.discretization
