#$ -q 2014all.q
#$ -j y
cd /home/jlflores/kernel.discretization/src/R/
nohup Rscript K3C.R ../../experiments/06.Ionosphere/config/Database.06.04.csv ../../bbdd/06.Ionosphere/06.Final.SCV/5/ ../../experiments/06.Ionosphere/results.05/04/ ../../experiments/06.Ionosphere/results.05/04/ 100 &
cd /home/jlflores/kernel.discretization
